/******************************************************************************/
/* File:   HardwareConfiguration.h                                            */
/* Author: Matt Bennett                                                       */
/*                                                                            */
/* Created on March 19, 2015, 7:55 AM                                         */
/******************************************************************************/

#ifndef HARDWARE_CONFIGURATION_H
#define HARDWARE_CONFIGURATION_H

#define TRIS_IN                 (1)
#define TRIS_OUT                (0)
#define USE_ESK
#ifdef USE_ESK
#define ACTIVITY_LED            LATDbits.LATD0
#define ACTIVITY_LED_DIRECTION  TRISDbits.TRISD0
#define mActivityLEDInvert()    LATDINV=1<<_LATD_LATD0_POSITION
#define LED_STRIP_OUT_DEFAULT   (true)
#define LED_STRIP_OUT           LATGbits.LATG8
#define LED_STRIP_DIRECTION     TRISGbits.TRISG8
#define LED_STRIP_ODC           ODCGbits.ODCG8
#else
#define ACTIVITY_LED            LATAbits.LATA3
#define ACTIVITY_LED_DIRECTION  TRISAbits.TRISA3
#define mActivityLEDInvert()    LATAINV=1<<_LATA_LATA3_POSITION
#define LED_STRIP_OUT_DEFAULT   (true)
#define LED_STRIP_OUT           LATGbits.LATG8
#define LED_STRIP_DIRECTION     TRISGbits.TRISG8
#define LED_STRIP_ODC           ODCGbits.ODCG8
#endif
#ifdef USE_APP_TASKS_ACTIVITY_OUTPUT
    #define APP_TASKS_ACTIVITY_INIT         APP_TASKS_ACTIVITY_CLEAR; TRISDbits.TRISD7=TRIS_OUT
    #define APP_TASKS_ACTIVITY_SET          LATDSET=0x80
    #define APP_TASKS_ACTIVITY_CLEAR        LATDCLR=0x80
#else
    #define APP_TASKS_ACTIVITY_INIT         
    #define APP_TASKS_ACTIVITY_SET          
    #define APP_TASKS_ACTIVITY_CLEAR
#endif
#ifdef STRIP_OUT_5V
    #define mStripOutConfigure()    LED_STRIP_OUT=LED_STRIP_OUT_DEFAULT; \
                                    LED_STRIP_ODC=(true); \
                                    LED_STRIP_DIRECTION=TRIS_OUT
#else
    #define mStripOutConfigure()    LED_STRIP_OUT=LED_STRIP_OUT_DEFAULT; \
                                    LED_STRIP_ODC=(false); \
                                    LED_STRIP_DIRECTION=TRIS_OUT
#endif
#endif    /* HARDWARE_CONFIGURATION_H */
