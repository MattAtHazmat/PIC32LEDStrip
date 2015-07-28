/* 
 * File:   LEDDisplay.h
 * Author: C13349
 *
 * Created on July 28, 2015, 7:16 AM
 */

#ifndef LEDDISPLAY_H
#define	LEDDISPLAY_H

/* sparkfun COM-13304 */
/* https://www.sparkfun.com/products/13304 */
/* 256 WS2812B LEDs */
#include <WS2812.h>
#define NUMBER_COLUMNS  (32)
#define NUMBER_ROWS     (8)
#define SIMULTANEOUS_COLORS (8)

typedef struct {
    uint8_t matrix[NUMBER_ROWS][NUMBER_COLUMNS];
    RGB_COLOR_TYPE colorMap[SIMULTANEOUS_COLORS];
    //struct
}DISPLAY_TYPE;

#endif	/* LEDDISPLAY_H */

