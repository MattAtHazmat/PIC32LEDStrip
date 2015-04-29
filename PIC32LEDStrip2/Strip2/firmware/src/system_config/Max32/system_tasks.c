// *****************************************************************************
// Section: Included Files
// *****************************************************************************
#include <common.h>
#include "system_config.h"
#include "system_definitions.h"
#include "TM1804.h"
#include "app.h"


// *****************************************************************************
// *****************************************************************************
// Section: System "Tasks" Routine
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void SYS_Tasks ( void )

  Remarks:
    See prototype in system/common/sys_module.h.
*/

void SYS_Tasks ( void )
{
    /* Maintain the state machines of all library modules executing polled in */
    /* the system. */

    /* Maintain system services */
    SYS_DEVCON_Tasks(sysObj.sysDevcon);
    /* Maintain the DMA system state machine. */
    SYS_DMA_Tasks(sysObj.sysDma);
    SYS_TMR_Tasks(sysObj.sysTmr);
    /* Maintain Device Drivers */
    DRV_TMR_Tasks(sysObj.drvTmr0);
    DRV_SPI_Tasks(sysObj.spiObjectIdx0);
    /* Maintain the application's state machine. */
    APP_Tasks();
}


/*******************************************************************************
 End of File
 */

