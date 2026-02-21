#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

// configMAX_PRIORITIES set to 7
enum TaskPriority {
    IDLE = tskIDLE_PRIORITY,
    VERY_LOW,
    LOW,
    MEDIUM,
    HIGH,
    VERY_HIGH,
    CRITICAL
};

// Stack size
enum StackSize {
    SMALL = 128,
    MEDIUM = 256,
    BIG = 512
};

// Event type
enum EvType {
    EV_CAN,
    EV_STAIN,
    EV_SUSPOT,
    Ev_TEMP
};

typedef void (*Job)(void);

typedef struct {
    // Execution description
    Job job;
    uint32_t periodMs;
    enum TaskPriority priority;
    const char* name;

    // Allocation
    enum StackSize stackSize;
    TaskHandle_t h;
} Task;

static void runJob(void *arg);
void createTask(Task *task);


// Events and Queues
typedef struct {
    enum EvType ev_type;
    Task task;
} Event;
