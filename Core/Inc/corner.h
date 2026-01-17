#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "virtual_timer.h"
#include "corner_driver.h"

// Position of the corner broker (front, left)
enum CornerPosition {
    BottomRight = 0, // f=0, l=0
    BottomLeft = 1, // f=0, l=1
    FrontRight = 2, // f=1, l=0
    FrontLeft = 3 // f=1, l=1
};

typedef struct {
    // Position of the corner board
    enum CornerPosition corner_pos;

    // Timer group
    TimerGroup *tg;

    // hspi
    SPI_HandleTypeDef* hspi;
    uint8_t spi_buffer[4];
} corners_;


