#include "corner.h"
#include <stdbool.h>

cornerboard_ corners;

void initialize(SPI_HandleTypeDef *hspi, CAN_HandleTypeDef *hcan, I2C_HandleTypeDef *hi2c, ADC_HandleTypeDef *hadc) {

    // Read the position of the corner board
    bool front = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8);
    bool left = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_9);

    corners.corner_pos = (enum CornerPosition)((front << 1) | left);

    corners.hspi = hspi;
    corners.hcan = hcan;
    corners.hi2c = hi2c;
    corners.hadc = hadc;

    Corner_Initialize_Can(&corners);

    VirtualTimer tg1 = InitializeTimer(30, sg_timer_group);
    VirtualTimer tg2 = InitializeTimer(30, sus_pot_timer_group);
    VirtualTimer tg3 = InitializeTimer(30, main_can_loop);
    VirtualTimer tg4 = InitializeTimer(1000, tire_temp_group);
    VirtualTimer tg5 = InitializeTimer(500, print_group);
    VirtualTimer tg6 = InitializeTimer(1000, temp_can_loop);
    VirtualTimer total_tg[6] = {tg1, tg2, tg3, tg4, tg5, tg6};
    corners.tg = InitializeTimerGroup(total_tg);

    // Set PDWN pin to low
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_SET);

    if (Temp_Init(&corners.temp_sensors, corners.hi2c) != HAL_OK) {
        printf("Failed to initialize temperature sensors\n");
    } else {
        printf("Temperature sensors initialized successfully\n");
    }
}

void tick_timers() {
    TickTimer(corners.tg);
}

void sg_timer_group() {
    // printf("DRDY pin: %d\n", HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6));
    // while (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6) == GPIO_PIN_SET) {}
    while (1) {
        if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6) == GPIO_PIN_RESET) {
            HAL_Delay(1);
            if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_6) == GPIO_PIN_RESET) {
                break;
            }
            // printf("False DRDY trigger, waiting for next one...\n");
        }
    }
    uint8_t spi_rx[4] = {0};
    Read_ADC_Data(corners.hspi, spi_rx);
    
    // for (int i=0; i<4; i++) {
    //     printf("spi_rx[%d] = 0x%02X\n", i, corners.spi_rx[i]);
    // }
    int32_t raw = ((spi_rx[0] << 24) | (spi_rx[1] << 16) | spi_rx[2] << 8) >> 8;
    // if raw is close to zero, print
    // printf("Strain Gauge Raw Value: %ld\n", raw);
    if (raw > -1000 && raw < 1000) {
        // printf("oops, raw is close to zero!\n");
        // while(1);
    }
    corners.strain_gauge_data = raw;

    // printf("adc val: %ld\n", adc_val);
}

void sus_pot_timer_group() {
    Read_Internal_ADC_Data(corners.hadc, &corners.sus_pot_data);
}

void tire_temp_group() {
    Temp_ReadAll(&corners.temp_sensors);
}

void print_group() {
    printf("Corner Position: %d\n", corners.corner_pos);
    printf("Strain Gauge Reading: %ld\n", corners.strain_gauge_data);
    printf("Suspension Potentiometer ADC Value: %ld\n", corners.sus_pot_data);
    for (int i = 0; i < TEMP_NUM_SENSORS; i++) {
        printf("Temp Sensor %d: %d C\n", i, (int)corners.temp_sensors.temps[i]);
    }
    printf("\n\n");
}