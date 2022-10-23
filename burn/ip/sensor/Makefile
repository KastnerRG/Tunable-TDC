REPO_ROOT_PATH := $(shell git rev-parse --show-toplevel)
REPO_IP_PATH := $(REPO_ROOT_PATH)/burn/ip
$(info $(REPO_ROOT_PATH))
BASEJUMP_STL_PATH = $(REPO_IP_PATH)/basejump_stl
VIVADO_UNISIM_PATH = .
VIVADO_SRC_PATH = .
VIVADO_XPM_PATH = .

VERILATOR_PATH = /opt/homebrew/Cellar/verilator/4.228/share/verilator/

VSOURCES := top.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_reset_gen.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_clock_gen.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_dpi_clock_gen.v

VSOURCES += $(VIVADO_UNISIM_PATH)/glbl.v
VSOURCES += $(VIVADO_XPM_PATH)/xpm_cdc.sv
VSOURCES += verilator_xilinx/CARRY4.v
VSOURCES += verilator_xilinx/CARRY8.v
VSOURCES += carry.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_dataflow/bsg_fifo_1r1w_small.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_dataflow/bsg_fifo_tracker.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_mem/bsg_mem_1r1w.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_mem/bsg_mem_1r1w_synth.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_misc/bsg_counter_set_down.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_misc/bsg_counter_clear_up.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_dpi_clock_gen.cpp

VINCLUDES += -I$(BASEJUMP_STL_PATH)/bsg_misc
VINCLUDES += -I$(BASEJUMP_STL_PATH)/bsg_test

VDEFINES += -DSIM_FAMILY=\"7-Series\"
VDEFINES += -DXIL_XECLIB
VDEFINES += -DOBSOLETE
VDEFINES += -DONESPIN


VFLAGS += -Wno-fatal

INCLUDES += -Iobj_dir
INCLUDES += -I$(VERILATOR_PATH)/include
INCLUDES += -I$(VERILATOR_PATH)/include/vltstd
INCLUDES += -I$(BASEJUMP_STL_PATH)/bsg_test/

CXXFLAGS += $(INCLUDES)
CXXFLAGS += -std=c++11

obj_dir: $(VSOURCES) $(CSOURCES)
	verilator -cc $(VFLAGS) $(VDEFINES) $(VSOURCES) $(CSOURCES) $(VINCLUDES) --top top --CFLAGS -DVL_TIME_STAMP64 --CFLAGS -DVL_NO_LEGACY

obj_dir/Vtop__ALL.a: | obj_dir
	$(MAKE) -C $(dir $@) -f Vtop.mk 

main.o: obj_dir

simv: obj_dir/Vtop__ALL.a main.o
	gcc -o $@ $^ -undefined dynamic_lookup
