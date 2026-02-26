#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "ads_driver.h"

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
    STACK_SMALL = 128,
    STACK_MEDIUM = 256,
    STACK_BIG = 512
};

// Event type
enum EvType {
    EV_CAN,
    EV_STRAIN,
    EV_SUSPOT,
    EV_TEMP
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

void createTask(Task *task);


// Events and Queues
typedef struct {
    enum EvType ev_type;
    Job job;
} Event;


extern QueueHandle_t q; 