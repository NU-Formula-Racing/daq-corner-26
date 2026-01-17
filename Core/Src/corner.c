#include "corner.h"

corners_ corners;

void initialize() {

    // Read the position of the corner board
    bool front = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8);
    bool left = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_9);

    corners.corner_pos = (enum CornerPosition)((front << 1) | left);

    VirtualTimer adc_timer = InitializeTimer(500, sg_loop);
    VirtualTimer t2 = InitializeTimer(500, blank);
    VirtualTimer t3 = InitializeTimer(500, blank);
    VirtualTimer t4 = InitializeTimer(500, blank);
    VirtualTimer t5 = InitializeTimer(500, blank);
    TimerGroup timers[5] = {adc_timer, t2, t3, t4, t5};
    corners.tg = InitializeTimerGroup(timers);
}

void sg_loop() {
    bool drdy_pin = HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6);

    if (drdy_pin == GPIO_PIN_RESET) { // When DRDY pin drives low, begin shifting data
        Read_ADC_Data(corners.hspi, corners.spi_buffer);
    }

    uint32_t raw = (corners.spi_buffer[0] << 16) | (corners.spi_buffer[1] << 8) | (corners.spi_buffer[2]);

    
}

void blank(){}