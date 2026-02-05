#include "corner.h"
#include <stdbool.h>

cornerboard_ corners;

void initialize() {

    // Read the position of the corner board
    bool front = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8);
    bool left = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_9);

    corners.corner_pos = (enum CornerPosition)((front << 1) | left);

    VirtualTimer sg_tg = InitializeTimer(500, sg_timer_group);
    VirtualTimer tg1 = InitializeTimer(500, hello_group);
    VirtualTimer tg2 = InitializeTimer(500, placeholder_group);
    VirtualTimer tg3 = InitializeTimer(500, placeholder_group);
    VirtualTimer tg4 = InitializeTimer(500, placeholder_group);
    VirtualTimer total_tg[5] = {sg_tg, tg1, tg2, tg3, tg4};
    corners.tg = InitializeTimerGroup(total_tg);
}

void tick_timers() {
    TickTimer(corners.tg);
}

void sg_timer_group() {
    if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6) == GPIO_PIN_SET) {
        Read_ADC_Data(corners.hspi, corners.spi_rx);
        for (int i=0; i<4; i++) {
            printf("spi_rx[%d] = 0x%02X\n", i, corners.spi_rx[i]);
        }
    }
}

void hello_group() {
    printf("Hello from timer group!\n");
}

void placeholder_group() {

}