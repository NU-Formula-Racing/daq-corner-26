#ifndef CORNER_MAIN_STRUCT_H
#define CORNER_MAIN_STRUCT_H

#include "temp.h"
#include "virtual_timer.h"
#include "stm32f4xx_hal.h"

// Position of the corner broker (front, left)
enum CornerPosition {
    BottomRight = 0, // f=0, l=0
    BottomLeft = 1, // f=0, l=1
    FrontRight = 2, // f=1, l=0
    FrontLeft = 3 // f=1, l=1
};

typedef struct
{
	// Temperature sensors
	TempSensors temp_sensors;

	// Handles
	I2C_HandleTypeDef *hi2c;
	CAN_HandleTypeDef *hcan;
	SPI_HandleTypeDef *hspi;
	ADC_HandleTypeDef *hadc;
	
	// Buffers
	int32_t strain_gauge_data;
	uint32_t sus_pot_data;

	// Timer group
	TimerGroup *tg;

	enum CornerPosition corner_pos;

} cornerboard_;

#endif // CORNER_MAIN_STRUCT_H
