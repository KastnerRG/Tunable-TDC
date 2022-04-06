#include "present.h"

// full-round should be 31, i.e. rounds = 31
// plain and cipher can overlap, so do key and cipher
ap_uint<64> present_rounds(ap_uint<64> plain, ap_uint<80> key, word8 rounds) {
	ap_uint<64> cipher;
	word8 round_counter = 1;

	ap_uint<64> state;
	ap_uint<80> round_key;

	// add key
	state(63,56) = plain(63,56) ^ key(79,72); // 0
	state(55,48) = plain(55,48) ^ key(71,64); // 1
	state(47,40) = plain(47,40) ^ key(63,56); // 2
	state(39,32) = plain(39,32) ^ key(55,48); // 3
	state(31,24) = plain(31,24) ^ key(47,40); // 4
	state(23,16) = plain(23,16) ^ key(39,32); // 5
	state(15,8)  = plain(15,8) ^ key(31,24);  // 6
	state(7,0)   = plain(7,0) ^ key(23,16);   // 7

	// update key
	round_key(7,0) = key(31,24) << 5 | key(23,16) >> 3;
	round_key(15,8) = key(39,32) << 5 | key(31,24) >> 3;
	round_key(23,16) = key(47,40) << 5 | key(39,32) >> 3;
	round_key(31,24) = key(55,48) << 5 | key(47,40) >> 3;
	round_key(39,32) = key(63,56) << 5 | key(55,48) >> 3;
	round_key(47,40) = key(71,64) << 5 | key(63,56) >> 3;
	round_key(55,48) = key(79,72) << 5 | key(71,64) >> 3;
	round_key(63,56) = key(7,0) << 5 | key(79,72) >> 3;
	round_key(71,64) = key(15,8) << 5 | key(7,0) >> 3;
	round_key(79,72) = key(23,16) << 5 | key(15,8) >> 3;

	round_key(79,72) = (round_key(79,72) & 0x0F) | sbox[round_key(79,72) >> 4];

	round_key(23,16) = round_key(23,16) ^ (round_counter >> 1);
	round_key(15,8) = round_key(15,8) ^ (round_counter << 7);

	// substitution and permutation
	cipher(63,56) =
		(sbox_pmt_3[state(63,56)] & 0xC0) |
		(sbox_pmt_2[state(55,48)] & 0x30) |
		(sbox_pmt_1[state(47,40)] & 0x0C) |
		(sbox_pmt_0[state(39,32)] & 0x03);
	cipher(55,48) =
		(sbox_pmt_3[state(31,24)] & 0xC0) |
		(sbox_pmt_2[state(23,16)] & 0x30) |
		(sbox_pmt_1[state(15,8)] & 0x0C) |
		(sbox_pmt_0[state(7,0)] & 0x03);

	cipher(47,40) =
		(sbox_pmt_0[state(63,56)] & 0xC0) |
		(sbox_pmt_3[state(55,48)] & 0x30) |
		(sbox_pmt_2[state(47,40)] & 0x0C) |
		(sbox_pmt_1[state(39,32)] & 0x03);
	cipher(39,32) =
		(sbox_pmt_0[state(31,24)] & 0xC0) |
		(sbox_pmt_3[state(23,16)] & 0x30) |
		(sbox_pmt_2[state(15,8)] & 0x0C) |
		(sbox_pmt_1[state(7,0)] & 0x03);
	cipher(31,24) =
		(sbox_pmt_1[state(63,56)] & 0xC0) |
		(sbox_pmt_0[state(55,48)] & 0x30) |
		(sbox_pmt_3[state(47,40)] & 0x0C) |
		(sbox_pmt_2[state(39,32)] & 0x03);
	cipher(23,16) =
		(sbox_pmt_1[state(31,24)] & 0xC0) |
		(sbox_pmt_0[state(23,16)] & 0x30) |
		(sbox_pmt_3[state(15,8)] & 0x0C) |
		(sbox_pmt_2[state(7,0)] & 0x03);
	cipher(15,8) =
		(sbox_pmt_2[state(63,56)] & 0xC0) |
		(sbox_pmt_1[state(55,48)] & 0x30) |
		(sbox_pmt_0[state(47,40)] & 0x0C) |
		(sbox_pmt_3[state(39,32)] & 0x03);
	cipher(7,0) =
		(sbox_pmt_2[state(31,24)] & 0xC0) |
		(sbox_pmt_1[state(23,16)] & 0x30) |
		(sbox_pmt_0[state(15,8)] & 0x0C) |
		(sbox_pmt_3[state(7,0)] & 0x03);

	for (round_counter = 2; round_counter <= rounds; round_counter++) {
		state(63,56) = cipher(63,56) ^ round_key(79,72); // 0
		state(55,48) = cipher(55,48) ^ round_key(71,64); // 1
		state(47,40) = cipher(47,40) ^ round_key(63,56); // 2
		state(39,32) = cipher(39,32) ^ round_key(55,48); // 3
		state(31,24) = cipher(31,24) ^ round_key(47,40); // 4
		state(23,16) = cipher(23,16) ^ round_key(39,32); // 5
		state(15,8)  = cipher(15,8) ^ round_key(31,24);  // 6
		state(7,0)   = cipher(7,0) ^ round_key(23,16);   // 7

		// substitution and permutation
		cipher(63,56) =
			(sbox_pmt_3[state(63,56)] & 0xC0) |
			(sbox_pmt_2[state(55,48)] & 0x30) |
			(sbox_pmt_1[state(47,40)] & 0x0C) |
			(sbox_pmt_0[state(39,32)] & 0x03);
		cipher(55,48) =
			(sbox_pmt_3[state(31,24)] & 0xC0) |
			(sbox_pmt_2[state(23,16)] & 0x30) |
			(sbox_pmt_1[state(15,8)] & 0x0C) |
			(sbox_pmt_0[state(7,0)] & 0x03);
		cipher(47,40) =
			(sbox_pmt_0[state(63,56)] & 0xC0) |
			(sbox_pmt_3[state(55,48)] & 0x30) |
			(sbox_pmt_2[state(47,40)] & 0x0C) |
			(sbox_pmt_1[state(39,32)] & 0x03);
		cipher(39,32) =
			(sbox_pmt_0[state(31,24)] & 0xC0) |
			(sbox_pmt_3[state(23,16)] & 0x30) |
			(sbox_pmt_2[state(15,8)] & 0x0C) |
			(sbox_pmt_1[state(7,0)] & 0x03);
		cipher(31,24) =
			(sbox_pmt_1[state(63,56)] & 0xC0) |
			(sbox_pmt_0[state(55,48)] & 0x30) |
			(sbox_pmt_3[state(47,40)] & 0x0C) |
			(sbox_pmt_2[state(39,32)] & 0x03);
		cipher(23,16) =
			(sbox_pmt_1[state(31,24)] & 0xC0) |
			(sbox_pmt_0[state(23,16)] & 0x30) |
			(sbox_pmt_3[state(15,8)] & 0x0C) |
			(sbox_pmt_2[state(7,0)] & 0x03);
		cipher(15,8) =
			(sbox_pmt_2[state(63,56)] & 0xC0) |
			(sbox_pmt_1[state(55,48)] & 0x30) |
			(sbox_pmt_0[state(47,40)] & 0x0C) |
			(sbox_pmt_3[state(39,32)] & 0x03);
		cipher(7,0) =
			(sbox_pmt_2[state(31,24)] & 0xC0) |
			(sbox_pmt_1[state(23,16)] & 0x30) |
			(sbox_pmt_0[state(15,8)] & 0x0C) |
			(sbox_pmt_3[state(7,0)] & 0x03);

		round_key(39,32) = round_key(39,32) ^ (round_counter << 2); // do this first, which may be faster

		// use state[] for temporary storage
		state(47,40) = round_key(7,0);
		state(55,48) = round_key(15,8) ;
		state(63,56) = round_key(23,16);

		round_key(7,0) = round_key(31,24) << 5 | round_key(23,16) >> 3;
		round_key(15,8) = round_key(39,32) << 5 | round_key(31,24) >> 3;
		round_key(23,16) = round_key(47,40) << 5 | round_key(39,32) >> 3;
		round_key(31,24) = round_key(55,48) << 5 | round_key(47,40) >> 3;
		round_key(39,32) = round_key(63,56) << 5 | round_key(55,48) >> 3;
		round_key(47,40) = round_key(71,64) << 5 | round_key(63,56) >> 3;
		round_key(55,48) = round_key(79,72) << 5 | round_key(71,64) >> 3;
		round_key(63,56) = state(47,40) << 5 | round_key(79,72) >> 3;
		round_key(71,64) = state(55,48) << 5 | state(47,40) >> 3;
		round_key(79,72) = state(63,56) << 5 | state(55,48) >> 3;

		round_key(79,72) = (round_key(79,72) & 0x0F) | sbox[round_key(79,72) >> 4];
	}

	// if round is not equal to 31, then do not perform the last adding key operation
	// this can be used in constructing PRESENT based algorithm, such as MAC
	if (31 == rounds) {
		cipher(63,56) = cipher(63,56) ^ round_key(79,72);
		cipher(55,48) = cipher(55,48) ^ round_key(71,64);
		cipher(47,40) = cipher(47,40) ^ round_key(63,56);
		cipher(39,32) = cipher(39,32) ^ round_key(55,48);
		cipher(31,24) = cipher(31,24) ^ round_key(47,40);
		cipher(23,16) = cipher(23,16) ^ round_key(39,32);
		cipher(15,8) = cipher(15,8) ^ round_key(31,24);
		cipher(7,0) = cipher(7,0) ^ round_key(23,16);
	}

	return cipher;
}
