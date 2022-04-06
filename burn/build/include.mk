TARGETS=default place
all: default

ipboardclean:
	$(foreach IP,$(IPS), PART=$(PART) VERSION=$(VERSION) $(MAKE) -C $(IP_PATH)/$(IP) clean;)

ipextraclean:
	$(foreach IP,$(IPS), $(MAKE) -C $(IP_PATH)/$(IP) extraclean;)

boardclean: 
	rm -rf $(DESIGN) *.jou *.log NA .Xil

bitclean:
	rm -rf *.bit *.rpt 

extraclean: boardclean ipextraclean bitclean

clean: boardclean ipboardclean

ip:
	$(foreach IP,$(IPS), PART=$(PART) VERSION=$(VERSION) $(MAKE) -C $(IP_PATH)/$(IP);)

.PHONY: $(DESIGN)

$(TARGETS): $(DESIGN) ip $(BOARD_PATH)/$(BOARD).xdc $(DESIGN).tcl
	vivado -mode batch -source $(BUILD_PATH)/build.tcl -tclargs $(DESIGN) \
		$@ $(PART) $(BOARD) $(MMCM_TYPE) $(MMCM_LOC) $(IP_PATH)

results:
	grep Slack vivado.log > sweep.log
	vivado -mode batch $(DESIGN)/$(DESIGN).xpr -source $(BUILD_PATH)/resources.tcl -tclargs $(DESIGN) 
