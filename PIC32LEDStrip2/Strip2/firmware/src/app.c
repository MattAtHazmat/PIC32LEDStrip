#include <common.h>
#include "app.h"


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
    #ifdef COLOR_WHEEL
    static uint8_t start;
    #endif
    switch ( appData.state )
    {
        case APP_STATE_INIT:
        {
            appData.LED.SPIHandle = DRV_SPI_Open(DRV_SPI_INDEX_0,
                                                 DRV_IO_INTENT_EXCLUSIVE |
                                                 DRV_IO_INTENT_WRITE |
                                                 DRV_IO_INTENT_NONBLOCKING
                                            );            
            #ifdef COLOR_WHEEL            
            start=0;
            #endif
            if( DRV_HANDLE_INVALID == appData.LED.SPIHandle )
            {
                appData.state=APP_STATE_ERROR;
            }
            else
            {
                appData.state=APP_STATE_TIMER_INIT;
            }
            break;
        }
        case APP_STATE_TIMER_INIT:
        {
            if(SYS_TMR_Status(sysObj.sysTmr)==SYS_STATUS_READY)
            {
                appData.timer.handle = SYS_TMR_CallbackPeriodic(UPDATE_MS,0,TimerCallback);
                if(appData.timer.handle != SYS_TMR_HANDLE_INVALID )
                {
                    appData.state=APP_STATE_RUN;
                }
            }
            break;
        }
        case APP_STATE_RUN:
        {
            if(!appData.timer.triggered)
            {
                break;
            }
            appData.timer.triggered=false;
            #ifdef COLOR_WHEEL
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
                    #ifdef COLOR_WHEEL
                    start++;
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
