#include <common.h>
//#include "system_config.h"
//#include "system_definitions.h"

/******************************************************************************/

static enum
{
    EXCEP_IRQ = 0,    /* interrupt                                            */
    EXCEP_AdEL = 4,   /* address error exception (load or ifetch)             */
    EXCEP_AdES,       /* address error exception (store)                      */
    EXCEP_IBE,        /* bus error (ifetch)                                   */
    EXCEP_DBE,        /* bus error (load/store)                               */
    EXCEP_Sys,        /* syscall                                              */
    EXCEP_Bp,         /* breakpoint                                           */
    EXCEP_RI,         /* reserved instruction                                 */
    EXCEP_CpU,        /* coprocessor unusable                                 */
    EXCEP_Overflow,   /* arithmetic overflow                                  */
    EXCEP_Trap,       /* trap (possible divide by zero)                       */
    EXCEP_IS1 = 16,   /* implementation specfic 1                             */
    EXCEP_CEU,        /* CorExtend Unuseable                                  */
    EXCEP_C2E         /* coprocessor 2                                        */
} _excep_code;

static uint32_t _excep_addr;

/******************************************************************************/

void __attribute__((nomips16)) _general_exception_handler(void)
{
    asm volatile("mfc0 %0,$13" : "=r" (_excep_code));
    asm volatile("mfc0 %0,$14" : "=r" (_excep_addr));
    _excep_code = (_excep_code & 0x0000007C) >> 2;
    while (true);
}

/******************************************************************************/