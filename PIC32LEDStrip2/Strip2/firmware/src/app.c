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
    #ifdef SHOOTER
    static uint32_t index;
    static uint32_t colorIndex=0;
    #endif
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
            #ifdef RGB_FADE_UP_DOWN
            appData.LED.increase=true;
            appData.LED.redIncrement=true;
            appData.LED.greenIncrement=false;
            appData.LED.blueIncrement=false;
            #endif
            #ifdef SHOOTER
            index=0;
            #endif
            #ifdef COLOR_WHEEL
            start=0;
            #endif
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
            #ifdef COLOR_WHEEL
            HSV_COLOR_TYPE hsv;
            hsv.w=0;
            hsv.hue=start;
            for(appData.LED.pixelIndex=0;appData.LED.pixelIndex<NUMBER_PIXELS;appData.LED.pixelIndex++)
            {
                appData.LED.pixel[appData.LED.pixelIndex].w=0;
                hsv.hue+=HUE_INCREMENT;
                HSVtoRGB(hsv,&appData.LED.pixel[appData.LED.pixelIndex]);

            }
            #endif
            #ifdef SHOOTER
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
            #endif
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
            #ifdef COLOR_WHEEL
                    start++;
            #endif
                    #ifdef SHOOTER
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
                    #endif
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
