#ifndef CORNER_MAIN_STRUCT_H
#define CORNER_MAIN_STRUCT_H

#include "temp.h"
#include "corner.h"
#include "virtual_timer.h"
#include "stm32f4xx_hal.h"

typedef struct
{
	// Temperature sensors
	TempSensors temp_sensors;

	// Corner identification
	corners_ corner;

	// Handles
	I2C_HandleTypeDef *hi2c;
	CAN_HandleTypeDef *hcan;

	// Timer group
	TimerGroup *tg;

} cornerboard_;

#endif // CORNER_MAIN_STRUCT_H
