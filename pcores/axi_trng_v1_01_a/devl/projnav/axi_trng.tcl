project new /home/ajmills/CprE581/pcores/axi_trng_v1_01_a/devl/projnav/axi_trng.xise;
project set family zynq;
project set device xc7z020;
project set package clg484;
project set speed -1;
project set top_level_module_type HDL;
project set synthesis_tool "XST (VHDL/Verilog)";
lib_vhdl new axi_trng_v1_01_a;
xfile add /home/ajmills/CprE581/pcores/axi_trng_v1_01_a/hdl/vhdl/axi_trng.vhd -lib_vhdl axi_trng_v1_01_a;
xfile add /home/ajmills/CprE581/pcores/axi_trng_v1_01_a/hdl/vhdl/user_logic.vhd -lib_vhdl axi_trng_v1_01_a;
lib_vhdl new proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/proc_common_pkg.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/ipif_pkg.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/or_muxcy.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/or_gate128.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/family_support.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/pselect_f.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/counter_f.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/srl_fifo_rbu_f.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/cntr_incr_decr_addn_f.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/dynshreg_f.vhd -lib_vhdl proc_common_v3_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v3_00_a/hdl/vhdl/muxf_struct_f.vhd -lib_vhdl proc_common_v3_00_a;
lib_vhdl new axi_slave_burst_v1_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/axi_slave_burst_v1_00_a/hdl/vhdl/address_decode.vhd -lib_vhdl axi_slave_burst_v1_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/axi_slave_burst_v1_00_a/hdl/vhdl/addr_gen.vhd -lib_vhdl axi_slave_burst_v1_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/axi_slave_burst_v1_00_a/hdl/vhdl/control_state_machine.vhd -lib_vhdl axi_slave_burst_v1_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/axi_slave_burst_v1_00_a/hdl/vhdl/read_data_path.vhd -lib_vhdl axi_slave_burst_v1_00_a;
xfile add /remote/Xilinx/14.6/EDK/hw/XilinxProcessorIPLib/pcores/axi_slave_burst_v1_00_a/hdl/vhdl/axi_slave_burst.vhd -lib_vhdl axi_slave_burst_v1_00_a;
project close;
