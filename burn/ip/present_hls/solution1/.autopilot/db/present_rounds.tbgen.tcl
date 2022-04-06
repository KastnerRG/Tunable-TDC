set moduleName present_rounds
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
set C_modelName {present_rounds}
set C_modelType { int 64 }
set C_modelArgList {
	{ plain_V int 64 regular  }
	{ key_V int 80 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "plain_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "key_V", "interface" : "wire", "bitwidth" : 80, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 64} ]}
# RTL Port declarations: 
set portNum 9
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ plain_V sc_in sc_lv 64 signal 0 } 
	{ key_V sc_in sc_lv 80 signal 1 } 
	{ ap_return sc_out sc_lv 64 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "plain_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "plain_V", "role": "default" }} , 
 	{ "name": "key_V", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "key_V", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "present_rounds",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "62", "EstimateLatencyMax" : "62",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "plain_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "sbox_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sbox_pmt_3_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sbox_pmt_2_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sbox_pmt_1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sbox_pmt_0_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sbox_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sbox_pmt_3_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sbox_pmt_2_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sbox_pmt_1_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sbox_pmt_0_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	present_rounds {
		plain_V {Type I LastRead 0 FirstWrite -1}
		key_V {Type I LastRead 0 FirstWrite -1}
		sbox_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_3_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_2_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_1_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_0_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "62", "Max" : "62"}
	, {"Name" : "Interval", "Min" : "62", "Max" : "62"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	plain_V { ap_none {  { plain_V in_data 0 64 } } }
	key_V { ap_none {  { key_V in_data 0 80 } } }
}
