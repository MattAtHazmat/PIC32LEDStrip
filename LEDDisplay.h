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
#define MAP_MASK    (0b00000111) /* log base2 of SIMULTANEOUS_COLORS */

typedef struct {
    union {
        uint8_t matrix[NUMBER_ROWS][NUMBER_COLUMNS];
        uint8_t vector[NUMBER_ROWS * NUMBER_COLUMNS];
    };
    RGB_COLOR_TYPE colorMap[SIMULTANEOUS_COLORS];
    DRV_HANDLE SPIHandle;
    DRV_SPI_BUFFER_HANDLE handle;
}DISPLAY_TYPE;

#endif	/* LEDDISPLAY_H */

