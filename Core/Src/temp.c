#include "temp.h"

#define I2C_TIMEOUT 100

// Select a mux channel (0-7)
static HAL_StatusTypeDef select_mux_channel(TempSensors *ts, uint8_t channel) {
    uint8_t data = 1 << channel;
    return HAL_I2C_Master_Transmit(ts->hi2c, TCA9548A_ADDR, &data, 1, I2C_TIMEOUT);
}

// Convert raw MLX90614 value to Celsius
static float raw_to_celsius(uint16_t raw) {
    return (raw * 0.02f) - 273.15f;
}

HAL_StatusTypeDef Temp_Init(TempSensors *ts, I2C_HandleTypeDef *hi2c) {
    ts->hi2c = hi2c;
    for (int i = 0; i < TEMP_NUM_SENSORS; i++) {
        ts->temps[i] = 0.0f;
    }

    // Quick check that mux is responding
    return HAL_I2C_IsDeviceReady(hi2c, TCA9548A_ADDR, 3, I2C_TIMEOUT);
}

HAL_StatusTypeDef Temp_ReadOne(TempSensors *ts, uint8_t channel, float *temp_c) {
    if (channel >= TEMP_NUM_SENSORS) {
        return HAL_ERROR;
    }

    HAL_StatusTypeDef status;

    // Select mux channel
    status = select_mux_channel(ts, channel);
    if (status != HAL_OK) {
        return status;
    }

    // Read object temperature (2 bytes + PEC byte, we ignore PEC)
    uint8_t buf[3];
    status = HAL_I2C_Mem_Read(ts->hi2c, MLX90614_ADDR, MLX90614_REG_TOBJ1,
                              I2C_MEMADD_SIZE_8BIT, buf, 3, I2C_TIMEOUT);
    if (status != HAL_OK) {
        return status;
    }

    uint16_t raw = buf[0] | (buf[1] << 8);
    *temp_c = raw_to_celsius(raw);
    ts->temps[channel] = *temp_c;

    return HAL_OK;
}

HAL_StatusTypeDef Temp_ReadAll(TempSensors *ts) {
    HAL_StatusTypeDef status;
    float temp;

    for (uint8_t i = 0; i < TEMP_NUM_SENSORS; i++) {
        status = Temp_ReadOne(ts, i, &temp);
        if (status != HAL_OK) {
            return status;
        }
    }

    return HAL_OK;
}
