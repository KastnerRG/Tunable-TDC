#include <Vtop.h>

#include <bsg_nonsynth_dpi_gpio.hpp>
#include <bsg_nonsynth_dpi_clock_gen.hpp>
#include <bsg_nonsynth_dpi_fifo.hpp>

using namespace bsg_nonsynth_dpi;

#include <cstdint>
#include <cstdio>
#include <queue>


// Verilator / DPI Headers
#include <svdpi.h>
#include <verilated.h>


int main(int argc, char** argv) {
        Verilated::commandArgs(argc, argv);

        // Instantiation of the top-level testbench module
        Vtop *top = new Vtop;

        top->eval();

        dpi_gpio<33> *pulse_len = new dpi_gpio<33>("TOP.top.pulse_len");
        dpi_gpio<3> *pulse_sel = new dpi_gpio<3>("TOP.top.pulse_sel");
        dpi_from_fifo<__uint128_t> *f2d = new dpi_from_fifo<__uint128_t>("TOP.top.f2d_i");

        // Advance 100 times to clear reset. Alternatively, the
        // testbench can provide a DPI call to read the top-level
        // reset value, or the FIFO interfaces can be used, etc, etc,
        // etc.
        for(int i = 0; i < 100; ++i){
                bsg_timekeeper::next();
                top->eval();
        }

        // You must call delete to call the internal DPI function
        // fini() for each interface
	delete pulse_sel;
	delete pulse_len;
	delete f2d;

        // Then, trigger the final blocks in Verilog
        top->final();
        return 0;

}
