/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************
#include <common.h>
#include <TM1804.h>
#include "app.h"


// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    memset(&appData,0,sizeof(appData));
    mStripOutConfigure();
    ACTIVITY_LED_DIRECTION=TRIS_OUT;
    appData.state = APP_STATE_INIT;
    appData.activityLED.interval=ACTIVITY_LED_INTERVAL;
    APP_TASKS_ACTIVITY_INIT;
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    /* Check the application's current state. */
    APP_TASKS_ACTIVITY_SET;
    static uint32_t index;
    static uint32_t colorIndex=0;
    switch ( appData.state )
    {
        case APP_STATE_INIT:
        {
            appData.LED.SPIHandle = DRV_SPI_Open(DRV_SPI_INDEX_0,
                                                 DRV_IO_INTENT_EXCLUSIVE |
                                                 DRV_IO_INTENT_WRITE |
                                                 DRV_IO_INTENT_NONBLOCKING
                                            );
            #ifdef RGB_FADE_UP_DOWN
            appData.LED.increase=true;
            appData.LED.redIncrement=true;
            appData.LED.greenIncrement=false;
            appData.LED.blueIncrement=false;
            #endif
            index=0;
            if( DRV_HANDLE_INVALID == appData.LED.SPIHandle )
            {
                appData.state=APP_STATE_ERROR;
            }
            else
            {
                appData.state=APP_STATE_RUN;
            }
            break;
        }
        case APP_STATE_RUN:
        {
            for(appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
            {
                appData.LED.pixel[appData.LED.pixelIndex].w=0;
                if(appData.LED.pixelIndex==index)
                {
                    if(colorIndex==0)
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.red=255;
                    }
                    else if (colorIndex==1)
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.green=255;
                    }
                    else
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.blue=255;
                    }

                }
            }
            #ifdef RGB_FADE_UP_DOWN
            for(appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
            {                
                if(appData.LED.redIncrement==true)
                {
                    if(appData.LED.increase==true)
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.red++;
                    }
                    else
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.red--;
                    }
                }
                if (appData.LED.greenIncrement==true)
                {
                    if(appData.LED.increase==true)
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.green++;
                    }
                    else
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.green--;
                    }
                }
                if(appData.LED.blueIncrement==true)
                {
                    if(appData.LED.increase==true)
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.blue++;
                    }
                    else
                    {
                        appData.LED.pixel[appData.LED.pixelIndex].color.blue--;
                    }
                }
            }
            #endif
            appData.state=APP_STATE_SEND_PIXEL;
        }
        case APP_STATE_SEND_PIXEL:
        {
            uint32_t index=0;
            uint32_t raw;
            for (appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
            {
                PopulatePixel(&appData.LED.pixel[appData.LED.pixelIndex],
                              &appData.LED.rawLED[index]);
                index=index+24;
            }
            for(raw=0;raw<LED_STRIP_RESET_BITS;raw++)
            {
                appData.LED.rawLED[raw]=0;
                index++;
            }
            appData.LED.handle = DRV_SPI_BufferAddWrite (
                    appData.LED.SPIHandle,
                    &appData.LED.rawLED,
                    index,
                    NULL,
                    NULL);
            appData.state=APP_STATE_WAIT;
            break;
        }
        case APP_STATE_WAIT:
        {
            switch(DRV_SPI_BufferStatus(appData.LED.handle))
            {
                case DRV_SPI_BUFFER_EVENT_PENDING:
                {
                    break;
                }
                case DRV_SPI_BUFFER_EVENT_PROCESSING:
                {
                    break;
                }
                case DRV_SPI_BUFFER_EVENT_COMPLETE:
                {        
                    if(++index==NUMBER_PIXELS)
                    {
                        index=0;
                        if(++colorIndex==3)
                        {
                            colorIndex=0;
                        }
                    }
                    uint32_t counter=0;
                    for (counter=0;counter<100000;counter++)
                    {
                        PORTA=counter;
                    }
                    #ifdef RGB_FADE_UP_DOWN
                    if(appData.LED.increase)
                    {
                        if((appData.LED.pixel[0].color.red==MAX_AMP)||
                           (appData.LED.pixel[0].color.green==MAX_AMP)||
                           (appData.LED.pixel[0].color.blue==MAX_AMP))
                        {
                            appData.LED.increase=false;
                        }
                    }
                    else if ((appData.LED.pixel[0].color.red==MIN_AMP)||
                             (appData.LED.pixel[0].color.green==MIN_AMP)||
                             (appData.LED.pixel[0].color.blue==MIN_AMP))
                    {
                        appData.LED.increase=true;
                        for(appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
                        {
                            appData.LED.pixel[appData.LED.pixelIndex].w=0;
                        }
                        if(appData.LED.redIncrement)
                        {
                            appData.LED.redIncrement=false;
                            appData.LED.greenIncrement=true;
                            appData.LED.blueIncrement=false;
                        }
                        else if (appData.LED.greenIncrement)
                        {
                            appData.LED.redIncrement=false;
                            appData.LED.greenIncrement=false;
                            appData.LED.blueIncrement=true;
                        }
                        else //if (appData.LED.blueIncrement)
                        {
                            appData.LED.greenIncrement=false;
                            appData.LED.blueIncrement=false;
                            appData.LED.redIncrement=true;
                        }
                    }
                    #endif
                    appData.state=APP_STATE_RUN;
                    break;
                }
                case DRV_SPI_BUFFER_EVENT_ERROR:
                {
                    appData.state=APP_STATE_ERROR;
                    break;
                }
                default:
                {
                    break;
                }
            }
            break;
        }
        case APP_STATE_ERROR:
        {
            break;
        }
        default:
        {
            /* shouldn't get here. */
            APP_Initialize();
            break;
        }
    }
    if(appData.activityLED.blinkCount++>appData.activityLED.interval)
    {
        mActivityLEDInvert();
        appData.activityLED.blinkCount=0;
    }
    APP_TASKS_ACTIVITY_CLEAR;
    
}
/******************************************************************************/
void PopulatePixel(LED_TYPE *pixel, uint8_t *toSend )
{
    uint32_t toSendIndex=0;
    uint32_t index;
    uint8_t mask=0x80;
    /* send red*/
    for (index=8;index!=0;index--)
    {
        if(pixel->color.red&mask)
        {
            toSend[toSendIndex]=LED_STRIP_ONE;
        }
        else
        {
            toSend[toSendIndex]=LED_STRIP_ZERO;
        }
        mask >>=1;
        toSendIndex++;
    }
    mask=0x80;
    /* send green*/
    for (index=8;index!=0;index--)
    {
        if(pixel->color.green&mask)
        {
            toSend[toSendIndex]=LED_STRIP_ONE;
        }
        else
        {
            toSend[toSendIndex]=LED_STRIP_ZERO;
        }
        mask >>=1;
        toSendIndex++;
    }
    mask=0x80;
    /* send blue */
    for (index=8;index!=0;index--)
    {
        if(pixel->color.blue&mask)
        {
            toSend[toSendIndex]=LED_STRIP_ONE;
        }
        else
        {
            toSend[toSendIndex]=LED_STRIP_ZERO;
        }
        mask >>=1;
        toSendIndex++;
    }
}

/*******************************************************************************
 End of File
 */
