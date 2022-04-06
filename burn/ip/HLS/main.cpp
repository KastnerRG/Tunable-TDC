#include "orcaPLGate.hpp"
#include <stdio.h>


int main() {
	ap_uint<1> p = 1;
	ap_uint<2> ps = 1;
	ap_uint<1> res = orcaPLGate(p, ps);
	if(res != 1){
		printf("Fail!\n");
		return -1;
	} else {
		printf("Sucess!\n");
	}
}
