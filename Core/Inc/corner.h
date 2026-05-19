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
#define ENABLE_SG_CALIBRATION 1

#define ENABLE_SG_LUT 1

void initialize(SPI_HandleTypeDef* hspi, CAN_HandleTypeDef* hcan, I2C_HandleTypeDef* hi2c,
                ADC_HandleTypeDef* hadc);
void tire_temp_group();
void temp_loop();
void print_group();
void main_loop();
void SG_Receive_Data();

void initQueue();
void event_loop();
