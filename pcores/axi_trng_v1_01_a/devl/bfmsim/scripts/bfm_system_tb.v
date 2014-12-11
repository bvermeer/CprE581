//----------------------------------------------------------------------------
// bfm_system_tb.v - module
//----------------------------------------------------------------------------
//
// ***************************************************************************
// ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** Xilinx, Inc.                                                          **
// ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
// ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
// ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
// ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
// ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
// ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
// ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
// ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
// ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
// ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
// ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
// ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
// ** FOR A PARTICULAR PURPOSE.                                             **
// **                                                                       **
// ***************************************************************************
//
//----------------------------------------------------------------------------
// Filename:          bfm_system_tb.v
// Version:           1.01.a
// Description:       Testbench logic.
// Date:              Sat Nov 22 21:25:44 2014 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

`timescale 1 ns / 100 fs

//testbench defines
`define RESET_PERIOD 200
`define CLOCK_PERIOD 10
`define INIT_DELAY   400

//user slave defines
`define SLAVE_BASE_ADDR  32'h40000000
`define C_SLV_AWIDTH     32
`define C_SLV_DWIDTH     64

//Response type defines
`define RESPONSE_OKAY   2'b00

//AMBA 4 defines
`define RESP_BUS_WIDTH   2
`define MAX_BURST_LENGTH 8'b1111_1111

// Burst Size Defines
`define BURST_SIZE_1_BYTE    3'b000
`define BURST_SIZE_2_BYTES   3'b001
`define BURST_SIZE_4_BYTES   3'b010
`define BURST_SIZE_8_BYTES   3'b011
`define BURST_SIZE_16_BYTES  3'b100
`define BURST_SIZE_32_BYTES  3'b101
`define BURST_SIZE_64_BYTES  3'b110
`define BURST_SIZE_128_BYTES 3'b111

// Lock Type Defines
`define LOCK_TYPE_NORMAL    1'b0

// Burst Type Defines
`define BURST_TYPE_INCR  2'b01

