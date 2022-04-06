#include "orcaPLGate.hpp"
#include "ap_utils.h"
static ap_uint<1> state = 0;
ap_uint<1> orcaPLGate(ap_uint<1> pulse, ap_uint<2> PS) {
#pragma HLS INTERFACE ap_ctrl_none port=pulse
#pragma HLS INTERFACE ap_ctrl_none port=PS
#pragma HLS INTERFACE ap_ctrl_none port=return
	if (PS[1] == 1) {
		return 1;
	}
	if (pulse == 1 && PS[0] == 1) {
		state = 1;
	}
	return (state == 1) ? 1  : 0;
}
