#  Simulation Model Generator
#  Xilinx EDK 14.6 EDK_P.68d
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     bfm_system_setup.tcl (Thu Nov 13 23:51:12 2014)
#
#  ISE Simulator Setup Script File
#
#  The Simulation Setup script file defines macros and
#  commands to automate the setup of signal tracing for
#  for waveform viewing, as well as helper functions.
#
#  To use this script, run the ISE Simulator exectuable
#  with the '-tclbatch bfm_system_setup.tcl' option.
#  The script does not exit. Type 'h' at the simulator prompt
#  to print a list of commands.
#
#  Comment or uncomment commands in wave trace TCL files
#  to change the set of signals saved.
#
# =====================================================

# =====================================================
# Set up signal tracing
# =====================================================

# Edit _wave.tcl files to modify signal tracing

proc w {} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  source bfm_system_wave.tcl
}
proc w_top {} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  set id [group add "Top level ports"]
  source top_level_ports_wave.tcl
}
proc w_instance {{design_instance_name }} {
  global  tbpath
  global  PathSeparator
  puts  "Setting up signal tracing ..."
  wave add $design_instance_name
}
# =====================================================
# Set up help menu
# =====================================================

proc PrintHelpInformation {} {
  puts "**********************************************************************"
  puts "**********************************************************************"
  puts "***"
  puts "***   Simulation Setup Macros (bfm_system_setup.tcl)"
  puts "***"
  puts "***   w   =>  set up signal tracing for the ISE Simulator waveform"
  puts "***           viewer (edit signal lists in bfm_system_wave.tcl)"
  puts "***"
  puts "***   w_top =>  Observe top level signals in the ISim Waveform Viewer"
  puts "***"
  puts "***   w_instance <<instance name>>  =>  Observe signals of the given instance in the ISim waveform viewer"
  puts "***           (Example: w /system/dlm_cntrl to observe signals of dlmb controller)."
  puts "***"
  puts "***   h   =>  print this help menu"
  puts "***"
  puts "***   Default flow is: reset; w_top; run 1000ns or reset; w; run 1000ns"
  puts "***"
  puts "**********************************************************************"
  puts "**********************************************************************"
}
proc h {} { PrintHelpInformation }

puts  "Setting up simulation commands ..."

PrintHelpInformation
