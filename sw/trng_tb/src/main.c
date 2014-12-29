/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "system_defines.h"

#include "xtime_l.h" //for profiling
//void print(char *str);

#define RUNMODE_TEST 1
#define RUNMODE_DUMP_REGS 2
#define RUNMODE_DUMP_HASH 3
#define RUNMODE RUNMODE_DUMP_REGS

void Xil_Out64(u32 OutAddress, u64 Value)
{
	*(volatile u64 *) OutAddress = Value;
}


u64 Xil_In64(u32 Addr)
{
	return *(volatile u64 *) Addr;
}


void uart_send_u32(u32 data){

    outbyte (((unsigned char *) &data) [0]);
    outbyte (((unsigned char *) &data) [1]);
    outbyte (((unsigned char *) &data) [2]);
    outbyte (((unsigned char *) &data) [3]);

	//outbyte((data&(0xff<<0))>>0); //lsb first -> little endian
	//outbyte((data&(0xff<<8))>>8);
	//outbyte((data&(0xff<<16))>>16);
	//outbyte((data&(0xff<<24))>>24);


}

void uart_send_u64(u64 data){

	outbyte (((unsigned char *) &data) [0]);
	outbyte (((unsigned char *) &data) [1]);
	outbyte (((unsigned char *) &data) [2]);
	outbyte (((unsigned char *) &data) [3]);
	outbyte (((unsigned char *) &data) [4]);
	outbyte (((unsigned char *) &data) [5]);
	outbyte (((unsigned char *) &data) [6]);
	outbyte (((unsigned char *) &data) [7]);
}

/*
void init_perfmon_profile(){

	Xil_Out32(PERF_MON_REG(0x300),0x0020002);

	Xil_Out32(PERF_MON_REG(0x44),0x03020100);//metric sel reg 0
	Xil_Out32(PERF_MON_REG(0x48),0x0E060504);//metric sel reg 1
	Xil_Out32(PERF_MON_REG(0x4C),0x0000000F);//metric sel reg 2

	Xil_Out32(PERF_MON_REG(0x300),0x0000001);


}*/

#define TARGET TRNG_REG0

int main()
{
    init_platform();
    Xil_DCacheDisable();
    u64 arr[32];

#if RUNMODE == RUNMODE_TEST
    int i = 0;
    u64 output = 0;
    u32 testval0 = 0xA0A0A;
    u64 testval = 0xAAAAAAAAAAAAAAAA;

    printf("Starting the TRNG test...\n\n");


	//Xil_Out64(TRNG_REG0(8), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	Xil_Out64(TARGET(8), testval);
	output = Xil_In64(TARGET(8));
	if(output==testval){
	    printf("Able to write to TRNG0!\n\n");
	}else{
	    printf("Unable to write to TRNG0!\n\n");
	}
//


	//Xil_Out64(TRNG_REG1(8), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//Xil_Out32(TRNG_REG(9), testval);
	//output = Xil_In64(TRNG_REG1(8));
//	if(output==testval){
//	    printf("Able to write to TRNG1!\n\n");
//	}else{
//	    printf("Unable to write to TRNG1!\n\n");
//	}



	output = 0xCCCCCCCCCCCCCCCC;

	printf("\nSampling PUF registers...\n");
	//Xil_DCacheInvalidateRange(TARGET(i),64*8);
	for(i=0;i<11;i+=1){

	    	arr[i] = Xil_In64(TARGET(i));
	  	printf("%02d: 0x%016llX\n",i,arr[i]);
	    //	printf("%02d: 0x%08X\n",i,output);
	}


//	printf("\nSampling PUF registers 2...\n");
	//for(i=1;i<31;i+=2){
		//printf("%02d: 0x%016llX\n",i,Xil_In64(TARGET(i)));
	//}


	printf("\nSampling Hashed PUF...\n");

   // for(i=0;i<31;i+=2){

//    	output = Xil_In64(TARGET(i));
  //  	printf("0x%016llX\n\n",output);
   // }

    printf("\nRunning benchmark...\n");
    double counts_per_ms = COUNTS_PER_SECOND/1000.0;
    XTime tStart, tEnd;
    XTime_GetTime(&tStart);

    for(i=0;i<100000;i++){

       output = Xil_In32(TARGET(0));//test

   // 	output = Xil_In32(TRNG_REG_LITE(8));
    	//output = Xil_In32(TRNG_REG(9));

   }

    XTime_GetTime(&tEnd);
    XTime tdiff = tEnd-tStart;

    double time_ms = ((unsigned int)tdiff)/counts_per_ms;

    printf("\r\nTotal ticks: %d\r\n",(unsigned int)tdiff);
    printf("Total time (ms): %f\r\n",time_ms);
    printf("Done!\n\r");
#elif RUNMODE == RUNMODE_DUMP_REGS

    int i,j,k;
     u64 output;
     u32 nsamples = 1000; //assumes 64 bit words
     u32 nbytes = nsamples * 55; //regfile has 64 - 8 -1 usuable bytes


    //send the xmission length
    uart_send_u32(nbytes);

 //   return 0;

    //send the samples
    for(i=0;i<nsamples;i++){
    	 for(j=0;j<7;j+=1){ //do this for every 64 bit reg
    		 output = Xil_In64(TARGET(j));


    	     if(j==6){ //last word only has 7 usable bytes
    	    	 	 //for(k=0;k<7;k++){
    	    	 		outbyte (((unsigned char *) &output) [0]);
    	    	 		outbyte (((unsigned char *) &output) [1]);
    	    	 		outbyte (((unsigned char *) &output) [2]);
    	    	 		outbyte (((unsigned char *) &output) [3]);
    	    	 		outbyte (((unsigned char *) &output) [4]);
    	    	 		outbyte (((unsigned char *) &output) [5]);
    	    	 		outbyte (((unsigned char *) &output) [6]);
    	    	 		//outbyte (((unsigned char *) &output) [7]);
    	    	 	 //}
    	     }else{
    	    	 uart_send_u64(output);
    	     }


         }

     }


#else
    int i;
    u64 output;
    u32 nsamples = 1000; //assumes 64 bit words
    u32 nbytes = nsamples * 8;

    //send the xmission length
    uart_send_u32(nbytes);

    //send the samples
    for(i=0;i<nsamples;i++){
     	output = Xil_In64(TARGET(9));
     	//printf("%016llX\n\n",output);

        uart_send_u64(output);
     }


#endif

    return 0;
}
