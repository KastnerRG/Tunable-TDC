if { $argc != 6 } {
    catch {common::send_msg_id "GEN-IP-001" "ERROR" "Generate IP script
    requires two arguments. <part name> (e.g. xc7vx485tffg1761-2) <target> 
    (e.g. phase, the name of the method to synthesize), <ip name> 
    (e.g PhaseShifter), and Xilinx Part Version (7-Series: 1.0, 
    Ultrascale: 2.0, Ultrascale+: 3.0)

    Example Usage:
      vivado_hls -f script.tcl xc7vx485tffg1761-2 phase PhaseShifter 1.0"}
    return 1
}
set part [ lindex $argv 2]
set target [ lindex $argv 3]
set name [ lindex $argv 4]
set ver [ lindex $argv 5]
open_project build
set_top $target
add_files main.cpp
open_solution "$part.$target"
set_part $part
create_clock -period 10 -name default
csynth_design
export_design -format ip_catalog -library hlsip \
    -description "HLS Core: $target Function for the Burn-In Project" \
    -vendor "UCSD" -version "$ver" -display_name "$name"
exit
