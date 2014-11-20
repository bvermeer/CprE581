//-----------------------------------------------------------------------------
// bfm_system_tb.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver

// START USER CODE (Do not remove this line)

// User: Put your directives here. Code in this
//       section will not be overwritten.

// END USER CODE (Do not remove this line)

module bfm_system_tb
  (
  );

  // START USER CODE (Do not remove this line)

  // User: Put your signals here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)

  real sys_clk_PERIOD = 10000.000000;

  // Internal signals

  reg sys_clk;
  reg sys_reset;

  bfm_system
    dut (
      .sys_reset ( sys_reset ),
      .sys_clk ( sys_clk )
    );

  // Clock generator for sys_clk

  initial
    begin
      sys_clk = 1'b0;
      forever #(sys_clk_PERIOD/2.00)
        sys_clk = ~sys_clk;
    end

  // START USER CODE (Do not remove this line)

  // User: Put your stimulus here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)

endmodule

