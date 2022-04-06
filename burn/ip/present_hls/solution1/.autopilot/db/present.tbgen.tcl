set C_TypeInfoList {{ 
"present" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"stateIn": [[], {"reference": "0"}] }, {"stateOut": [[], {"reference": "1"}] }],[],""], 
"0": [ "ap_axiu<144>", {"struct": [[],[{"D":[[], {"scalar": { "int": 144}}]}],[{ "data": [[], "2"]},{ "last": [[], "3"]}],""]}], 
"3": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"2": [ "ap_uint<144>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 144}}]],""]}}], 
"1": [ "ap_axiu<64>", {"struct": [[],[{"D":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "4"]},{ "last": [[], "3"]}],""]}], 
"4": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}]
}}
set moduleName present
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
set C_modelName {present}
set C_modelType { void 0 }
set C_modelArgList {
	{ stateIn_data_V int 144 regular {axi_s 0 volatile  { stateIn Data } }  }
	{ stateIn_last_V int 1 regular {axi_s 0 volatile  { stateIn Last } }  }
	{ stateOut_data_V int 64 regular {axi_s 1 volatile  { stateOut Data } }  }
	{ stateOut_last_V int 1 regular {axi_s 1 volatile  { stateOut Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stateIn_data_V", "interface" : "axis", "bitwidth" : 144, "direction" : "READONLY", "bitSlice":[{"low":0,"up":143,"cElement": [{"cName": "stateIn.data.V","cData": "uint144","bit_use": { "low": 0,"up": 143},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "stateIn_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "stateIn.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "stateOut_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stateOut.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}]} , 
 	{ "Name" : "stateOut_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "stateOut.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stateIn_TDATA sc_in sc_lv 144 signal 0 } 
	{ stateIn_TVALID sc_in sc_logic 1 invld 1 } 
	{ stateIn_TREADY sc_out sc_logic 1 inacc 1 } 
	{ stateIn_TLAST sc_in sc_lv 1 signal 1 } 
	{ stateOut_TDATA sc_out sc_lv 64 signal 2 } 
	{ stateOut_TVALID sc_out sc_logic 1 outvld 3 } 
	{ stateOut_TREADY sc_in sc_logic 1 outacc 3 } 
	{ stateOut_TLAST sc_out sc_lv 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stateIn_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":144, "type": "signal", "bundle":{"name": "stateIn_data_V", "role": "default" }} , 
 	{ "name": "stateIn_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stateIn_last_V", "role": "default" }} , 
 	{ "name": "stateIn_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stateIn_last_V", "role": "default" }} , 
 	{ "name": "stateIn_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stateIn_last_V", "role": "default" }} , 
 	{ "name": "stateOut_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "stateOut_data_V", "role": "default" }} , 
 	{ "name": "stateOut_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stateOut_last_V", "role": "default" }} , 
 	{ "name": "stateOut_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stateOut_last_V", "role": "default" }} , 
 	{ "name": "stateOut_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stateOut_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "present",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65", "EstimateLatencyMax" : "65",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state3", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_present_rounds_fu_80"}],
		"Port" : [
			{"Name" : "stateIn_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stateIn_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateIn_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "stateOut_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stateOut_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateOut_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "sbox_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_present_rounds_fu_80", "Port" : "sbox_V"}]},
			{"Name" : "sbox_pmt_3_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_present_rounds_fu_80", "Port" : "sbox_pmt_3_V"}]},
			{"Name" : "sbox_pmt_2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_present_rounds_fu_80", "Port" : "sbox_pmt_2_V"}]},
			{"Name" : "sbox_pmt_1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_present_rounds_fu_80", "Port" : "sbox_pmt_1_V"}]},
			{"Name" : "sbox_pmt_0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_present_rounds_fu_80", "Port" : "sbox_pmt_0_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80.sbox_V_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80.sbox_pmt_3_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80.sbox_pmt_2_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80.sbox_pmt_1_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_present_rounds_fu_80.sbox_pmt_0_V_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	present {
		stateIn_data_V {Type I LastRead 0 FirstWrite -1}
		stateIn_last_V {Type I LastRead 0 FirstWrite -1}
		stateOut_data_V {Type O LastRead -1 FirstWrite 2}
		stateOut_last_V {Type O LastRead -1 FirstWrite 2}
		sbox_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_3_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_2_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_1_V {Type I LastRead -1 FirstWrite -1}
		sbox_pmt_0_V {Type I LastRead -1 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "65", "Max" : "65"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	stateIn_data_V { axis {  { stateIn_TDATA in_data 0 144 } } }
	stateIn_last_V { axis {  { stateIn_TVALID in_vld 0 1 }  { stateIn_TREADY in_acc 1 1 }  { stateIn_TLAST in_data 0 1 } } }
	stateOut_data_V { axis {  { stateOut_TDATA out_data 1 64 } } }
	stateOut_last_V { axis {  { stateOut_TVALID out_vld 1 1 }  { stateOut_TREADY out_acc 0 1 }  { stateOut_TLAST out_data 1 1 } } }
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
