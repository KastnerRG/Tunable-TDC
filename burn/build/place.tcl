proc place { njobs npaths chainid top mmcm mmcm_loc} {

    # Placement Parameters
    set id_path idDesign

    open_run synth_1
    set origin [lindex [lsort [get_sites SLICE_*]] 0]
    set bels [lsort [regsub -all $origin/ [get_bels $origin/*FF*] ""]]
    foreach { x y } { 11 0 } {
	set carry_x $x
	set carry_y $y
	set launch_x [expr $carry_x - 1]
	set launch_y [expr $carry_y + 0]
	foreach bel $bels {
	    place_run $njobs $npaths $chainid $top $launch_x $launch_y $bel $carry_x $carry_y $mmcm $mmcm_loc
	}
    }
}

proc place_run { njobs npaths chainid top launch_x launch_y bel carry_x carry_y mmcm mmcm_loc} {
    puts "PLACE RUN"
    set origin [lindex [lsort [get_sites SLICE_*]] 0]
    set carry_name crossClockCarry
    set sync_depth [get_property CONFIG.C_SYNC_DEPTH [get_bd_cell chain$chainid/$carry_name]]
    set sync_depth [expr $sync_depth - 1]
    set carry_bits [get_property CONFIG.C_OUT_WIDTH [get_bd_cell chain$chainid/$carry_name]]
    set slice_bits [expr [llength [get_bels $origin/*FF*]] / 2]
    set carry_slices [expr $carry_bits / $slice_bits]

    set veryr [string range [version -short] 0 3]
    set impl_name impl_$carry_x\_$carry_y
    set first_run [get_runs $impl_name]
    set path $top/chain$chainid
    if { $first_run == "" } {
	create_run -flow "Vivado Implementation $veryr" $impl_name \
	    -parent_run synth_1 -strategy "Performance_Explore"

	place_launch $path $launch_x $launch_y $bel
	place_carry $path $carry_name $carry_x $carry_y
	place_syncs $path $carry_name $carry_x $carry_y $carry_slices $sync_depth

	place_mmcm $path $mmcm $mmcm_loc

	save_design

	launch_runs $impl_name -jobs $njobs
	wait_on_run $impl_name

	open_run $impl_name
    } else {
	open_run $impl_name
	place_launch $path $launch_x $launch_y $bel
	save_design -force
	route_design -preserve
    }

    set lut_pins [list I0 I1 I2 I3 I4 I5]
    foreach {pin} $lut_pins {
	set ccc_path $path/$carry_name/inst
	set out_name $top\_$launch_x\_$launch_y\_$bel\_$carry_x\_$carry_y\_$pin

	foreach {dis} $lut_pins {
	    route_design -unroute -nets [get_nets $ccc_path/routethrough/$dis]
	    disconnect_net -objects [list $ccc_path/routethrough/$dis]
	    connect_net -objects [list $ccc_path/routethrough/$dis] \
		-net [list $ccc_path/<const0>]
	}

	disconnect_net -objects [list $ccc_path/routethrough/$pin]
	connect_net -objects [list $ccc_path/routethrough/$pin] \
	    -net [list $ccc_path/S_AXIS_TDATA[0]]

	save_design -force
	route_design -preserve
	write_bitstream -force $out_name.bit

	report_timing_summary -delay_type min_max -report_unconstrained \
	    -check_timing_verbose -max_paths $npaths -input_pins -name timing \
	    -file $out_name.rpt
    }
    close_design
}

proc place_carry { top carry_name x y } {
    puts "PLACE CARRY"
    set path $top/$carry_name/inst
    set top [get_cells $path/carrygen[0].*]
    set_property LOC SLICE_X$x\Y$y $top
    if { [get_cells $path/routethrough] != "" } {
	set_property LOC SLICE_X$x\Y$y [get_cells $path/routethrough]
    }
}

proc place_syncs { top carry_name x y slices depth } {
    set path $top/$carry_name/inst
    set origin [lindex [lsort [get_sites SLICE_*]] 0]

    set primaries [lsort [regsub -all $origin/ [get_bels -regexp $origin/.FF] ""]]
    set secondaries [lsort [regsub -all $origin/ [get_bels -regexp $origin/.(5FF)*(FF2)*] ""]]
    set slice_bits [llength $primaries]
    for {set slice_idx 0} {$slice_idx < $slices} {incr slice_idx} {
	set yloc [expr $y + $slice_idx]

	for {set sync_idx 1} {$sync_idx < $depth} {incr sync_idx} {
	    set bit_idx [expr ($slice_idx * $slice_bits)]
	    set xloc [expr $x + $sync_idx]

	    set sync_path $path/syncgen[$sync_idx]
	    foreach reg $secondaries {
		set target [get_cells $sync_path.rSync_reg[$sync_idx][$bit_idx]]
		set_property BEL $reg $target
		set_property LOC SLICE_X$xloc\Y$yloc $target
		incr bit_idx
	    }
	}

	set bit_idx [expr ($slice_idx * $slice_bits)]
	foreach reg $primaries {
	    set target [get_cells $path/rSync_reg[0][$bit_idx]]
	    set_property BEL $reg $target
	    set_property LOC SLICE_X$x\Y$yloc $target
	    incr bit_idx
	}
    }
}

proc place_launch { top x y bel } {
    set launch_path $top/launchpad
    set reg [get_cells $launch_path/inst/rInSyncData_reg[0][0]]

    set_property BEL $bel $reg
    set_property LOC SLICE_X$x\Y$y $reg
}

proc place_mmcm { top mmcm loc } {
    set target [get_cells $top/clkWiz/inst/CLK_CORE_DRP_I/clk_inst/mmcm*]
    set_property BEL $mmcm $target
    set_property LOC $mmcm\_$loc $target
}
