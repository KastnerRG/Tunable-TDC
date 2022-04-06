#include "ap_int.h"
#define LOG_PERIOD 1
struct axis_t {
	char data;
	ap_int<1> last;
};

void pulsegen(axis_t *O, ap_uint<5> duration = 5, ap_uint<1> syncer = 0) {
#pragma HLS INTERFACE axis depth=1 port=O
#pragma HLS INTERFACE s_axilite port=return bundle=CNTRL
#pragma HLS INTERFACE s_axilite port=duration bundle=CNTRL
	while (syncer != 1);

	ap_uint<32> ctr;
	axis_t temp;
	char last = 0;
	for ( ctr = 1; !last ; ++ctr ) {
#pragma HLS pipeline
		last = ctr.test(duration);
		temp.last = last != 0;
		temp.data = ctr.test(LOG_PERIOD);
		*O ++ = temp;
	}
}
