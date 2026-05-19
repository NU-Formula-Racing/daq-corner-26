#ifndef SG_DRIVER_H

#define SG_DRIVER_H
#include "stm32f4xx_hal.h"
#include "stm32f405xx.h"
#include "stm32f4xx_hal_gpio.h"
#include "corner_main_struct.h"

#define SG_ARRAY_LEN(arr) ((uint32_t)(sizeof(arr) / sizeof((arr)[0])))
#define LBS_TO_NEWTONS_VALUE 4.44822f

typedef struct {
    int32_t adc;
    float newtons;
} sg_lut_point_;

typedef struct {
   const sg_lut_point_ *points;
   uint32_t len;
} sg_lut_;

typedef struct {
    float m;
    float b;
} sg_lobf_;

static const sg_lut_point_ fl_sg_points[] = {
    {-273844, 285.0f},
    {-113063, 210.0f},
    {-52763, 162.0f},
    {5550, 75.0f},
    {66000, 82.0f},
    {148500, 18.0f},
};

static const sg_lut_point_ fr_sg_points[] = {
    {-646357, 210.0f},
    {-600674, 273.0f},
    {-548739, 164.0f},
    {-355900, 76.0f},
    {-351000, 72.0f},
    {-283500, 16.0f},
};

static const sg_lut_point_ bl_sg_points[] = {
    {28427, 213.0f},
    {212218, 184.0f},
    {897105, 109.0f},
    {942500, 93.0f},
    {1078500, 81.0f},
    {1486400, 23.0f},
};

static const sg_lut_point_ br_sg_points[] = {
    {-96639, 209.0f},
    {-5951, 176.0f},
    {42836, 107.0f},
    {694000, 107.0f},
    {710000, 88.0f},
    {1196200, 30.0f},
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

static const sg_lobf_ sg_lobf[] = {
    // BR
    {
        .m = -1.29e-4f,
        .b = 182.0f,
    },

    // BL
    {
        .m = -1.27e-4f,
        .b = 215.0f,
    },

    // FR
    {
        .m = -6.02e-4f,
        .b = -145.0f,
    },

    // FL
    {
        .m = -6.47e-4f,
        .b = 120.0f,
    },
};

float sg_adc_to_newtons_lut(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lut_ *sg_luts);
float sg_adc_to_newtons_lobf(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lobf_ *sg_lobf);

#endif
