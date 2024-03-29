set moduleName data_gen_config_Pipeline_data_gen_label0
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {data_gen_config_Pipeline_data_gen_label0}
set C_modelType { void 0 }
set C_modelArgList {
	{ Output_2 int 512 regular {axi_s 1 volatile  { Output_2 Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Output_2", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 9
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Output_2_TREADY sc_in sc_logic 1 outacc 0 } 
	{ Output_2_TDATA sc_out sc_lv 512 signal 0 } 
	{ Output_2_TVALID sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Output_2_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "Output_2", "role": "TREADY" }} , 
 	{ "name": "Output_2_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "Output_2", "role": "TDATA" }} , 
 	{ "name": "Output_2_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Output_2", "role": "TVALID" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "data_gen_config_Pipeline_data_gen_label0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "800", "EstimateLatencyMax" : "800",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "Output_2", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "Output_2_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "triangle_3ds_x0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_y0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_z0_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_x1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_y1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_z1_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_x2_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_y2_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "triangle_3ds_z2_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "data_gen_label0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_x0_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_y0_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_z0_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_x1_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_y1_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_z1_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_x2_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_y2_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.triangle_3ds_z2_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	data_gen_config_Pipeline_data_gen_label0 {
		Output_2 {Type O LastRead -1 FirstWrite 1}
		triangle_3ds_x0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_x1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_x2_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y2_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z2_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "800", "Max" : "800"}
	, {"Name" : "Interval", "Min" : "800", "Max" : "800"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	Output_2 { axis {  { Output_2_TREADY out_acc 0 1 }  { Output_2_TDATA out_data 1 512 }  { Output_2_TVALID out_vld 1 1 } } }
}
