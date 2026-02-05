#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "corner_main_struct.h"
#include "corner_driver.h"

void initialize();
void tick_timers();
void sg_timer_group();
void hello_group();
void placeholder_group();