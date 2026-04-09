#include "corner_can.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

corner_can_ corner_can;
static uint16_t corner_heartbeat = 0U;

void Corner_Initialize_Can(cornerboard_* cornerboard) {
    // Store cornerboard reference
    corner_can.cornerboard = cornerboard;

    // Start CAN
    printf("HAL_CAN_Start returned: %d\n", HAL_CAN_Start(corner_can.cornerboard->hcan));

    // Enable notifications (interrupts) for CAN
    HAL_CAN_ActivateNotification(corner_can.cornerboard->hcan, CAN_IT_RX_FIFO0_MSG_PENDING);

    //    int pos = corner_can.cornerboard->corner.corner_pos;

    // Temperature message 1 header initialization (first 4 temps)
    // Base ID 0x520, each corner gets 2 IDs
    corner_can.TxHeaderTemperatures1_.StdId = 0x530 + (corner_can.cornerboard->corner_pos * 2);
    corner_can.TxHeaderTemperatures1_.IDE = CAN_ID_STD;
    corner_can.TxHeaderTemperatures1_.RTR = CAN_RTR_DATA;
    corner_can.TxHeaderTemperatures1_.DLC = 8;

    // Temperature message 2 header initialization (last 4 temps)
    corner_can.TxHeaderTemperatures2_.StdId = 0x531 + (corner_can.cornerboard->corner_pos * 2);
    corner_can.TxHeaderTemperatures2_.IDE = CAN_ID_STD;
    corner_can.TxHeaderTemperatures2_.RTR = CAN_RTR_DATA;
    corner_can.TxHeaderTemperatures2_.DLC = 8;

    corner_can.TxHeaderMain_.StdId = 0x538 + (corner_can.cornerboard->corner_pos * 2);
    corner_can.TxHeaderMain_.IDE = CAN_ID_STD;
    corner_can.TxHeaderMain_.RTR = CAN_RTR_DATA;
    corner_can.TxHeaderMain_.DLC = 8;

    // Error status message for corner boards: 0x54_
    corner_can.TxHeaderError_.StdId = 0x540 + corner_can.cornerboard->corner_pos;
    corner_can.TxHeaderError_.IDE = CAN_ID_STD;
    corner_can.TxHeaderError_.RTR = CAN_RTR_DATA;
    corner_can.TxHeaderError_.DLC = 8;
}

uint8_t send_can_messages(CAN_HandleTypeDef* hcan, CAN_TxHeaderTypeDef* TxHeader, uint8_t* data,
                          uint32_t* TxMailBox) {
    // Send message
    if (HAL_CAN_GetTxMailboxesFreeLevel(hcan) > 0) {
        HAL_StatusTypeDef msg_status = HAL_CAN_AddTxMessage(hcan, TxHeader, data, TxMailBox);

        if (msg_status != HAL_OK) {
            printf("Failed to send CAN message. Status: %d\n", msg_status);
            // Error handling
            return 1;

        } else {
            // printf("CAN message sent successfully\n");
        }
    } else {
        printf("No free Tx mailboxes available. Message not sent.\n");
        return 1;  // Indicate failure
    }
    return 0;
}

void temp_can_loop() {
    // Update and send temperature message 1 (first 4 temps)
    populateCorner_TemperatureMessages(corner_can.txDataTemperatures1_, 0);
    send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderTemperatures1_,
                      corner_can.txDataTemperatures1_, &corner_can.TxMailBox_);

    // Update and send temperature message 2 (last 4 temps)
    populateCorner_TemperatureMessages(corner_can.txDataTemperatures2_, 1);
    send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderTemperatures2_,
                      corner_can.txDataTemperatures2_, &corner_can.TxMailBox_);
}

void main_can_loop() {
    populate_Sg_SusPot_Message(corner_can.txDataMain_);
    send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderMain_, corner_can.txDataMain_,
                      &corner_can.TxMailBox_);
}

void error_can_loop() {
    populateCorner_ErrorMessage(corner_can.txDataError_);
    send_can_messages(corner_can.cornerboard->hcan, &corner_can.TxHeaderError_,
                      corner_can.txDataError_, &corner_can.TxMailBox_);
}

void populateCorner_TemperatureMessages(uint8_t* data, int msg_num) {
    RawCanSignal signals[4];

    // Each message contains 4 temps with 16-bit encoding
    // msg_num 0: temps[0-3], msg_num 1: temps[4-7]
    int offset = msg_num * 4;

    for (int i = 0; i < 4; i++) {
        populateRawMessage(&signals[i], corner_can.cornerboard->temp_sensors.temps[offset + i], 16,
                           0.01, 0);
    }

    encodeSignals(data, 4, signals[0], signals[1], signals[2], signals[3]);
}

void populate_Sg_SusPot_Message(uint8_t* data) {
    RawCanSignal signals[2];

    // send strain gauge (bit 0) and sus pot (bit 32) as 32-bit signals in little endian order
    populateRawMessage(&signals[0], (float)corner_can.cornerboard->strain_gauge_data, 32, 1, 0);
    populateRawMessage(&signals[1], (float)corner_can.cornerboard->sus_pot_data, 32, 1, 0);

    encodeSignals(data, 2, signals[0], signals[1]);
}

static uint16_t get_strain_gauge_error(void) {
    // DRDY (PA6) is pulled up; it only falls when the ADS has data ready.
    // If the chip is not connected the EXTI interrupt never fires and the flag
    // stays 0.
    return (corner_can.cornerboard->strain_gauge_received == 0U) ? 1U : 0U;
}

static uint16_t get_sus_pot_error(void) {
    // A successful 12-bit ADC read is always 0-4095.
    // Read_Internal_ADC_Data writes 0xFFFFFFFF when HAL_ADC_PollForConversion
    // fails, so anything > 4095 is the "conversion failed" sentinel.
    return (corner_can.cornerboard->sus_pot_data > 4085U ||
            corner_can.cornerboard->sus_pot_data < 10U)
               ? 1U
               : 0U;
}

static uint16_t get_tire_temp_error(void) {
    // Temp_ReadAll sets temp_any_failed when any channel's I2C read fails
    // (mux select failure, sensor NACK, PEC mismatch, or data-error bit set).
    return corner_can.cornerboard->temp_any_failed ? 1U : 0U;
}

static uint16_t get_corner_heartbeat(void) {
    uint16_t value = corner_heartbeat;
    corner_heartbeat++;
    return value;
}

void populateCorner_ErrorMessage(uint8_t* data) {
    CornerErrorMessage_ error_msg = {.raw = 0};

    error_msg.fields.strain_gauge.bits.fault = get_strain_gauge_error();
    error_msg.fields.sus_pot.bits.fault = get_sus_pot_error();
    error_msg.fields.tire_temp.bits.fault = get_tire_temp_error();
    error_msg.fields.corner_heartbeat.raw = get_corner_heartbeat();

    memcpy(data, error_msg.bytes, sizeof(error_msg.bytes));
}
