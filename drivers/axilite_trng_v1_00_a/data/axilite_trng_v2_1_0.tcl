##############################################################################
## Filename:          /home/ajmills/zedboard-trng/drivers/axilite_trng_v1_00_a/data/axilite_trng_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Nov 10 22:34:19 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "axilite_trng" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
