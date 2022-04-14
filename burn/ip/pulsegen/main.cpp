/* ----------------------------------------------------------------------
# Copyright (c) 2022, The Regents of the University of California All
# rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#
#     * Neither the name of The Regents of the University of California
#       nor the names of its contributors may be used to endorse or
#       promote products derived from this software without specific
#       prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL REGENTS OF THE
# UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# DAMAGE.
# ---------------------------------------------------------------------*/
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
