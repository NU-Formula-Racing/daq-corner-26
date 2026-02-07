#include "corner.h"
#include <stdbool.h>

cornerboard_ corners;

void initialize(SPI_HandleTypeDef *hspi, CAN_HandleTypeDef *hcan, I2C_HandleTypeDef *hi2c) {

    // Read the position of the corner board
    bool front = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8);
    bool left = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_9);

    corners.corner_pos = (enum CornerPosition)((front << 1) | left);

    corners.hspi = hspi;
    corners.hcan = hcan;
    corners.hi2c = hi2c;

    Corner_Initialize_Can(&corners);

    VirtualTimer sg_tg = InitializeTimer(500, sg_timer_group);
    VirtualTimer tg1 = InitializeTimer(500, sg_can_loop);
    VirtualTimer tg2 = InitializeTimer(500, placeholder_group);
    VirtualTimer tg3 = InitializeTimer(500, placeholder_group);
    VirtualTimer tg4 = InitializeTimer(500, placeholder_group);
    VirtualTimer total_tg[5] = {sg_tg, tg1, tg2, tg3, tg4};
    corners.tg = InitializeTimerGroup(total_tg);

    // Set PDWN pin to low
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_RESET);
}

void tick_timers() {
    TickTimer(corners.tg);
}

void sg_timer_group() {
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_SET);
    while (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6) == GPIO_PIN_SET) {}
    Read_ADC_Data(corners.hspi, corners.spi_rx);
    for (int i=0; i<4; i++) {
        printf("spi_rx[%d] = 0x%02X\n", i, corners.spi_rx[i]);
    }
    uint32_t raw = ((int32_t)corners.spi_rx[0] << 16) | ((int32_t)corners.spi_rx[1] << 8) | (int32_t)corners.spi_rx[2];
    int32_t adc_val = (int32_t)(raw << 8) >> 8;
    float voltage = (float)adc_val * (((0.5 * 3.3)/128)/(pow(2, 23) - 1));

    printf("adc val: %ld\n", adc_val);
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_RESET);
}

void placeholder_group() {

}