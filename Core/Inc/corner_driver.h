#include <stdio.h>
#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"

void Read_ADC_Data(SPI_HandleTypeDef *hspi, uint8_t *spi_rx);
void Read_Internal_ADC_Data(ADC_HandleTypeDef *hadc, uint16_t *adc_val);