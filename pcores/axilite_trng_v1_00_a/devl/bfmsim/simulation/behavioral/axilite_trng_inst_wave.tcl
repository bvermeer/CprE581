#  Simulation Model Generator
#  Xilinx EDK 14.6 EDK_P.68d
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     axilite_trng_inst_wave.tcl (Thu Nov 13 23:51:12 2014)
#
#  Module   bfm_system_axilite_trng_inst_wrapper
#  Instance axilite_trng_inst
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "bfm_system_tb${ps}dut" }

# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_ACLK -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_ARESETN -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_AWADDR -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_AWVALID -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_WDATA -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_WSTRB -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_WVALID -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_BREADY -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_ARADDR -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_ARVALID -into $id
# wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_RREADY -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_ARREADY -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_RDATA -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_RRESP -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_RVALID -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_WREADY -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_BRESP -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_BVALID -into $id
  wave add $tbpath${ps}axilite_trng_inst${ps}S_AXI_AWREADY -into $id

