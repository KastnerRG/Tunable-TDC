############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project orcaPLGate
set_top orcaPLGate
add_files orcaPLGate.cpp
add_files orcaPLGate.hpp
add_files -tb main.cpp
open_solution "orcaPLGate"
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./orcaPLGate/orcaPLGate/directives.tcl"
csim_design -setup
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
