#include "corner_can.h"

corner_can_ corner_can;

void Corner_Initialize_Can(cornerboard_ *cornerboard)
{
	// Store cornerboard reference
	corner_can.cornerboard = cornerboard;

	// Start CAN
	HAL_CAN_Start(corner_can.cornerboard->hcan);

	// Enable notifications (interrupts) for CAN
	HAL_CAN_ActivateNotification(corner_can.cornerboard->hcan, CAN_IT_RX_FIFO0_MSG_PENDING);
        
    //    int pos = corner_can.cornerboard->corner.corner_pos;

	// Temperature message 1 header initialization (first 4 temps)
	// Base ID 520 (0x208), each corner gets 2 IDs
	corner_can.TxHeaderTemperatures1_.StdId = 520 + (corner_can.cornerboard->corner_pos * 2);
	corner_can.TxHeaderTemperatures1_.IDE = CAN_ID_STD;
	corner_can.TxHeaderTemperatures1_.RTR = CAN_RTR_DATA;
	corner_can.TxHeaderTemperatures1_.DLC = 8;

	// Temperature message 2 header initialization (last 4 temps)
	corner_can.TxHeaderTemperatures2_.StdId = 521 + (corner_can.cornerboard->corner_pos * 2);
	corner_can.TxHeaderTemperatures2_.IDE = CAN_ID_STD;
	corner_can.TxHeaderTemperatures2_.RTR = CAN_RTR_DATA;
	corner_can.TxHeaderTemperatures2_.DLC = 8;
}

uint8_t send_can_messages(CAN_HandleTypeDef *hcan, CAN_TxHeaderTypeDef *TxHeader, uint8_t *data, uint32_t *TxMailBox)
{
	// Send message
	HAL_StatusTypeDef msg_status = HAL_CAN_AddTxMessage(hcan, TxHeader, data, TxMailBox);

	if (msg_status != HAL_OK)
	{
		// Error handling
		return 1;
	}
	return 0;
}

void temp_can_loop()
{
	// Update and send temperature message 1 (first 4 temps)
	populateCorner_TemperatureMessages(corner_can.txDataTemperatures1_, 0);
	send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderTemperatures1_,
	                  corner_can.txDataTemperatures1_, &corner_can.TxMailBox_);

	// Update and send temperature message 2 (last 4 temps)
	populateCorner_TemperatureMessages(corner_can.txDataTemperatures2_, 1);
	send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderTemperatures2_,
	                  corner_can.txDataTemperatures2_, &corner_can.TxMailBox_);
}

void sg_can_loop() {
	populateCorner_SgMessages(corner_can.txDataSg_, 0);
	send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderSg_,
	                  corner_can.txDataSg_, &corner_can.TxMailBox_);
}

void populateCorner_TemperatureMessages(uint8_t *data, int msg_num)
{
	RawCanSignal signals[4];

	// Each message contains 4 temps with 16-bit encoding
	// msg_num 0: temps[0-3], msg_num 1: temps[4-7]
	int offset = msg_num * 4;

	for(int i = 0; i < 4; i++) {
		populateRawMessage(&signals[i], corner_can.cornerboard->temp_sensors.temps[offset + i], 16, 0.01, 0);
	}

	encodeSignals(data, 4, signals[0], signals[1], signals[2], signals[3]);
}

void populateCorner_SgMessages(uint8_t *data, int msg_num)
{
	RawCanSignal signals[3];

	for(int i = 0; i < 3; i++) {
		populateRawMessage(&signals[i], corner_can.cornerboard->spi_rx[i], 0, 1, 0);
	}

	encodeSignals(data, 3, signals[0], signals[1], signals[2]);
}