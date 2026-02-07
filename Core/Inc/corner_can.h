#pragma once

#include "can_driver.h"
#include "corner_main_struct.h"
#include "stm32f4xx_hal.h"

typedef struct
{
	cornerboard_ *cornerboard;

	uint32_t TxMailBox_;

	CAN_RxHeaderTypeDef RxHeader_;
	uint8_t rxData_[8];

	// Temperature CAN messages (2 messages, 4 temps each)
	CAN_TxHeaderTypeDef TxHeaderTemperatures1_;  // First 4 temps
	uint8_t txDataTemperatures1_[8];

	CAN_TxHeaderTypeDef TxHeaderTemperatures2_;  // Last 4 temps
	uint8_t txDataTemperatures2_[8];

	CAN_TxHeaderTypeDef TxHeaderSg_;
	uint8_t txDataSg_[8];
} corner_can_;

void Corner_Initialize_Can(cornerboard_ *cornerboard);

uint8_t send_can_messages(CAN_HandleTypeDef *hcan, CAN_TxHeaderTypeDef *TxHeader, uint8_t *data, uint32_t *TxMailBox);

// CAN Loop
void temp_can_loop();
void sg_can_loop();

void populateCorner_TemperatureMessages(uint8_t *data, int msg_num);
void populateCorner_SgMessages(uint8_t *data, int msg_num);

