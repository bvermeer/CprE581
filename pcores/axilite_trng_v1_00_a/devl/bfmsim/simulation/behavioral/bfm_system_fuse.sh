#!/bin/sh
#  Simulation Model Generator
#  Xilinx EDK 14.6 EDK_P.68d
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     bfm_system_fuse.sh (Thu Nov 13 23:51:12 2014)
#
#  ISE Simulator Fuse Script File
#
#  The Fuse script compiles and generates an ISE simulator
#  executable named isim_bfm_system that is used to run your
#  simulation. To run a simulation in command line mode,
#  perform the following steps:
#
#  1. Run the ISE Simulator Fuse script file
#     source bfm_system_fuse.sh
#  2. Use a text editor to modify the signal wave files,
#     which have the file name <module>_wave.tcl
#  3. Launch the simulator using the following command:
#     isim_bfm_system -gui -tclbatch bfm_system_setup.tcl
#
fuse -incremental work.bfm_system_tb work.glbl -prj bfm_system.prj -L xilinxcorelib_ver -L secureip -L unisims_ver -L unimacro_ver  -o isim_bfm_system
