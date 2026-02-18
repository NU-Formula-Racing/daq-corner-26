#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"

void ADS_GPIO_to_EXTI();
void ADS_GPIO_to_SPI();

HAL_StatusTypeDef Read_ADS_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx);
void ADS_Enable_EXTI();
void ADS_Transmit_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx);