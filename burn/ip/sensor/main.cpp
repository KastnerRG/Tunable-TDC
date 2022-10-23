#include <Vtop.h>

#include <bsg_nonsynth_dpi_clock_gen.hpp>
#include <bsg_nonsynth_dpi_fifo.hpp>


#include <bsg_nonsynth_dpi_clock_gen.hpp>
#include <bsg_nonsynth_dpi_fifo.hpp>
using namespace bsg_nonsynth_dpi;

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

        // Then, trigger the final blocks in Verilog
        top->final();
        return 0;

}
