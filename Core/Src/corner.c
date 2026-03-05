#include "corner.h"
#include <stdbool.h>
#include <stdio.h>

cornerboard_ corners;

// Task structures
static Task sus_pot_task = {&sus_pot_loop, 30, MEDIUM, "sus_pot", STACK_MEDIUM, NULL};
static Task print_task = {&print_group, 500, MEDIUM, "print", STACK_MEDIUM, NULL};
static Task main_loop_task = {&event_loop, 50, HIGH, "main_event", STACK_BIG, NULL};
static Task temp_task = {&temp_loop, 1000, MEDIUM, "temp", STACK_MEDIUM, NULL};
static Task can_main_task = {&main_loop, 30, HIGH, "can_main", STACK_MEDIUM, NULL};

void initialize(SPI_HandleTypeDef *hspi, CAN_HandleTypeDef *hcan,
                I2C_HandleTypeDef *hi2c, ADC_HandleTypeDef *hadc) {
  printf("Initializing cornerboard...\n");
  fflush(stdout);
  initQueue();

  // Read the position of the corner board
  bool front = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8);
  bool left = HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_9);

  corners.corner_pos = (enum CornerPosition)((front << 1) | left);

  corners.hspi = hspi;
  corners.hcan = hcan;
  corners.hi2c = hi2c;
  corners.hadc = hadc;

  Corner_Initialize_Can(&corners);
  Temp_Init(&corners.temp_sensors, hi2c, NULL);

  // Initialize RTOS tasks
  printf("Creating RTOS tasks...\n");
  fflush(stdout);
  createTask(&sus_pot_task);
  createTask(&print_task);
  createTask(&main_loop_task);
  createTask(&temp_task);
  createTask(&can_main_task);

  // Set PDWN pin to low
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_SET);

  // set red LED to on to indicate initialization is happening
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_SET);

  ADS_Enable_EXTI();
  printf("Initialization complete. Starting scheduler...\n");
  fflush(stdout);
}

void tire_temp_group() {
  corners.temp_any_failed = (Temp_ReadAll(&corners.temp_sensors, NULL) != HAL_OK) ? 1U : 0U;
}

void temp_loop() {
  tire_temp_group();
  temp_can_loop();
}

void main_loop() {
  Read_Internal_ADC_Data(corners.hadc, &corners.sus_pot_data);
  main_can_loop();
}

void print_group() {
  // Toggle RED LED as a heartbeat to see if tasks are firing
  HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0);

  printf("--- Heartbeat --- Corner Position: %d\n", corners.corner_pos);
  printf("Strain Gauge Reading: %ld\n", corners.strain_gauge_data);
  printf("Suspension Potentiometer ADC Value: %ld\n", corners.sus_pot_data);
  for (int i = 0; i < TEMP_NUM_SENSORS; i++) {
    printf("Temp Sensor %d: %d C\n", i, (int)corners.temp_sensors.temps[i]);
  }
  printf("\n\n");
  fflush(stdout);
}

void sus_pot_loop() {
  // sus_pot_loop seems redundant if main_loop already reads ADC,
  // but keeping it if it's meant to be separate.
  // Original sus_pot_loop sends EV_SUSPOT to event_loop.
  Event sp_e = {EV_SUSPOT, NULL}; // NULL job because event_loop handles it via enum
  xQueueSend(q, &sp_e, 0);
}

void SG_Receive_Data() {
  uint8_t spi_rx[4] = {0};
  ADS_Transmit_Data(corners.hspi, spi_rx);
  int32_t raw = ((spi_rx[0] << 24) | (spi_rx[1] << 16) | spi_rx[2] << 8) >> 8;
  corners.strain_gauge_data = raw;
  corners.strain_gauge_received = 1U;
}

void initQueue() { q = xQueueCreate(16, sizeof(Event)); }

void event_loop() {
    Event out;
    if (xQueueReceive(q, &out, pdMS_TO_TICKS(50)) == pdPASS) {
        if (out.ev_type == EV_STRAIN) {
            SG_Receive_Data();
        } else if (out.ev_type == EV_SUSPOT) {
            // Handled in main_loop now, but keeping for compatibility
        } else if (out.job != NULL) {
            out.job();
        }
    }
}
