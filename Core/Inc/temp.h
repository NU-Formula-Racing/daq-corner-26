#pragma once
#include "stm32f4xx_hal.h"

#define TEMP_NUM_SENSORS     8

// TCA9548A I2C mux address (A0-A2 to GND = 0x70)
#define TCA9548A_ADDR        (0x70 << 1)

// MLX90614 address and registers
#define MLX90614_ADDR        (0x5A << 1)
#define MLX90614_REG_TOBJ1   0x07  // Object temp
#define MLX90614_REG_TAMB    0x06  // Ambient temp

typedef struct {
    I2C_HandleTypeDef *hi2c;
    float temps[TEMP_NUM_SENSORS];  // Last read temperatures (Celsius)
} TempSensors;

// Initialize the temp sensor system
HAL_StatusTypeDef Temp_Init(TempSensors *ts, I2C_HandleTypeDef *hi2c);

// Read temperature from a single sensor (0-7)
HAL_StatusTypeDef Temp_ReadOne(TempSensors *ts, uint8_t channel, float *temp_c);

// Read all 8 sensors, stores in ts->temps[]
HAL_StatusTypeDef Temp_ReadAll(TempSensors *ts);
