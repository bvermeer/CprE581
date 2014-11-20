/*
 * system_defines.h
 *
 *  Created on: Nov. 11 2014
 *      Author: ajmills
 */

#ifndef SYSTEM_DEFINES_H_
#define SYSTEM_DEFINES_H_

//Define run states
#define RUN 0x00000001
#define LOAD 0x00000002
#define WAIT1 0x00000003
#define WAIT2 0x00000004
#define STORE 0x00000005
#define RESUME 0x0000000A
#define DEVICE_STAGE 0x80000000


//Define the debug modes
#define STATUS 0x00000000
#define COLUMN_1_OUT 0x00000010
#define COLUMN_2_OUT 0x00000020
#define COLUMN_3_OUT 0x00000030
#define ROUND_COUNT 0x00000040
#define COLUMN_1_IN 0x00000050
#define COLUMN_2_IN 0x00000060
#define COLUMN_3_IN 0x00000070
#define COLUMN_4_IN 0x00000080
#define COLUMN_5_IN 0x00000090
#define COLUMN_6_IN 0x000000A0
#define PRESENT_STATE 0x000000B0
#define RESUME_STATE 0x000000C0

//Define the states
#define IDLE_STATE 1
#define LOAD_STATE 2
#define WAIT1_STATE 3
#define WAIT2_STATE 4
#define STORE_STATE 5
#define DEVICE_PAUSE_STATE 6
#define DEVICE_STAGE_STATE 7
#define RST_STATE 8



//create a function to compute the address for a particular register
#define TRNG_REG(x) ( (x<<2) + XPAR_AXILITE_TRNG_0_BASEADDR )

//Create a function to allow resetting the AXI bus
#define SOFT_RESET (0x0000000A)

#define AXI_TRNG_SOFT_RST_SPACE_OFFSET (0x00000100) //the BE pin we need to go high
#define AXI_TRNG_RST_REG_OFFSET (AXI_TRNG_SOFT_RST_SPACE_OFFSET + 0x00000000)

#define AXI_TRNG_mReset(BaseAddress) \
 	Xil_Out32((BaseAddress)+(AXI_TRNG_RST_REG_OFFSET), SOFT_RESET)

#endif /* SYSTEM_DEFINES_H_ */
