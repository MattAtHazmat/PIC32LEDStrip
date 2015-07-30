/******************************************************************************/
/* File:   common.h                                                           */
/* Author: mjb                                                                */
/*                                                                            */
/* Created on April 19, 2015, 11:03 AM                                        */
/******************************************************************************/

#ifndef COMMON_H
    #define    COMMON_H
    #ifndef __XC_H
        #include <xc.h>
    #endif
    #ifndef _SYS_STDINT_H_
        #include <stdint.h>
    #endif
    #ifndef _STDBOOL_H
        #include <stdbool.h>
    #endif
    #ifndef __STDDEF_H
        #include <stddef.h>
    #endif
    #ifndef _STDLIB_H_
        #include <stdlib.h>
    #endif
    #include <FirmwareConfiguration.h>
    #include <HardwareConfiguration.h>
    #include <color.h>
    //#include <TM1804.h> /* really should be defined in LEDDisplay.h */
    //#include <LEDDisplay.h>
#else

    #warning "Redundant include of common.h"

#endif    /* COMMON_H                                                            */

