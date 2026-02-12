#include "stm32f4xx_hal.h"

typedef void (*callback)();

typedef struct {
    uint32_t start_time;
    uint32_t duration;
    callback cb;
} VirtualTimer;

typedef struct {
    VirtualTimer tg[6];
} TimerGroup;

VirtualTimer InitializeTimer(uint32_t duration, callback cb);
TimerGroup* InitializeTimerGroup(VirtualTimer tg[6]);

void TickTimer(TimerGroup *tg);