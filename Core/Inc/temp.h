#pragma once
#include "stm32f4xx_hal.h"

#define TEMP_NUM_SENSORS 8
#define TEMP_INVALID_CHANNEL 0xFF

static inline uint8_t Temp_ChannelBit(uint8_t channel) { return (uint8_t)(1U << channel); }

// TCA9548A I2C mux address (A0-A2 to GND = 0x70)
#define TCA9548A_ADDR (0x70 << 1)

// MLX90614 address and registers
#define MLX90614_ADDR (0x5A << 1)
#define MLX90614_REG_TOBJ1 0x07  // Object temp
#define MLX90614_REG_TAMB 0x06   // Ambient temp

typedef struct {
    I2C_HandleTypeDef* hi2c;
    float temps[TEMP_NUM_SENSORS];  // Last read temperatures (Celsius)
} TempSensors;

typedef enum {
    TEMP_DIAG_STEP_NONE = 0,
    TEMP_DIAG_STEP_INVALID_ARG,
    TEMP_DIAG_STEP_INIT,
    TEMP_DIAG_STEP_MUX_SELECT,
    TEMP_DIAG_STEP_SENSOR_READ,
    TEMP_DIAG_STEP_PEC_MISMATCH,
    TEMP_DIAG_STEP_SENSOR_DATA_ERROR
} TempDiagStep;

typedef struct {
    uint32_t i2c_error_flags;
    uint8_t failed_channels_mask;
    uint8_t channel;
    uint8_t retry_number;
    TempDiagStep step;
} TempDiag;

// Initialize the temp sensor system
HAL_StatusTypeDef Temp_Init(TempSensors* ts, I2C_HandleTypeDef* hi2c, TempDiag* diag);

// Read temperature from a single sensor (0-7)
HAL_StatusTypeDef Temp_ReadOne(TempSensors* ts, uint8_t channel, float* temp_c, TempDiag* diag);

// Read all 8 sensors, stores in ts->temps[]
HAL_StatusTypeDef Temp_ReadAll(TempSensors* ts, TempDiag* diag);
