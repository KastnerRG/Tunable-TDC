#include "present.h"

// full-round PRESENT block cipher
//#define present(plain, key, cipher) present_rounds((plain), (key), 31, (cipher))

void present(ap_axiu<144> &stateIn, ap_axiu<64> &stateOut){

	#pragma HLS INTERFACE axis depth=256 port=stateOut
	#pragma HLS INTERFACE axis depth=512 port=stateIn
	#pragma HLS INTERFACE ap_ctrl_hs port=return

   ap_axiu<144> tmp = stateIn;
   ap_uint<64> cipher = present_rounds(tmp.data(143,80), tmp.data(79,0), 31);

   io_section:{
	#pragma HLS protocol fixed
	   stateOut.data = cipher;
	   stateOut.last = stateIn.last;
   }
 }


