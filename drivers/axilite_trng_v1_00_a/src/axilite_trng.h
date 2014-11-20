/*****************************************************************************
* Filename:          /home/ajmills/zedboard-trng/drivers/axilite_trng_v1_00_a/src/axilite_trng.h
* Version:           1.00.a
* Description:       axilite_trng Driver Header File
* Date:              Mon Nov 10 22:34:19 2014 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef AXILITE_TRNG_H
#define AXILITE_TRNG_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 * -- SLV_REG5 : user logic slave module register 5
 * -- SLV_REG6 : user logic slave module register 6
 * -- SLV_REG7 : user logic slave module register 7
 * -- SLV_REG8 : user logic slave module register 8
 * -- SLV_REG9 : user logic slave module register 9
 * -- SLV_REG10 : user logic slave module register 10
 * -- SLV_REG11 : user logic slave module register 11
 * -- SLV_REG12 : user logic slave module register 12
 * -- SLV_REG13 : user logic slave module register 13
 * -- SLV_REG14 : user logic slave module register 14
 * -- SLV_REG15 : user logic slave module register 15
 * -- SLV_REG16 : user logic slave module register 16
 * -- SLV_REG17 : user logic slave module register 17
 * -- SLV_REG18 : user logic slave module register 18
 * -- SLV_REG19 : user logic slave module register 19
 * -- SLV_REG20 : user logic slave module register 20
 * -- SLV_REG21 : user logic slave module register 21
 * -- SLV_REG22 : user logic slave module register 22
 * -- SLV_REG23 : user logic slave module register 23
 * -- SLV_REG24 : user logic slave module register 24
 * -- SLV_REG25 : user logic slave module register 25
 * -- SLV_REG26 : user logic slave module register 26
 * -- SLV_REG27 : user logic slave module register 27
 * -- SLV_REG28 : user logic slave module register 28
 * -- SLV_REG29 : user logic slave module register 29
 * -- SLV_REG30 : user logic slave module register 30
 * -- SLV_REG31 : user logic slave module register 31
 */
#define AXILITE_TRNG_USER_SLV_SPACE_OFFSET (0x00000000)
#define AXILITE_TRNG_SLV_REG0_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000000)
#define AXILITE_TRNG_SLV_REG1_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000004)
#define AXILITE_TRNG_SLV_REG2_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000008)
#define AXILITE_TRNG_SLV_REG3_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define AXILITE_TRNG_SLV_REG4_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000010)
#define AXILITE_TRNG_SLV_REG5_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000014)
#define AXILITE_TRNG_SLV_REG6_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000018)
#define AXILITE_TRNG_SLV_REG7_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000001C)
#define AXILITE_TRNG_SLV_REG8_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000020)
#define AXILITE_TRNG_SLV_REG9_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000024)
#define AXILITE_TRNG_SLV_REG10_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000028)
#define AXILITE_TRNG_SLV_REG11_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000002C)
#define AXILITE_TRNG_SLV_REG12_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000030)
#define AXILITE_TRNG_SLV_REG13_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000034)
#define AXILITE_TRNG_SLV_REG14_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000038)
#define AXILITE_TRNG_SLV_REG15_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000003C)
#define AXILITE_TRNG_SLV_REG16_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000040)
#define AXILITE_TRNG_SLV_REG17_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000044)
#define AXILITE_TRNG_SLV_REG18_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000048)
#define AXILITE_TRNG_SLV_REG19_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000004C)
#define AXILITE_TRNG_SLV_REG20_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000050)
#define AXILITE_TRNG_SLV_REG21_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000054)
#define AXILITE_TRNG_SLV_REG22_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000058)
#define AXILITE_TRNG_SLV_REG23_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000005C)
#define AXILITE_TRNG_SLV_REG24_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000060)
#define AXILITE_TRNG_SLV_REG25_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000064)
#define AXILITE_TRNG_SLV_REG26_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000068)
#define AXILITE_TRNG_SLV_REG27_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000006C)
#define AXILITE_TRNG_SLV_REG28_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000070)
#define AXILITE_TRNG_SLV_REG29_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000074)
#define AXILITE_TRNG_SLV_REG30_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x00000078)
#define AXILITE_TRNG_SLV_REG31_OFFSET (AXILITE_TRNG_USER_SLV_SPACE_OFFSET + 0x0000007C)

/**
 * Software Reset Space Register Offsets
 * -- RST : software reset register
 */
#define AXILITE_TRNG_SOFT_RST_SPACE_OFFSET (0x00000100)
#define AXILITE_TRNG_RST_REG_OFFSET (AXILITE_TRNG_SOFT_RST_SPACE_OFFSET + 0x00000000)

/**
 * Software Reset Masks
 * -- SOFT_RESET : software reset
 */
#define SOFT_RESET (0x0000000A)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a AXILITE_TRNG register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the AXILITE_TRNG device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXILITE_TRNG_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define AXILITE_TRNG_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a AXILITE_TRNG register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the AXILITE_TRNG device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 AXILITE_TRNG_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXILITE_TRNG_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from AXILITE_TRNG user logic slave registers.
 *
 * @param   BaseAddress is the base address of the AXILITE_TRNG device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void AXILITE_TRNG_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 AXILITE_TRNG_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXILITE_TRNG_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg8(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG8_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg9(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG9_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg10(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG10_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg11(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG11_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg12(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG12_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg13(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG13_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg14(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG14_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg15(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG15_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg16(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG16_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg17(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG17_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg18(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG18_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg19(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG19_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg20(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG20_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg21(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG21_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg22(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG22_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg23(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG23_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg24(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG24_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg25(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG25_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg26(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG26_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg27(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG27_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg28(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG28_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg29(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG29_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg30(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG30_OFFSET) + (RegOffset), (Xuint32)(Value))
#define AXILITE_TRNG_mWriteSlaveReg31(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (AXILITE_TRNG_SLV_REG31_OFFSET) + (RegOffset), (Xuint32)(Value))

#define AXILITE_TRNG_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG0_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG1_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG2_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG3_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG4_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG5_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG6_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG7_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg8(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG8_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg9(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG9_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg10(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG10_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg11(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG11_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg12(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG12_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg13(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG13_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg14(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG14_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg15(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG15_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg16(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG16_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg17(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG17_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg18(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG18_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg19(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG19_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg20(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG20_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg21(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG21_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg22(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG22_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg23(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG23_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg24(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG24_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg25(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG25_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg26(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG26_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg27(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG27_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg28(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG28_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg29(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG29_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg30(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG30_OFFSET) + (RegOffset))
#define AXILITE_TRNG_mReadSlaveReg31(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (AXILITE_TRNG_SLV_REG31_OFFSET) + (RegOffset))

/**
 *
 * Reset AXILITE_TRNG via software.
 *
 * @param   BaseAddress is the base address of the AXILITE_TRNG device.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXILITE_TRNG_mReset(Xuint32 BaseAddress)
 *
 */
#define AXILITE_TRNG_mReset(BaseAddress) \
 	Xil_Out32((BaseAddress)+(AXILITE_TRNG_RST_REG_OFFSET), SOFT_RESET)

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the AXILITE_TRNG instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus AXILITE_TRNG_SelfTest(void * baseaddr_p);
/**
*  Defines the number of registers available for read and write*/
#define TEST_AXI_LITE_USER_NUM_REG 32


#endif /** AXILITE_TRNG_H */
