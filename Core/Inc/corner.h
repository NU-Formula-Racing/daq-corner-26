#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "corner_can.h"
#include "corner_driver.h"
#include <math.h>
#include <stdio.h>

void initialize(SPI_HandleTypeDef *hspi, CAN_HandleTypeDef *hcan, I2C_HandleTypeDef *hi2c, ADC_HandleTypeDef *hadc);
void tick_timers();
void sg_timer_group();
void sus_pot_timer_group();
void tire_temp_group();
void placeholder_group();