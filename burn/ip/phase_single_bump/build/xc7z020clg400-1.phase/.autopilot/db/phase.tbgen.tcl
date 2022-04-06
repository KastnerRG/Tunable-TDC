set C_TypeInfoList {{ 
"phase" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"rincdec": [[],"0"] }, {"psincdec": [[], {"reference": "1"}] }, {"psen": [[], {"reference": "1"}] }, {"ps_done": [[],"2"] }],[],""], 
"2": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"1": [ "ap_uint<1>", {"struct": [[],[{"_AP_W":[[], {"scalar": { "int": 1}}]}],[],""]}], 
"0": [ "ap_uint<32>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 32}}]],""]}}]
}}
set moduleName phase
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {phase}
set C_modelType { void 0 }
set C_modelArgList {
	{ rincdec_V int 32 regular {axi_slave 0}  }
	{ psincdec_V int 1 regular {pointer 1 volatile }  }
	{ psen_V int 1 regular {pointer 1 volatile }  }
	{ ps_done_V int 1 unused  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rincdec_V", "interface" : "axi_slave", "bundle":"CNTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "rincdec.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "psincdec_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "psincdec.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "psen_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "psen.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ps_done_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "ps_done.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ psincdec_V sc_out sc_lv 1 signal 1 } 
	{ psen_V sc_out sc_lv 1 signal 2 } 
	{ ps_done_V sc_in sc_lv 1 signal 3 } 
	{ s_axi_CNTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_CNTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CNTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CNTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_CNTRL_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CNTRL_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CNTRL_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CNTRL_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CNTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "CNTRL", "role": "AWADDR" },"address":[{"name":"phase","role":"start","value":"0","valid_bit":"0"},{"name":"phase","role":"continue","value":"0","valid_bit":"4"},{"name":"phase","role":"auto_start","value":"0","valid_bit":"7"},{"name":"rincdec_V","role":"data","value":"16"}] },
	{ "name": "s_axi_CNTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CNTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CNTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "WVALID" } },
	{ "name": "s_axi_CNTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "WREADY" } },
	{ "name": "s_axi_CNTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CNTRL", "role": "WDATA" } },
	{ "name": "s_axi_CNTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CNTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CNTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "CNTRL", "role": "ARADDR" },"address":[{"name":"phase","role":"start","value":"0","valid_bit":"0"},{"name":"phase","role":"done","value":"0","valid_bit":"1"},{"name":"phase","role":"idle","value":"0","valid_bit":"2"},{"name":"phase","role":"ready","value":"0","valid_bit":"3"},{"name":"phase","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CNTRL_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "ARVALID" } },
	{ "name": "s_axi_CNTRL_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "ARREADY" } },
	{ "name": "s_axi_CNTRL_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "RVALID" } },
	{ "name": "s_axi_CNTRL_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "RREADY" } },
	{ "name": "s_axi_CNTRL_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CNTRL", "role": "RDATA" } },
	{ "name": "s_axi_CNTRL_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CNTRL", "role": "RRESP" } },
	{ "name": "s_axi_CNTRL_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "BVALID" } },
	{ "name": "s_axi_CNTRL_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "BREADY" } },
	{ "name": "s_axi_CNTRL_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CNTRL", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CNTRL", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "psincdec_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "psincdec_V", "role": "default" }} , 
 	{ "name": "psen_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "psen_V", "role": "default" }} , 
 	{ "name": "ps_done_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ps_done_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "phase",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "rincdec_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "psincdec_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "psen_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "ps_done_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.phase_CNTRL_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	phase {
		rincdec_V {Type I LastRead 0 FirstWrite -1}
		psincdec_V {Type O LastRead -1 FirstWrite 2}
		psen_V {Type O LastRead -1 FirstWrite 1}
		ps_done_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	psincdec_V { ap_none {  { psincdec_V out_data 1 1 } } }
	psen_V { ap_none {  { psen_V out_data 1 1 } } }
	ps_done_V { ap_none {  { ps_done_V in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
