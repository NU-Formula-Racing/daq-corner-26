#include "rtos.h"

QueueHandle_t q = NULL;

static void runJob(void *arg) {
    Task *t = (Task*)arg;

    for (;;) {
        t->job();
        vTaskDelay(pdMS_TO_TICKS(t->periodMs));
    }
}

void createTask(Task *task) {
    BaseType_t ok = xTaskCreate(
        runJob,
        task->name,
        (uint32_t) task->stackSize,
        (void *) task,
        task->priority,
        &task->h
    );
}