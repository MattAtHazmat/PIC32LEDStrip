/******************************************************************************/
/* File:   FirmwareConfiguration.h                                            */
/* Author: Matt Bennett                                                       */
/*                                                                            */
/* Created on March 19, 2015, 7:55 AM                                         */
/******************************************************************************/

#ifndef FIRMWARE_CONFIGURATION_H
#define FIRMWARE_CONFIGURATION_H

// *****************************************************************************
// Section: Constants and Type Definitions.
// *****************************************************************************

//#define STRIP_OUT_5V
#define ACTIVITY_LED_INTERVAL   10000
#define MAX_AMP                 (100)
#define MIN_AMP                 (1)
#define USE_APP_TASKS_ACTIVITY_OUTPUT

#define UPDATE_MS           (10)
#define COLOR_WHEEL
#ifdef COLOR_WHEEL
    #define HUE_INCREMENT   (11)
    #define INTENSITY       (0x1F)
#endif
#endif    /* FIRMWARE_CONFIGURATION_H */
