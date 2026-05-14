#include "temp.h"
#include <stdio.h>

#define I2C_TIMEOUT 100
#define TEMP_READ_MAX_RETRIES 2

static TempDiag* prepare_diag(TempDiag* diag, TempDiag* fallback, uint8_t channel) {
    TempDiag* d = (diag != NULL) ? diag : fallback;
    d->i2c_error_flags = 0;
    d->failed_channels_mask = 0;
    d->channel = channel;
    d->retry_number = 0;
    d->step = TEMP_DIAG_STEP_NONE;
    return d;
}

static uint8_t crc8_smbus(const uint8_t* data, uint8_t len) {
    uint8_t crc = 0;
    for (uint8_t i = 0; i < len; i++) {
        crc ^= data[i];
        for (uint8_t bit = 0; bit < 8; bit++) {
            if ((crc & 0x80U) != 0U) {
                crc = (uint8_t)((crc << 1) ^ 0x07U);
            } else {
                crc <<= 1;
            }
        }
    }
    return crc;
}

// Select a mux channel (0-7)
static HAL_StatusTypeDef select_mux_channel(TempSensors* ts, uint8_t channel) {
    uint8_t data = 1 << channel;
    return HAL_I2C_Master_Transmit(ts->hi2c, TCA9548A_ADDR, &data, 1, I2C_TIMEOUT);
}

// Convert raw MLX90614 value to Celsius
static float raw_to_celsius(uint16_t raw) { return (raw * 0.02f) - 273.15f; }

// Validate SMBus PEC for a MLX90614 read-word transaction on TOBJ1
// buf is the 3-byte response: [data_lsb, data_msb, pec]
static int mlx90614_pec_ok(const uint8_t* buf) {
    uint8_t pec_data[5] = {MLX90614_ADDR, MLX90614_REG_TOBJ1, (uint8_t)(MLX90614_ADDR | 0x01U),
                           buf[0], buf[1]};
    return crc8_smbus(pec_data, 5) == buf[2];
}

HAL_StatusTypeDef Temp_Init(TempSensors* ts, I2C_HandleTypeDef* hi2c, TempDiag* diag) {
    TempDiag dummy_diag = {0};
    TempDiag* d = prepare_diag(diag, &dummy_diag, TEMP_INVALID_CHANNEL);

    HAL_StatusTypeDef status;

    ts->hi2c = hi2c;
    for (int i = 0; i < TEMP_NUM_SENSORS; i++) {
        ts->temps[i] = 0.0f;
    }

    status = HAL_I2C_IsDeviceReady(hi2c, TCA9548A_ADDR, 3, I2C_TIMEOUT);
    if (status != HAL_OK) {
        d->step = TEMP_DIAG_STEP_INIT;
        d->channel = TEMP_INVALID_CHANNEL;
        d->i2c_error_flags = HAL_I2C_GetError(hi2c);
    }
    return status;
}

HAL_StatusTypeDef Temp_ReadOne(TempSensors* ts, uint8_t channel, float* temp_c, TempDiag* diag) {
    TempDiag dummy_diag = {0};
    TempDiag* d = prepare_diag(diag, &dummy_diag, channel);
    if (channel >= TEMP_NUM_SENSORS) {
        d->failed_channels_mask = 0;
        d->channel = channel;
        printf("Invalid temp sensor channel: %d\n", channel);
        d->step = TEMP_DIAG_STEP_INVALID_ARG;
        return HAL_ERROR;
    }

    HAL_StatusTypeDef status = HAL_ERROR;
    HAL_StatusTypeDef last_status = HAL_ERROR;
    TempDiagStep last_step = TEMP_DIAG_STEP_NONE;
    uint32_t error_flags_accum = 0;

    for (uint8_t attempt = 0; attempt <= TEMP_READ_MAX_RETRIES; attempt++) {
        uint8_t buf[3];
        d->retry_number = attempt;

        status = select_mux_channel(ts, channel);
        if (status != HAL_OK) {
            last_status = status;
            last_step = TEMP_DIAG_STEP_MUX_SELECT;
            error_flags_accum |= HAL_I2C_GetError(ts->hi2c);
            continue;
        }

        status = HAL_I2C_Mem_Read(ts->hi2c, MLX90614_ADDR, MLX90614_REG_TOBJ1, I2C_MEMADD_SIZE_8BIT,
                                  buf, 3, I2C_TIMEOUT);
        if (status != HAL_OK) {
            last_status = status;
            last_step = TEMP_DIAG_STEP_SENSOR_READ;
            error_flags_accum |= HAL_I2C_GetError(ts->hi2c);
            continue;
        }

        if (!mlx90614_pec_ok(buf)) {
            last_status = HAL_ERROR;
            last_step = TEMP_DIAG_STEP_PEC_MISMATCH;
            continue;
        }

        uint16_t raw = (uint16_t)(buf[0] | (buf[1] << 8));
        if ((raw & 0x8000U) != 0U) {
            last_status = HAL_ERROR;
            last_step = TEMP_DIAG_STEP_SENSOR_DATA_ERROR;
            continue;
        }

        raw &= 0x7FFFU;
        *temp_c = raw_to_celsius(raw);
        ts->temps[channel] = *temp_c;
        d->step = TEMP_DIAG_STEP_NONE;
        d->i2c_error_flags = error_flags_accum;
        d->failed_channels_mask = 0;
        return HAL_OK;
    }

    d->failed_channels_mask |= Temp_ChannelBit(channel);
    d->step = last_step;
    d->i2c_error_flags = error_flags_accum;
    switch (last_step) {
        case TEMP_DIAG_STEP_MUX_SELECT:
            // printf("Failed to select mux channel %d\n", channel);
            break;
        case TEMP_DIAG_STEP_SENSOR_READ:
            printf("Failed to read temp sensor %d\n", channel);
            break;
        case TEMP_DIAG_STEP_PEC_MISMATCH:
            printf("PEC mismatch on temp sensor %d\n", channel);
            break;
        case TEMP_DIAG_STEP_SENSOR_DATA_ERROR:
            printf("MLX90614 data error on sensor %d\n", channel);
            break;
        default:
            break;
    }
    return last_status;
}

HAL_StatusTypeDef Temp_ReadAll(TempSensors* ts, TempDiag* diag) {
    TempDiag dummy_diag = {0};
    TempDiag* d = prepare_diag(diag, &dummy_diag, TEMP_INVALID_CHANNEL);
    HAL_StatusTypeDef status;
    HAL_StatusTypeDef first_error_status = HAL_OK;
    uint8_t has_error = 0;
    float temp;
    TempDiag loop_diag = {0};

    for (uint8_t i = 0; i < TEMP_NUM_SENSORS; i++) {
        // printf("Reading temp sensor %d...\n", i);
        status = Temp_ReadOne(ts, i, &temp, &loop_diag);
        if (status != HAL_OK) {
            if (!has_error) {
                *d = loop_diag;
                first_error_status = status;
                has_error = 1;
            } else {
                d->i2c_error_flags |= loop_diag.i2c_error_flags;
                d->failed_channels_mask |= loop_diag.failed_channels_mask;
            }
        }
    }

    return first_error_status;
}
