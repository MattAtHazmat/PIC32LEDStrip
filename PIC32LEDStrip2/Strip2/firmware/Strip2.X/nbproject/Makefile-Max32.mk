#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Max32.mk)" "nbproject/Makefile-local-Max32.mk"
include nbproject/Makefile-local-Max32.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Max32
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/app.c ../src/main.c ../src/color.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c ../src/system_config/Max32/system_init.c ../src/system_config/Max32/system_interrupt.c ../src/system_config/Max32/system_exceptions.c ../src/system_config/Max32/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/color.o ${OBJECTDIR}/_ext/1188736918/drv_spi.o ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o ${OBJECTDIR}/_ext/805136297/drv_tmr.o ${OBJECTDIR}/_ext/1974378270/sys_devcon.o ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/2082688627/sys_dma.o ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o ${OBJECTDIR}/_ext/1151846489/sys_ports.o ${OBJECTDIR}/_ext/751831762/sys_tmr.o ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o ${OBJECTDIR}/_ext/382779083/sys_clk_static.o ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o ${OBJECTDIR}/_ext/1467630164/system_init.o ${OBJECTDIR}/_ext/1467630164/system_interrupt.o ${OBJECTDIR}/_ext/1467630164/system_exceptions.o ${OBJECTDIR}/_ext/1467630164/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/color.o.d ${OBJECTDIR}/_ext/1188736918/drv_spi.o.d ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d ${OBJECTDIR}/_ext/805136297/drv_tmr.o.d ${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/2082688627/sys_dma.o.d ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1151846489/sys_ports.o.d ${OBJECTDIR}/_ext/751831762/sys_tmr.o.d ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d ${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d ${OBJECTDIR}/_ext/1467630164/system_init.o.d ${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d ${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d ${OBJECTDIR}/_ext/1467630164/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/color.o ${OBJECTDIR}/_ext/1188736918/drv_spi.o ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o ${OBJECTDIR}/_ext/805136297/drv_tmr.o ${OBJECTDIR}/_ext/1974378270/sys_devcon.o ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/2082688627/sys_dma.o ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o ${OBJECTDIR}/_ext/1151846489/sys_ports.o ${OBJECTDIR}/_ext/751831762/sys_tmr.o ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o ${OBJECTDIR}/_ext/382779083/sys_clk_static.o ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o ${OBJECTDIR}/_ext/1467630164/system_init.o ${OBJECTDIR}/_ext/1467630164/system_interrupt.o ${OBJECTDIR}/_ext/1467630164/system_exceptions.o ${OBJECTDIR}/_ext/1467630164/system_tasks.o

# Source Files
SOURCEFILES=../src/app.c ../src/main.c ../src/color.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c ../src/system_config/Max32/system_init.c ../src/system_config/Max32/system_interrupt.c ../src/system_config/Max32/system_exceptions.c ../src/system_config/Max32/system_tasks.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Max32.mk dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c   
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c   
	
${OBJECTDIR}/_ext/1360937237/color.o: ../src/color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/color.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/color.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/color.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/color.o.d" -o ${OBJECTDIR}/_ext/1360937237/color.o ../src/color.c   
	
${OBJECTDIR}/_ext/1188736918/drv_spi.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1188736918" 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1188736918/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1188736918/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1188736918/drv_spi.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c   
	
${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1551594182" 
	@${RM} ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c   
	
${OBJECTDIR}/_ext/1188736918/drv_spi_api.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1188736918" 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c   
	
${OBJECTDIR}/_ext/805136297/drv_tmr.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/805136297" 
	@${RM} ${OBJECTDIR}/_ext/805136297/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/805136297/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/805136297/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/805136297/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/805136297/drv_tmr.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c   
	
${OBJECTDIR}/_ext/1974378270/sys_devcon.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1974378270" 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1974378270/sys_devcon.o ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c   
	
${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1974378270" 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c   
	
${OBJECTDIR}/_ext/2082688627/sys_dma.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2082688627" 
	@${RM} ${OBJECTDIR}/_ext/2082688627/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/2082688627/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2082688627/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/2082688627/sys_dma.o.d" -o ${OBJECTDIR}/_ext/2082688627/sys_dma.o ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c   
	
${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1893961468" 
	@${RM} ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c   
	
${OBJECTDIR}/_ext/1151846489/sys_ports.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1151846489" 
	@${RM} ${OBJECTDIR}/_ext/1151846489/sys_ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1151846489/sys_ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1151846489/sys_ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1151846489/sys_ports.o.d" -o ${OBJECTDIR}/_ext/1151846489/sys_ports.o ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c   
	
${OBJECTDIR}/_ext/751831762/sys_tmr.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/751831762" 
	@${RM} ${OBJECTDIR}/_ext/751831762/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/751831762/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/751831762/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/751831762/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/751831762/sys_tmr.o ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c   
	
${OBJECTDIR}/_ext/382779083/sys_clk_static.o: ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/382779083" 
	@${RM} ${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/382779083/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/382779083/sys_clk_static.o ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c   
	
${OBJECTDIR}/_ext/1285896379/sys_ports_static.o: ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1285896379" 
	@${RM} ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c   
	
${OBJECTDIR}/_ext/1467630164/system_init.o: ../src/system_config/Max32/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_init.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_init.o ../src/system_config/Max32/system_init.c   
	
${OBJECTDIR}/_ext/1467630164/system_interrupt.o: ../src/system_config/Max32/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_interrupt.o ../src/system_config/Max32/system_interrupt.c   
	
${OBJECTDIR}/_ext/1467630164/system_exceptions.o: ../src/system_config/Max32/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_exceptions.o ../src/system_config/Max32/system_exceptions.c   
	
${OBJECTDIR}/_ext/1467630164/system_tasks.o: ../src/system_config/Max32/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_tasks.o ../src/system_config/Max32/system_tasks.c   
	
else
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c   
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c   
	
${OBJECTDIR}/_ext/1360937237/color.o: ../src/color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/color.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/color.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/color.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/color.o.d" -o ${OBJECTDIR}/_ext/1360937237/color.o ../src/color.c   
	
${OBJECTDIR}/_ext/1188736918/drv_spi.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1188736918" 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1188736918/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1188736918/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1188736918/drv_spi.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi.c   
	
${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1551594182" 
	@${RM} ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1551594182/drv_spi_sys_queue_fifo.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/drv_spi_sys_queue_fifo.c   
	
${OBJECTDIR}/_ext/1188736918/drv_spi_api.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1188736918" 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1188736918/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/1188736918/drv_spi_api.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/spi/src/dynamic/drv_spi_api.c   
	
${OBJECTDIR}/_ext/805136297/drv_tmr.o: ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/805136297" 
	@${RM} ${OBJECTDIR}/_ext/805136297/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/805136297/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/805136297/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/805136297/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/805136297/drv_tmr.o ../../../../../../microchip/harmony/v1_04_01/framework/driver/tmr/src/dynamic/drv_tmr.c   
	
${OBJECTDIR}/_ext/1974378270/sys_devcon.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1974378270" 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1974378270/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1974378270/sys_devcon.o ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon.c   
	
${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1974378270" 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/1974378270/sys_devcon_pic32mx.o ../../../../../../microchip/harmony/v1_04_01/framework/system/devcon/src/sys_devcon_pic32mx.c   
	
${OBJECTDIR}/_ext/2082688627/sys_dma.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2082688627" 
	@${RM} ${OBJECTDIR}/_ext/2082688627/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/2082688627/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2082688627/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/2082688627/sys_dma.o.d" -o ${OBJECTDIR}/_ext/2082688627/sys_dma.o ../../../../../../microchip/harmony/v1_04_01/framework/system/dma/src/sys_dma.c   
	
${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1893961468" 
	@${RM} ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1893961468/sys_int_pic32.o ../../../../../../microchip/harmony/v1_04_01/framework/system/int/src/sys_int_pic32.c   
	
${OBJECTDIR}/_ext/1151846489/sys_ports.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1151846489" 
	@${RM} ${OBJECTDIR}/_ext/1151846489/sys_ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1151846489/sys_ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1151846489/sys_ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1151846489/sys_ports.o.d" -o ${OBJECTDIR}/_ext/1151846489/sys_ports.o ../../../../../../microchip/harmony/v1_04_01/framework/system/ports/src/sys_ports.c   
	
${OBJECTDIR}/_ext/751831762/sys_tmr.o: ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/751831762" 
	@${RM} ${OBJECTDIR}/_ext/751831762/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/751831762/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/751831762/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/751831762/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/751831762/sys_tmr.o ../../../../../../microchip/harmony/v1_04_01/framework/system/tmr/src/sys_tmr.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_tasks.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_ebm_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c   
	
${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o: ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1828036777" 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o.d" -o ${OBJECTDIR}/_ext/1828036777/drv_spi_master_dma_tasks.o ../src/system_config/Max32/framework/driver/spi/dynamic/drv_spi_master_dma_tasks.c   
	
${OBJECTDIR}/_ext/382779083/sys_clk_static.o: ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/382779083" 
	@${RM} ${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/382779083/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/382779083/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/382779083/sys_clk_static.o ../src/system_config/Max32/framework/system/clk/src/sys_clk_static.c   
	
${OBJECTDIR}/_ext/1285896379/sys_ports_static.o: ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1285896379" 
	@${RM} ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1285896379/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/1285896379/sys_ports_static.o ../src/system_config/Max32/framework/system/ports/src/sys_ports_static.c   
	
${OBJECTDIR}/_ext/1467630164/system_init.o: ../src/system_config/Max32/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_init.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_init.o ../src/system_config/Max32/system_init.c   
	
${OBJECTDIR}/_ext/1467630164/system_interrupt.o: ../src/system_config/Max32/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_interrupt.o ../src/system_config/Max32/system_interrupt.c   
	
${OBJECTDIR}/_ext/1467630164/system_exceptions.o: ../src/system_config/Max32/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_exceptions.o ../src/system_config/Max32/system_exceptions.c   
	
${OBJECTDIR}/_ext/1467630164/system_tasks.o: ../src/system_config/Max32/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1467630164" 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1467630164/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1467630164/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DMAX32 -I"../../../../" -I"../src" -I"../src/system_config/Max32" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../../../../../../microchip/harmony/v1_04_01/framework" -I"../src/system_config/Max32/framework" -MMD -MF "${OBJECTDIR}/_ext/1467630164/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1467630164/system_tasks.o ../src/system_config/Max32/system_tasks.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../microchip/harmony/v1_04_01/bin/framework/peripheral/PIC32MX795F512L_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\microchip\harmony\v1_04_01\bin\framework\peripheral\PIC32MX795F512L_peripherals.a       -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=0,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../microchip/harmony/v1_04_01/bin/framework/peripheral/PIC32MX795F512L_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\microchip\harmony\v1_04_01\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Strip2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Max32
	${RM} -r dist/Max32

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
