#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "corner_can.h"
#include "corner_driver.h"
#include "ads_driver.h"
#include "sg_driver.h"
#include "rtos.h"
#include "temp.h"
#include <math.h>
#include <stdio.h>

// Set to 1 to enable ADC to Newtons conversion, 0 to disable if readings are not yet taken
#define ENABLE_SG_CALIBRATION 0

// Front Left Measurements
#define FL_UNWEIGHTED_ADC 0
#define FL_UNWEIGHTED_NEWTONS 0.0f
#define FL_WEIGHTED_ADC 0
#define FL_WEIGHTED_NEWTONS 0.0f

// Front Right Measurements
#define FR_UNWEIGHTED_ADC 0
#define FR_UNWEIGHTED_NEWTONS 0.0f
#define FR_WEIGHTED_ADC 0
#define FR_WEIGHTED_NEWTONS 0.0f

// Bottom Left Measurements
#define BL_UNWEIGHTED_ADC 0
#define BL_UNWEIGHTED_NEWTONS 0.0f
#define BL_WEIGHTED_ADC 0
#define BL_WEIGHTED_NEWTONS 0.0f

// Bottom Right Measurements
#define BR_UNWEIGHTED_ADC 0
#define BR_UNWEIGHTED_NEWTONS 0.0f
#define BR_WEIGHTED_ADC 0
#define BR_WEIGHTED_NEWTONS 0.0f

void initialize(SPI_HandleTypeDef* hspi, CAN_HandleTypeDef* hcan, I2C_HandleTypeDef* hi2c,
                ADC_HandleTypeDef* hadc);
void tire_temp_group();
void temp_loop();
void print_group();
void main_loop();
void SG_Receive_Data();
float sg_adc_to_newtons(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lut_ *sg_lut);

void initQueue();
void event_loop();
