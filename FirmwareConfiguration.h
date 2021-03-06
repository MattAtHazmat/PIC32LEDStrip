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
#define NUMBER_PIXELS           (61)
#define UPDATE_MS               (10)
#define RAW_BUFFER_SIZE         (3*8*NUMBER_PIXELS+LED_STRIP_RESET_BITS)
#define HUE_INCREMENT           (1)
#define INTENSITY               (0x1F)

#endif    /* FIRMWARE_CONFIGURATION_H */
