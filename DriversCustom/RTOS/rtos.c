#include <stdio.h>
#include "rtos.h"

QueueHandle_t q = NULL;

static void runJob(void *arg) {
    Task *t = (Task*)arg;
    if (t == NULL || t->job == NULL) {
        printf("Task started with NULL job! Suspending.\n");
        fflush(stdout);
        vTaskSuspend(NULL);
    }
    printf("Task %s started\n", t->name);
    fflush(stdout);

    for (;;) {
        t->job();
        vTaskDelay(pdMS_TO_TICKS(t->periodMs));
    }
}

void createTask(Task *task) {
    printf("Creating task: %s\n", task->name);
    fflush(stdout);
    BaseType_t status = xTaskCreate(
        runJob,
        task->name,
        (uint32_t) task->stackSize,
        (void *) task,
        task->priority,
        &task->h
    );

    if (status != pdPASS) {
        printf("FAILED to create task %s\n", task->name);
        fflush(stdout);
    }
}