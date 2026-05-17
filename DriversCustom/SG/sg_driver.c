#include "sg_driver.h"

float sg_adc_to_newtons(int32_t raw_adc, enum CornerPosition corner_pos, const sg_lut_ *sg_luts) {
    const sg_lut_ *sg_lut = &sg_luts[(int)corner_pos];
    const sg_lut_point_ *sg_points = sg_lut->points;
    uint32_t len = sg_lut->len;

    if (len < 2) {
        return 0.0f;
    }

    uint32_t idx = 0;

    // Find the correct segment
    // If raw_adc is less than the first point, idx remains 0 (extrapolate downwards).
    // If raw_adc is greater than the last point, idx becomes len - 2 (extrapolate upwards).
    if (raw_adc >= sg_points[len - 1].adc) {
        idx = len - 2;
    } else {
        for (uint32_t i = 0; i < len - 1; i++) {
            if (raw_adc >= sg_points[i].adc && raw_adc < sg_points[i + 1].adc) {
                idx = i;
                break;
            }
        }
    }

    float x0 = (float)sg_points[idx].adc;
    float y0 = sg_points[idx].newtons;
    float x1 = (float)sg_points[idx + 1].adc;
    float y1 = sg_points[idx + 1].newtons;

    // Prevent division by zero if ADC values are identical
    if (x0 == x1) {
        return 0.0f;
    }

    float m = (y1 - y0) / (x1 - x0);
    return y0 + m * ((float)raw_adc - x0);
}
