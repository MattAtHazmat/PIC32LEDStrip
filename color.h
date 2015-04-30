/* 
 * File:   color.h
 * Author: mjb
 *
 * Created on April 24, 2015, 5:26 PM
 */

#ifndef COLOR_H
    #define	COLOR_H

typedef union {
    uint32_t w;
    struct { 
        uint8_t red;
        uint8_t green;
        uint8_t blue;
        uint8_t :8;
    };
}RGB_COLOR_TYPE;

typedef union {
    uint32_t w;
    struct {
        uint8_t hue;
        uint8_t saturation;
        uint8_t value;
        uint8_t :8;
    };
}HSV_COLOR_TYPE;



/******************************************************************************/

HSV_COLOR_TYPE RGBtoHSV(RGB_COLOR_TYPE);
void HSVtoRGB(HSV_COLOR_TYPE,RGB_COLOR_TYPE*);
    
#else

    #warning "Redundant include of color.h"

#endif	/* COLOR_H */

