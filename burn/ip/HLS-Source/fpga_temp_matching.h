#include <stdlib.h>
#include <stdio.h>
#include "/opt/Xilinx/Vivado/2018.2/include/gmp.h"
#include "ap_int.h"
#include <algorithm>

// size of (tmphei * tmpwid + inhei * inwid) = (100x100 + 200x200)
#define innum  50000
#define size   40000 // inhei * inwid
#define tmpsize 100 // tmphei * tmpwid
#define inhei  200
#define inwid  200
#define tmphei 10
#define tmpwid 10
#define thre   1

/**#define innum  20
#define size   16 // inhei * inwid
#define tmpsize 4 // tmphei * tmpwid
#define inhei  4
#define inwid  4
#define tmphei 2
#define tmpwid 2
#define thre   12*/

unsigned char templ[tmpsize] = {0};

struct axis_t {
    unsigned char data;
    ap_int<1> last;
};

struct window  {
	unsigned char win[tmphei][tmpwid];
};


struct buffer {
	unsigned char buf [tmphei][inwid];
};

void SAD_MATCH(axis_t *INPUT, axis_t *OUTPUT);

void gray(int in[innum], int out[innum]);

void match(int in[innum/*size*/], int out[size]);

void similar (struct window win_buf, int out[size], int pos);

