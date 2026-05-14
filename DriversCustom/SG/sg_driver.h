#ifndef SG_DRIVER_H

#define SG_DRIVER_H
#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "corner_main_struct.h"

#define SG_ARRAY_LEN(arr) ((uint32_t)(sizeof(arr) / sizeof((arr)[0])))

typedef struct {
    int32_t adc;
    float newtons;
} sg_lut_point_;

typedef struct {
   const sg_lut_point_ *points;
   uint32_t len;
} sg_lut_;

static const sg_lut_point_ fl_sg_points[] = {
    {0, 0.0f},
    {0, 0.0f},
};

static const sg_lut_point_ fr_sg_points[] = {
    {0, 0.0f},
    {0, 0.0f},
};

static const sg_lut_point_ bl_sg_points[] = {
    {0, 0.0f},
    {0, 0.0f},
};

static const sg_lut_point_ br_sg_points[] = {
    {0, 0.0f},
    {0, 0.0f},
};

static const sg_lut_ sg_lut[] = {
    // BR
    {
        .points = br_sg_points,
        .len = SG_ARRAY_LEN(br_sg_points),
    },

    // BL
    {
        .points = bl_sg_points,
        .len = SG_ARRAY_LEN(bl_sg_points),
    },

    // FR
    {
        .points = fr_sg_points,
        .len = SG_ARRAY_LEN(fr_sg_points),
    },

    // FL
    {
        .points = fl_sg_points,
        .len = SG_ARRAY_LEN(fl_sg_points),
    }
};

float sg_adc_to_newtons(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lut_ *sg_lut);

#endif