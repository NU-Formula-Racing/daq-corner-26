#include "rtos.h"

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

static QueueHandle_t q;

void initQueue() {
    q = xQueueCreate(16, sizeof(Event));
}

void eventLoop() {
    Event out;
    if (xQueueReceive(q, &out, 0) == pdPASS) {
        out.task.job();
    }
}