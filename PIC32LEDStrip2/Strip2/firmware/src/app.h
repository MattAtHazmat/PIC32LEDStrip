#ifndef _APP_H
#define _APP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "system_config.h"
#include "system_definitions.h"

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************


typedef enum
{    
    APP_STATE_INIT=0,
    APP_STATE_RUN,
    APP_STATE_SEND_PIXEL,
    APP_STATE_SEND_RESET,
    APP_STATE_WAIT,
    APP_STATE_ERROR,
} APP_STATES;

typedef union {
    uint32_t w;
    struct {
        uint8_t red;
        uint8_t green;
        uint8_t blue;
        uint8_t :8;
    } color;
} LED_TYPE;

typedef struct {
    DRV_HANDLE SPIHandle;
    DRV_SPI_BUFFER_HANDLE handle;
    uint8_t rawLED[3*8*NUMBER_PIXELS+LED_STRIP_RESET_BITS];
    RGB_COLOR_TYPE pixel[NUMBER_PIXELS];
    unsigned pixelIndex;
    #ifdef RGB_FADE_UP_DOWN
    bool redIncrement;
    bool greenIncrement;
    bool blueIncrement;
    bool increase;
    #endif
} LED_DATA_TYPE;

typedef struct
{
    APP_STATES state;
    LED_DATA_TYPE LED;
    struct{
        uint32_t blinkCount;
        uint32_t interval;
    }activityLED;
} APP_DATA;


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/

    
// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the 
    application in its initial state and prepares it to run so that its 
    APP_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void APP_Initialize ( void );


/*******************************************************************************
  Function:
    void APP_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void APP_Tasks( void );

void PopulatePixel(RGB_COLOR_TYPE *pixel, uint8_t *toSend );

#endif /* _APP_H */
/*******************************************************************************
 End of File
 */

