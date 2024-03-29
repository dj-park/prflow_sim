############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project data_gen_hls_prj
set_top data_gen_config
add_files data_gen_rendering_src/typedefs.h
add_files data_gen_rendering_src/input_data.h
add_files data_gen_rendering_src/data_gen_is_done.cpp
open_solution "solution1" -flow_target vivado
set_part {xczu9eg-ffvb1156-2-e}
create_clock -period 5 -name default
source "./data_gen_hls_prj/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
