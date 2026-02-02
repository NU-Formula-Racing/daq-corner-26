#include "virtual_timer.h"
#include <stdlib.h>
#include <string.h>

VirtualTimer InitializeTimer(uint32_t duration, callback cb) {
    uint32_t start_time = HAL_GetTick();
    VirtualTimer t = {start_time, duration, cb};
    return t;
}

TimerGroup* InitializeTimerGroup(VirtualTimer tg[5]) {
    TimerGroup *new_tg = (TimerGroup *) malloc(sizeof(TimerGroup));
    memcpy(new_tg->tg, tg, sizeof(VirtualTimer) * 5);

    return new_tg;
}

void TickTimer(TimerGroup* tg) {
    uint32_t curr_time = HAL_GetTick();

    for (int i = 0; i < 5; i++) {
        if (curr_time - tg->tg[i].start_time > tg->tg[i].duration) {
            tg->tg[i].cb();
            tg->tg[i].start_time = curr_time;
        }
    }
}