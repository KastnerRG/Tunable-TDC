############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project present_hls
set_top present
add_files present_hls/src/present.cpp
add_files present_hls/src/present.h
add_files present_hls/src/present_rounds.cpp
add_files -tb present_hls/tb/tb_present.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 10 -name default
#source "./present_hls/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
