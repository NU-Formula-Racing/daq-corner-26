#include "ads_driver.h"

// Switch the MISO pin to EXTI interrupt
void ADS_GPIO_to_EXTI() 
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  GPIO_InitStruct.Pin = GPIO_PIN_6;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

// Switch pin to MISO to pull data
void ADS_GPIO_to_SPI()
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  GPIO_InitStruct.Pin = GPIO_PIN_6;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

HAL_StatusTypeDef Read_ADS_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx) {
  uint8_t spi_tx[4] = {0};
  HAL_StatusTypeDef t = HAL_SPI_TransmitReceive(hspi, spi_tx, spi_rx, 3, 100);
  return t;
  // printf("SPI Transaction Status %d\n", t);
  // if (HAL_SPI_TransmitReceive(hspi, spi_tx, spi_rx, 3, 100) != HAL_OK) {
  //     // Error
  //     printf("ERROR\n");
  // }
}

void ADS_Enable_EXTI() {
    ADS_GPIO_to_EXTI();
    __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_6);
    HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);
}

void ADS_Transmit_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx) {
    HAL_NVIC_DisableIRQ(EXTI9_5_IRQn);
    __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_6);

    // Swap to MISO pin
    ADS_GPIO_to_SPI();

    if (Read_ADS_Data(hspi, spi_rx) != HAL_OK) {
        // Error   
    }
    ADS_Enable_EXTI();
}