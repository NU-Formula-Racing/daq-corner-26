#include "sg_driver.h"

float sg_adc_to_newtons(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lut_ *sg_luts) {
    const sg_lut_ *sg_lut = &sg_luts[(int)corner_pos];
    const sg_lut_point_ *sg_points = sg_lut->points;

    if (sg_lut->len < 2) {
        return 0.0f;
    }

    // linearly interpolate the first two points for now
    float b = 0.0f;
    float m = 0.0f;

    if (sg_points[0].adc == sg_points[1].adc) {
        return 0.0f;
    }

    m = (sg_points[1].newtons - sg_points[0].newtons) / (sg_points[1].adc - sg_points[0].adc);
    b = sg_points[1].newtons - m * sg_points[1].adc;

    return m * (float)raw_adc + b;
}