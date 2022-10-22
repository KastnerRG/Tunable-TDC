REPO_ROOT_PATH := $(shell git rev-parse --show-toplevel)
REPO_IP_PATH := $(REPO_ROOT_PATH)/burn/ip
$(info $(REPO_ROOT_PATH))
BASEJUMP_STL_PATH = $(REPO_IP_PATH)/basejump_stl
VIVADO_UNISIM_PATH = .
VIVADO_SRC_PATH = .
VIVADO_XPM_PATH = .

VSOURCES := testbench.v
VSOURCES += carry.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_reset_gen.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_clock_gen.v
VSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_dpi_clock_gen.v
VSOURCES += verilator_xilinx/CARRY4.v
VSOURCES += verilator_xilinx/CARRY8.v
VSOURCES += $(VIVADO_UNISIM_PATH)/glbl.v
VSOURCES += $(VIVADO_SRC_PATH)/glbl.v
VSOURCES += $(VIVADO_XPM_PATH)/xpm_cdc.sv

INCLUDES += -I$(BASEJUMP_STL_PATH)/bsg_misc
INCLUDES += -I$(BASEJUMP_STL_PATH)/bsg_test

CSOURCES += $(BASEJUMP_STL_PATH)/bsg_test/bsg_nonsynth_dpi_clock_gen.cpp


VDEFINES += -DSIM_FAMILY=\"7-Series\"
VDEFINES += -DXIL_XECLIB
VDEFINES += -DOBSOLETE
VDEFINES += -DONESPIN


VFLAGS += -Wno-fatal
simv: $(VSOURCES) $(CSOURCES)
	verilator -cc $(VFLAGS) $(VDEFINES) $(VSOURCES) $(CSOURCES) $(INCLUDES) --top testbench

