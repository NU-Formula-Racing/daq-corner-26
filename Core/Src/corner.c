#include "corner.h"
#include <stdbool.h>
#include <stdio.h>

cornerboard_ corners;

static void led_loop(void);
static void update_status_leds(void);

// Task structures
static Task sus_pot_task = {&sus_pot_loop, 30, MEDIUM, "sus_pot", STACK_MEDIUM, NULL};
static Task print_task = {&print_group, 500, MEDIUM, "print", STACK_MEDIUM, NULL};
static Task main_loop_task = {&event_loop, 50, HIGH, "main_event", STACK_BIG, NULL};
static Task temp_task = {&temp_loop, 1000, MEDIUM, "temp", STACK_MEDIUM, NULL};
static Task can_error_task = {&error_can_loop, 1000, MEDIUM, "can_error", STACK_MEDIUM, NULL};
static Task can_main_task = {&main_loop, 30, HIGH, "can_main", STACK_MEDIUM, NULL};
static Task led_task = {&led_loop, 50, MEDIUM, "led_status", STACK_SMALL, NULL};

static bool sus_pot_connected(void) {
    return corners.sus_pot_data >= 10U && corners.sus_pot_data <= 4085U;
}

static void update_status_leds(void) {
    // PC5 indicates strain gauge connectivity.
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5,
                      corners.strain_gauge_received ? GPIO_PIN_SET : GPIO_PIN_RESET);

    // PB0 indicates suspension potentiometer connectivity.
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, sus_pot_connected() ? GPIO_PIN_SET : GPIO_PIN_RESET);
}

static void led_loop(void) {
    // PC4 blinks 1-4 times to encode corner:
    // BottomRight=1, BottomLeft=2, FrontRight=3, FrontLeft=4.
    static uint8_t blinks_done = 0U;
    static bool indicator_on = false;
    static TickType_t last_transition = 0U;

    const TickType_t on_time = pdMS_TO_TICKS(150);
    const TickType_t off_time = pdMS_TO_TICKS(150);
    const TickType_t cycle_gap = pdMS_TO_TICKS(700);

    uint8_t blinks_target = (uint8_t)corners.corner_pos + 1U;
    TickType_t now = xTaskGetTickCount();

    update_status_leds();

    if (last_transition == 0U) {
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_RESET);
        last_transition = now;
        return;
    }

    if (indicator_on) {
        if ((now - last_transition) >= on_time) {
            HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_RESET);
            indicator_on = false;
            blinks_done++;
            last_transition = now;
        }
        return;
    }

    TickType_t wait_time = (blinks_done >= blinks_target) ? cycle_gap : off_time;
    if ((now - last_transition) >= wait_time) {
        if (blinks_done >= blinks_target) {
            blinks_done = 0U;
        }
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_SET);
        indicator_on = true;
        last_transition = now;
    }
}

void initialize(SPI_HandleTypeDef* hspi, CAN_HandleTypeDef* hcan, I2C_HandleTypeDef* hi2c,
                ADC_HandleTypeDef* hadc) {
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
    HAL_StatusTypeDef status = Temp_Init(&corners.temp_sensors, hi2c, NULL);
    if (status != HAL_OK) {
        printf("Failed to initialize temperature sensors! Status: %d\n", status);
    } else {
        printf("Temperature sensors initialized successfully.\n");
    }

    // Initialize RTOS tasks
    printf("Creating RTOS tasks...\n");
    fflush(stdout);
    createTask(&sus_pot_task);
    createTask(&print_task);
    createTask(&main_loop_task);
    createTask(&temp_task);
    createTask(&can_error_task);
    createTask(&can_main_task);
    createTask(&led_task);

    // Set PDWN pin to low
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_0, GPIO_PIN_SET);

    // LEDs are controlled in led_loop():
    //   PC4 = corner blink code, PC5 = strain gauge connected, PB0 = sus pot connected.
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_4, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_RESET);

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
    Event sp_e = {EV_SUSPOT, NULL};  // NULL job because event_loop handles it via enum
    xQueueSend(q, &sp_e, 0);
}

void SG_Receive_Data() {
    uint8_t spi_rx[4] = {0};
    ADS_Transmit_Data(corners.hspi, spi_rx);
    int32_t raw = ((spi_rx[0] << 24) | (spi_rx[1] << 16) | spi_rx[2] << 8) >> 8;
    corners.strain_gauge_data = raw;
    corners.strain_gauge_received = (raw >= 0x7FFFFF) ? 0U : 1U;
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
