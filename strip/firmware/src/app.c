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
struct {
    union
    {
        uint32_t status;
        struct
        {
            unsigned queueing:1; /* flag to interrupt, if true, don't start sending a new packet immediately */
            unsigned transmitting:1;
            unsigned bufferInUse:1; /* if transmitting, false is buffer 0 is  */
                                    /* being DMAed from, true is buffer 1 */ 
            unsigned dataReady:1;
        };
    };
    uint8_t rawLED[2][RAW_BUFFER_SIZE];
} LEDStrip;
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

/******************************************************************************/

void APP_Initialize ( void )
{
    memset(&appData,0,sizeof(appData));
    memset(&LEDStrip,0,sizeof(LEDStrip));
    mStripOutConfigure();
    ACTIVITY_LED_DIRECTION=TRIS_OUT;
    appData.state = APP_STATE_INIT;
    appData.activityLED.interval=ACTIVITY_LED_INTERVAL;    
    APP_TASKS_ACTIVITY_INIT;
}

/******************************************************************************/

void TimerCallback ( uintptr_t context, uint32_t currTick )
{
    appData.status.readyForNext=true;
}

/******************************************************************************/

void FinishedLEDWriteCB(DRV_SPI_BUFFER_EVENT event, 
                        DRV_SPI_BUFFER_HANDLE bufferHandle, 
                        void * context)
{
    LEDStrip.transmitting=false;
}
/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
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
                appData.timer.driver.handle = DRV_TMR_Open(
                        DRV_TMR_INDEX_0,
                        DRV_IO_INTENT_READWRITE|DRV_IO_INTENT_EXCLUSIVE);
                appData.status.TimerDriverReady = 
                        (appData.timer.driver.handle != DRV_HANDLE_INVALID);
            }     
            if(appData.status.SPIReady && appData.status.TimerDriverReady)
            {
                appData.LED.start=0;                
                appData.state=APP_STATE_TIMER_START;
            }
            break;
        }        
        case APP_STATE_TIMER_START:
        {  
            if(     DRV_TMR_AlarmRegister(appData.timer.driver.handle,
                    DRV_TMR_CounterFrequencyGet(appData.timer.driver.handle)/25,
                    true,
                    0,
                    &TimerCallback)
                )
            {                
                if(DRV_TMR_Start(appData.timer.driver.handle))
                {
                    appData.status.ready=true;
                    appData.state=APP_STATE_RUN;
                }
            }
            break;
        }        
        case APP_STATE_RUN:
        {
            if(!SendingToStrip())
            {                
                APP_TASKS_ACTIVITY_SET;
                PopulateStrip(&appData.LED);
                appData.state=APP_STATE_SEND_STRIP;
            }
            break;
        }
        case APP_STATE_SEND_STRIP:
        {
            if(appData.status.readyForNext)
            {
                appData.status.readyForNext=false;
                SendLEDStrip(&appData.LED);
                /* write each pixel out to the SPI buffer */            
                /* give the data over to the SPI system to send to the LED strip */
                appData.state=APP_STATE_WAIT;
                APP_TASKS_ACTIVITY_CLEAR;
            }
            break;
        }
        case APP_STATE_WAIT:
        {
            /* wait for the SPI transaction to finish. */
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
                    appData.LED.start++;
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

bool SendingToStrip(void)
{
    return LEDStrip.transmitting;
}

void PopulateStrip(LED_DATA_TYPE *LEDStrip)
{
    uint32_t index;
    HSV_COLOR_TYPE hsv;
    hsv.hue=LEDStrip->start;
    hsv.saturation=0xFF;
    hsv.value=INTENSITY;
    for(index = 0;
        index < NUMBER_PIXELS;
        index++)
    {
        /* clear out the LED data for this pixel */
        appData.LED.pixel[index].w=0;
        /* change the hue a little bit for each successive pixel */
        hsv.hue+=HUE_INCREMENT;
        /* convert the HSV value to RGB */
        HSVtoRGB(hsv,&appData.LED.pixel[index]);
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

/******************************************************************************/

void SendLEDStrip(LED_DATA_TYPE* strip)
{
    appData.LED.handle = DRV_SPI_BufferAddWrite 
        (
            appData.LED.SPIHandle,
            QueueLEDStrip(strip),
            RAW_BUFFER_SIZE,
            &FinishedLEDWriteCB,
            NULL
        );
    LEDStrip.transmitting=true;
}

/******************************************************************************/

uint8_t* QueueLEDStrip(LED_DATA_TYPE* strip)
{
    uint32_t index=0; /* bit index into rawLED buffer                         */
    uint32_t pixelCount=0;
    uint32_t buffer=0;
    LEDStrip.queueing=true;
    /* is there a buffer available to write to?                               */
    if(LEDStrip.transmitting)
    {
        if (LEDStrip.bufferInUse == false)
        {
            LEDStrip.bufferInUse = true;
            buffer=1;
        }
    }
    /* put the LED data into the buffer                                       */
    for(pixelCount = 0;
        pixelCount < NUMBER_PIXELS;
        pixelCount++)
    {
        PopulatePixel(&strip->pixel[pixelCount],&LEDStrip.rawLED[buffer][index]);
        /* each pixel is 24 bytes worth of data                               */
        index=index+24;
    }
    /* put the end o' frame into the buffer                                   */
    for(/* start index where I left off */;
        index < RAW_BUFFER_SIZE;
        index++)
    {
        LEDStrip.rawLED[buffer][index] = 0;
    }    
    LEDStrip.queueing = false;
    LEDStrip.dataReady = true;
    return &LEDStrip.rawLED[buffer][0];
}

/*******************************************************************************
 End of File
 */
