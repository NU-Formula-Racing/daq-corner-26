#include "FreeRTOS.h"
#include "task.h"

/* If you use software timers (timers.c), include this: */
#include "timers.h"

/*-----------------------------------------------------------
 *  Malloc failed hook
 *----------------------------------------------------------*/
void vApplicationMallocFailedHook(void)
{
  taskDISABLE_INTERRUPTS();
  for( ;; );
}

/*-----------------------------------------------------------
 *  Stack overflow hook
 *----------------------------------------------------------*/
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
  (void)xTask;
  (void)pcTaskName;
  taskDISABLE_INTERRUPTS();
  for( ;; );
}

/*-----------------------------------------------------------
 *  Static allocation for Idle task
 *  Required if configSUPPORT_STATIC_ALLOCATION == 1
 *----------------------------------------------------------*/
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer,
                                    StackType_t **ppxIdleTaskStackBuffer,
                                    uint32_t *pulIdleTaskStackSize )
{
  static StaticTask_t xIdleTaskTCB;
  static StackType_t uxIdleTaskStack[ configMINIMAL_STACK_SIZE ];

  *ppxIdleTaskTCBBuffer   = &xIdleTaskTCB;
  *ppxIdleTaskStackBuffer = uxIdleTaskStack;
  *pulIdleTaskStackSize   = configMINIMAL_STACK_SIZE;
}

/*-----------------------------------------------------------
 *  Static allocation for Timer task
 *  Required if configUSE_TIMERS == 1 and configSUPPORT_STATIC_ALLOCATION == 1
 *----------------------------------------------------------*/
void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer,
                                     StackType_t **ppxTimerTaskStackBuffer,
                                     uint32_t *pulTimerTaskStackSize )
{
  static StaticTask_t xTimerTaskTCB;
  static StackType_t uxTimerTaskStack[ configTIMER_TASK_STACK_DEPTH ];

  *ppxTimerTaskTCBBuffer   = &xTimerTaskTCB;
  *ppxTimerTaskStackBuffer = uxTimerTaskStack;
  *pulTimerTaskStackSize   = configTIMER_TASK_STACK_DEPTH;
}