module bfm_system_tb
(
); // bfm_system_tb

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // -- Testbench nets declartions added here,as needed for testbench logic

  //local parameters
  parameter RUSER_BUS_WIDTH  = 1;
  parameter WUSER_BUS_WIDTH  = 1;
  parameter SLAVE_MEM_SIZE   = 256;


  //system reset and clock signal
  reg                                       rst_n;
  reg                                       sys_clk;

  //additional signals
  reg        [(`C_SLV_DWIDTH*(`MAX_BURST_LENGTH+1))-1 : 0] rd_data;
  reg        [(`C_SLV_DWIDTH*(`MAX_BURST_LENGTH+1))-1 : 0] test_data;
  reg        [`RESP_BUS_WIDTH-1 : 0]        response;
  reg        [(`RESP_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1 : 0] vresponse;
  reg        [`C_SLV_AWIDTH-1 : 0]          mtestADDR;
  reg        [(RUSER_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1 : 0] v_ruser;
  reg        [(WUSER_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1 : 0] v_wuser;

  //Integers
  integer                                   mtestID;
  integer                                   mtestBurstLength;
  integer                                   mtestLockType;
  integer                                   mtestBurstSize;
  integer                                   mtestCacheType;
  integer                                   mtestdatasize;
  integer                                   mtestProtectionType;
  integer                                   mtestRegion;
  integer                                   mtestQOS;
  integer                                   mtestBUSER;
  integer                                   mtestAWUSER;
  integer                                   mtestARUSER;
  integer                                   i;
  integer                                   j;
  integer                                   number_of_bytes_in_full_burst;
  //----------------------------------------------------------------------------
  // Instantiate bfm_system
  //----------------------------------------------------------------------------

  bfm_system
    dut (.sys_reset(rst_n),.sys_clk(sys_clk) );

  //----------------------------------------------------------------------------
  // Reset block
  //----------------------------------------------------------------------------

  initial begin
         rst_n = 1'b0;
    #`RESET_PERIOD rst_n = 1'b1;
  end

  //----------------------------------------------------------------------------
  // Simple Clock Generator
  //----------------------------------------------------------------------------

  initial sys_clk = 1'b0;
  always #`CLOCK_PERIOD sys_clk = !sys_clk;

  //----------------------------------------------------------------------------
  // Simple testbench logic
  //----------------------------------------------------------------------------

  initial begin
    //Wait for end of reset
    wait(rst_n == 0) @(posedge sys_clk);
    wait(rst_n == 1) @(posedge sys_clk);
    #`INIT_DELAY mtestProtectionType = 0;

  //----------------------------------------------------------------------------
  // Select the correct burst size ot match the data bus widths
  //----------------------------------------------------------------------------

    case (`C_SLV_DWIDTH)
      8  : mtestBurstSize = `BURST_SIZE_1_BYTE;
      16 : mtestBurstSize = `BURST_SIZE_2_BYTES;
      32 : mtestBurstSize = `BURST_SIZE_4_BYTES;
      64 : mtestBurstSize = `BURST_SIZE_8_BYTES;
      128 : mtestBurstSize = `BURST_SIZE_16_BYTES;
      256 : mtestBurstSize = `BURST_SIZE_32_BYTES;
      512 : mtestBurstSize = `BURST_SIZE_64_BYTES;
      1024 : mtestBurstSize = `BURST_SIZE_128_BYTES;
      default : begin
        $display("-----------------------------------------------------");
        $display("EXAMPLE TEST : FAILED -- Invalid C_SLV_DWIDTH");
        $display("-----------------------------------------------------");
      end
    endcase
    
    $display("---------------------------------------------------------");
    $display("EXAMPLE TEST:");
    $display("Full memory write followed by a full memory read");
    $display("---------------------------------------------------------");
    mtestID = 0;
    mtestLockType = `LOCK_TYPE_NORMAL;
    mtestBurstLength = `MAX_BURST_LENGTH;
    number_of_bytes_in_full_burst = ((`C_SLV_DWIDTH/8)*(`MAX_BURST_LENGTH+1));
    // adjunstement made in order not to exceed 4KB Boundary
    if (number_of_bytes_in_full_burst > 4*1024) begin
      number_of_bytes_in_full_burst = 4*1024;
      mtestBurstLength = ((4*1024)/(`C_SLV_DWIDTH/8))-1;
    end
    mtestdatasize = number_of_bytes_in_full_burst;
    mtestCacheType = 0;
    mtestProtectionType = 0;
    mtestRegion = 0;
    mtestQOS = 0;
    mtestAWUSER = 0;
    mtestARUSER = 0;
    v_wuser = 0;
    for (i = 0; i < ((`C_SLV_DWIDTH/8)*SLAVE_MEM_SIZE)/number_of_bytes_in_full_burst; i = i+1) begin
      // Make the test vector
      for (j = 0; j < number_of_bytes_in_full_burst; j=j+1) begin
        test_data[j*8 +: 8] = j+(i*number_of_bytes_in_full_burst);
      end
      mtestADDR = i*number_of_bytes_in_full_burst+`SLAVE_BASE_ADDR;
      dut.bfm_processor.bfm_processor.cdn_axi4_master_bfm_inst.WRITE_BURST(mtestID,
        mtestADDR,
        mtestBurstLength,
        mtestBurstSize,
        `BURST_TYPE_INCR,
        mtestLockType,
        mtestCacheType,
        mtestProtectionType,
        test_data,
        mtestdatasize,
        mtestRegion,
        mtestQOS,
        mtestAWUSER,
        v_wuser,
        response,
        mtestBUSER);
      $display("EXAMPLE TEST 1 : Burst %0d,WRITE DATA = 0x%h, response = 0x%h",i,test_data,response);
      CHECK_RESPONSE_OKAY(response);
    end

    $display("---------------------------------------------------------");
    $display("EXAMPLE TEST 1 : Full memory write finshed.");
    $display("---------------------------------------------------------");
    for (i = 0; i < ((`C_SLV_DWIDTH/8)*SLAVE_MEM_SIZE)/number_of_bytes_in_full_burst;i = i+1) begin

      // Make the expected data vector
      for (j = 0; j < number_of_bytes_in_full_burst; j=j+1) begin
        test_data[j*8 +: 8] = j+(i*number_of_bytes_in_full_burst);
      end

      mtestADDR = i*number_of_bytes_in_full_burst+`SLAVE_BASE_ADDR;
      dut.bfm_processor.bfm_processor.cdn_axi4_master_bfm_inst.READ_BURST(
        mtestID,
        mtestADDR,
        mtestBurstLength,
        mtestBurstSize,
        `BURST_TYPE_INCR,
        mtestLockType,
        mtestCacheType,
        mtestProtectionType,
        mtestRegion,
        mtestQOS,
        mtestARUSER,
        rd_data,
        vresponse,
        v_ruser);

      $display("EXAMPLE TEST 1 : READ DATA = 0x%h, vresponse = 0x%h",rd_data,vresponse);
      CHECK_RESPONSE_VECTOR_OKAY(vresponse,mtestBurstLength);
      COMPARE_DATA(test_data,rd_data);
      COMPARE_RUSER(0,v_ruser);
    end

    $display("---------------------------------------------------------");
    $display("EXAMPLE TEST: Full memory read finshed.");
    $display("---------------------------------------------------------");
  $display("----------------------------------------------------");
  $display("Peripheral Verification Completed Successfully");
  $display("----------------------------------------------------");
  end //end of Initial block

  //----------------------------------------------------------------------------
  //   TEST LEVEL API: CHECK_RESPONSE_OKAY(response)
  //----------------------------------------------------------------------------

  //Description: This task check if the return response is equal to OKAY
  //----------------------------------------------------------------------
  task automatic CHECK_RESPONSE_OKAY;
    input [`RESP_BUS_WIDTH-1:0] response;
     begin
      if (response !== `RESPONSE_OKAY) begin
        $display("TESTBENCH FAILED! Response is not OKAY",
          "\n expected = 0x%h",`RESPONSE_OKAY,
          "\n actual = 0x%h", response);
        $stop;
      end
    end
  endtask
  //----------------------------------------------------------------------------
  //   TEST LEVEL API: COMPARE_DATA(expected,actual)
  //----------------------------------------------------------------------------

  //Description: This task checks if the actual data is equal to the expected data
  //----------------------------------------------------------------------
  task automatic COMPARE_DATA;
    input [(`C_SLV_DWIDTH*(`MAX_BURST_LENGTH+1))-1:0] expected;
    input [(`C_SLV_DWIDTH*(`MAX_BURST_LENGTH+1))-1:0] actual;
    begin
      if (expected === 'hx || actual === 'hx) begin
        $display("TESTBENCH FAILED! COMPARE_DATA cannot be performed with an expected or actual vector that is all 'x'!");
        $stop;
      end
      if (actual !== expected) begin
        $display("TESTBENCH FAILED! Data expected is not equal to actual.","\n expected = 0x%h",expected,
        "\n actual   = 0x%h",actual);
        $stop;
      end
    end
    endtask
  //----------------------------------------------------------------------------
  //   TEST LEVEL API: CHECK_RESPONE_VECTOR_OKAY(response,burst_length)
  //----------------------------------------------------------------------------

//Description: This task checks if the response vectorreturned from the READ_BURST
//-------------------------------------------------
  task automatic CHECK_RESPONSE_VECTOR_OKAY;
    input [(`RESP_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] response;
    input integer                                       burst_length;
    integer                                             i;
    begin
      for (i = 0; i < burst_length+1; i = i+1) begin
        CHECK_RESPONSE_OKAY(response[i*`RESP_BUS_WIDTH +: `RESP_BUS_WIDTH]);
      end
    end
  endtask

  //----------------------------------------------------------------------------
  //   TEST LEVEL API: COMPARE_RUSER(expected, actual)
  //----------------------------------------------------------------------------

// Description:This task checks if the actual wuser data is equal to the expected data.
//------------------------------------------------------------------------
  task automatic COMPARE_RUSER;
    input [(RUSER_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] expected;
    input [(RUSER_BUS_WIDTH*(`MAX_BURST_LENGTH+1))-1:0] actual;
    begin
      if (expected === 'hx || actual === 'hx) begin
        $display("TESTBENCH FAILED! COMPARE_RUSER cannotbe performed with an expected or actual vector that is all 'x'!");
        $stop;
      end
      if (actual != expected) begin
        $display("TESTBENCH FAILED! RUSER data expected is not equal to actual.",
          "\n expected = 0x%h",expected,
          "\n actual   = 0x%h",actual);
        $stop;
      end
    end
  endtask

endmodule
