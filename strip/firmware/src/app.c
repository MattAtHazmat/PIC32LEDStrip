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

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback funtions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

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

void TimerCallback ( uintptr_t context, uint32_t currTick )
{
    appData.timer.triggered=true;
}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    static uint8_t start;
    switch ( appData.state )
    {
        case APP_STATE_INIT:
        {
            if(appData.status.ready)
            {
                appData.state = APP_STATE_RUN;
                break;
            }            
            if(appData.status.SPIReady==false)
            {
                appData.LED.SPIHandle = DRV_SPI_Open(DRV_SPI_INDEX_0,
                                                    DRV_IO_INTENT_EXCLUSIVE |
                                                    DRV_IO_INTENT_WRITE |
                                                    DRV_IO_INTENT_NONBLOCKING
                                               );     
                appData.status.SPIReady = ( DRV_HANDLE_INVALID != appData.LED.SPIHandle );
            }
            if(appData.status.TimerDriverReady==false)
            {
                appData.timer.driver.handle = DRV_TMR_Open()
            }
            else
            {
                appData.state=APP_STATE_TIMER_INIT;
            }
            if(appData.status.SPIReady && appData.status.SysTimerReady && appData.status.TimerDriverReady)
            {
                start=0;
                appData.status.ready=true;
            }
            break;
        }        
        case APP_STATE_TIMER_INIT:
        {
            appData.state=APP_STATE_TIMER_INIT;            

            if(SYS_TMR_Status(sysObj.sysTmr)==SYS_STATUS_READY)
            {
                appData.timer.handle = SYS_TMR_CallbackPeriodic(UPDATE_MS,0,&TimerCallback);
                if(appData.timer.handle != SYS_TMR_HANDLE_INVALID )
                {
                    appData.state=APP_STATE_TIMER_START;
                }
            }
            break;
        }
        case APP_STATE_TIMER_START:
        {
            if(DRV_TMR_ClientStatus())
        }
        case APP_STATE_RUN:
        {
            appData.state=APP_STATE_RUN;
            if(!appData.timer.triggered)
            {
                break;
            }
            appData.timer.triggered=false;            
            HSV_COLOR_TYPE hsv;
            APP_TASKS_ACTIVITY_SET;
            hsv.hue=start;
            hsv.saturation=0xFF;
            hsv.value=INTENSITY;
            for(appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
            {
                appData.LED.pixel[appData.LED.pixelIndex].w=0;
                hsv.hue+=HUE_INCREMENT;
                HSVtoRGB(hsv,&appData.LED.pixel[appData.LED.pixelIndex]);
            }            
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
            APP_TASKS_ACTIVITY_CLEAR;
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
                    start++;
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
}
/******************************************************************************/
void PopulatePixel(RGB_COLOR_TYPE *pixel, uint8_t *toSend )
{
    uint32_t toSendIndex=0;
    uint32_t index;
    uint8_t mask=0x80;
    /* send red*/
    for (index=8;index!=0;index--)
    {
        if(pixel->red&mask)
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
        if(pixel->green&mask)
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
        if(pixel->blue&mask)
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
