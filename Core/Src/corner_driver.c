#include "corner_driver.h"

void Read_ADC_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx) {
    uint8_t spi_tx[4] = {0};
    HAL_StatusTypeDef t = HAL_SPI_TransmitReceive(hspi, spi_tx, spi_rx, 3, 100);
    printf("%d\n", t);
    // if (HAL_SPI_TransmitReceive(hspi, spi_tx, spi_rx, 3, 100) != HAL_OK) {
    //     // Error
    //     printf("ERROR\n");
    // }
}