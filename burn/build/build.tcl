# This file is a script for building Overlay Designs in various
# ways. It also handles IP directories.
# The arguments are as follows:
# 1. Name of the Overlay without the .tcl extension
# 2. Run type (default, or place)
# 3. Xilinx Part (e.g. xc7z020clg400-1)
# 4. Board Name (e.g PYNQ-Z1)
# 5. IP Directories (list of paths).
set argc [llength $argv]
#set run_type "default"
set run_type "place"
set target ""
set part ""
set board ""
set board_dir "../../constraints/"
set build_dir "../../build/"
set ip_dirs ""
set njobs 6
set npaths 200
set mmcm NOT_SPECIFIED
set mmcm_loc NOT_SPECIFIED
if { $argc != 0 } {
    if { $argc <= 6 } {
	puts ""
	set errmsg "Expected at least three arguments: Name of Overlay \
                (e.g. riscv), run type (e.g sweep, single, or synth), part \
                (e.g. xc7z020clg400-1), and board (e.g PYNQ-Z1)"
	catch {common::send_msg_id "PYNQ-000" "ERROR" $errmsg}
	return 1
    }

    set target [lindex $argv 0]
    if { [file exists $target.tcl] == 0 } {
        puts ""
	set errmsg "Could not find file: $target.tcl. \
            The makefile must be co-located with $target.tcl, or \
            $target is incorrect"
        catch {common::send_msg_id "PYNQ-000" "ERROR" $errmsg}
        return 1
    }

    set run_arg [lindex $argv 1]
    if { $run_arg == "default"} {
	set run_type "default"
    } elseif {$run_arg == "place"} {
	set run_type "place"
    } else {
	puts ""
	set errmsg "Unknown argument value $run_arg. Valid values are \
            \"default\", \"place\""
	catch {common::send_msg_id "PYNQ-000" "ERROR" $errmsg}
	return 1
    }
    puts "run_type is $run_type"

    set part [lindex $argv 2]
    create_project $target $target -part $part 

    set board [lindex $argv 3]
    set board_xdc $board_dir/$board.xdc
    if { [file exists $board_xdc] == 0 } {
        puts ""
	set errmsg "Could not find file: $board_dir/$board.xdc" 
        catch {common::send_msg_id "PYNQ-000" "ERROR" $errmsg}
        return 1
    }

    set mmcm [lindex $argv 4]
    set mmcm_loc [lindex $argv 5]

    # In order to compile the Block Diagram design (in a .tcl file), we need to add
    # the directory containing the IP to the Vivado search path.
    set ip_dirs [lrange $argv 6 end]
    puts $ip_dirs
    set_property ip_repo_paths $ip_dirs [current_project]
    update_ip_catalog
}
puts "Passed ArgParse"

# Build the Vivado Block Diagram design
set design_name $target
create_bd_design $design_name
current_bd_design $design_name
source $target.tcl
create_root_design ""

# Create top level file
make_wrapper -files [get_files ./$target/$target.srcs/sources_1/bd/$target/$target.bd] -top

# Add top level file to project
add_files -norecurse ./$target/$target.srcs/sources_1/bd/$target/hdl/$target\_wrapper.v
update_compile_order -fileset sources_1

# Mark top level file as top level
set_property top $target\_wrapper [current_fileset]
update_compile_order -fileset sources_1

# Add board design contraints file
add_files -fileset constrs_1 -norecurse $board_xdc
update_compile_order -fileset sources_1

# Launch unplaced design run
launch_runs impl_1 -jobs $njobs
wait_on_run impl_1
open_run impl_1
set_property SEVERITY {Warning} [get_drc_checks REQP-181]
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
write_bitstream -force $target.bit
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -max_paths $npaths -input_pins -name timing \
    -file $target.rpt
close_design
# If $run_type is "place" source the runs.tcl script to build the other
# designs
if { $run_type == "place" } {
    puts "RUNNING PLACEMENT"
    source $build_dir/place.tcl
    place $njobs $npaths 0 $target\_i $mmcm $mmcm_loc
} 



