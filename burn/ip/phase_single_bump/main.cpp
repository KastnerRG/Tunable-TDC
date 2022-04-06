#include "ap_int.h"
void phase(ap_uint<32> rincdec, volatile ap_uint<1>& psincdec, volatile ap_uint<1>& psen, ap_uint<1> ps_done) {
#pragma HLS INTERFACE s_axilite port=return bundle=CNTRL
#pragma HLS INTERFACE s_axilite port=rincdec bundle=CNTRL
#pragma HLS INTERFACE ap_none port=psincdec
#pragma HLS INTERFACE ap_none port=psen
#pragma HLS PROTOCOL fixed
	ap_wait();
	psen = 0;
	ap_wait();
	psincdec = rincdec.test(0);
	ap_wait();
	psen = 0;
	ap_wait();
	psen = 1;
	ap_wait();
	psen = 0;
	ap_wait();
	return;
}
