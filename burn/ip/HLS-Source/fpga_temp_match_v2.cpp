#include "fpga_temp_matching.h"


buffer row_buf = {};
window win_buf = {};

void SAD_MATCH(axis_t *INPUT, axis_t *OUTPUT){

#pragma HLS INTERFACE axis depth=50 port=INPUT
#pragma HLS INTERFACE axis depth=50 port=OUTPUT
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL

#pragma HLS array_partition variable=win_buf.win block factor = 10 dim=0
#pragma HLS array_partition variable=templ block factor = 100

#pragma HLS dependence variable=row_buf.buf intra true
//#pragma HLS array_partition variable=row_buf.buf block factor = 10 dim=1
    axis_t cur;
    int cur_data;
    int out[size];
#pragma HLS dependence variable=out intra RAW true
	int i = 0, j = 0, k = 0, o = 0, m = 0, n = 0, l = 0;


	// Pull next pixel into buffer
	for (i = 0; i < size; i++) {
		cur = *INPUT;
		INPUT++;
		cur_data = cur.data;
		row_buf.buf[tmphei-1][k] = cur_data;

		// shift window
		for (m = 0; m < tmphei-1; m++) {
#pragma HLS PIPELINE
			for (n = 0; n < tmphei; n++) {
				win_buf.win[n][m] = win_buf.win[n][m+1];
			}
		}

		// pull column from buffer into window
		for (l = 0; l < tmphei; l++) {
#pragma HLS PIPELINE
			win_buf.win[l][tmpwid-1] = row_buf.buf[l][k];
		}

		// SAD (Sum of Absolute Differences)
	    int y, z, sad = 0;
	    int absl = 0;
	    for (y = 0; y < tmphei; y++) {
	#pragma HLS PIPELINE
	        for (z = 0; z < tmpwid; z++) {
	            absl = win_buf.win[y][z]-templ[z+tmpwid*y] > 0 ? win_buf.win[y][z]-templ[z+tmpwid*y] : win_buf.win[y][z]-templ[z+tmpwid*y] * -1;
	            sad+= absl;
	        }
	    }

	    out[i] = (sad < thre ? 1:0);

		// if the buffer row is filled, shift buffer row up by 1
	    k++;
		if (k == inwid) {
			k = 0;
			for (j = 0; j < tmphei - 1; j++){
#pragma HLS PIPELINE
				for(o = 0; o < inwid; o++) {
					row_buf.buf[j][o] = row_buf.buf[j+1][o];
				}
			}
		}

    cur.last = 0;
    cur.data = out[i];
    if (i == size - 1) {
    	cur.last = 1;
    } else cur.last = 0;
    *OUTPUT++ = cur;
	}
}
