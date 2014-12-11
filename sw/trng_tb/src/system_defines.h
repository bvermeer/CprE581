/*
 * system_defines.h
 *
 *  Created on: Nov. 11 2014
 *      Author: ajmills
 */

#ifndef SYSTEM_DEFINES_H_
#define SYSTEM_DEFINES_H_


//create a function to compute the address for a particular register
#define TRNG_REG0(x) ( (x<<3) + XPAR_AXI_TRNG_0_S_AXI_MEM0_BASEADDR )

#define TRNG_REG1(x) ( (x<<2) + XPAR_AXI_TRNG_1_S_AXI_MEM0_BASEADDR )


#define TRNG_REG_LITE(x) ( (x<<2) + XPAR_AXILITE_TRNG_0_BASEADDR)


//Create a function to allow resetting the AXI bus
//#define SOFT_RESET (0x0000000A)

//#define AXI_TRNG_SOFT_RST_SPACE_OFFSET (0x00000100) //the BE pin we need to go high
//#define AXI_TRNG_RST_REG_OFFSET (AXI_TRNG_SOFT_RST_SPACE_OFFSET + 0x00000000)

//#define AXI_TRNG_mReset(BaseAddress) \
// 	Xil_Out32((BaseAddress)+(AXI_TRNG_RST_REG_OFFSET), SOFT_RESET)

#endif /* SYSTEM_DEFINES_H_ */
