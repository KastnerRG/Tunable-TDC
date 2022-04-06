#include "../src/present.h"

int main() {
	ap_uint<1> tbLast = 0;
	ap_axiu<144> tbStateIn;
	ap_axiu<64> tbStateOut;

	//tbStateIn.data << hex << 0x;
	istringstream("6bc1bee22e409f962b7e151628aed2a6abf7") >> hex >> tbStateIn.data;
	//istringstream("69 f9 04 e2 2e eb 1c b6 7f  ba 6a 2dea826151e7b2") >> hex >> tbStateIn.data;
	//istringstream("969f402ee2bec16bf7aba6d2ae2816157e2b") >> hex >> tbStateIn.data;
	cout << "STORE: " << hex << tbStateIn.data << endl;
	tbStateIn.last = tbLast;
	present(tbStateIn, tbStateOut);

	cout << "RES" << hex << tbStateOut.data << endl;

	return 0;
}



