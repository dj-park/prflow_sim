set moduleName data_gen_config
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {data_gen_config}
set C_modelType { void 0 }
set C_modelArgList {
	{ Output_1 int 64 regular {axi_s 1 volatile  { Output_1 Data } }  }
	{ Output_2 int 512 regular {axi_s 1 volatile  { Output_2 Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Output_1", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Output_2", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Output_1_TDATA sc_out sc_lv 64 signal 0 } 
	{ Output_1_TVALID sc_out sc_logic 1 outvld 0 } 
	{ Output_1_TREADY sc_in sc_logic 1 outacc 0 } 
	{ Output_2_TDATA sc_out sc_lv 512 signal 1 } 
	{ Output_2_TVALID sc_out sc_logic 1 outvld 1 } 
	{ Output_2_TREADY sc_in sc_logic 1 outacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Output_1_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_1", "role": "TDATA" }} , 
 	{ "name": "Output_1_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Output_1", "role": "TVALID" }} , 
 	{ "name": "Output_1_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "Output_1", "role": "TREADY" }} , 
 	{ "name": "Output_2_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "Output_2", "role": "TDATA" }} , 
 	{ "name": "Output_2_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Output_2", "role": "TVALID" }} , 
 	{ "name": "Output_2_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "Output_2", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "12", "13"],
		"CDFG" : "data_gen_config",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "807", "EstimateLatencyMax" : "807",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "Output_1", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "Output_1_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_2", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "Output_2", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_x0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_x0_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_y0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_y0_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_z0_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_z0_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_x1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_x1_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_y1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_y1_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_z1_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_z1_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_x2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_x2_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_y2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_y2_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "triangle_3ds_z2_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Port" : "triangle_3ds_z2_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_x0_V_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_y0_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_z0_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_x1_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_y1_V_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_z1_V_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_x2_V_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_y2_V_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.triangle_3ds_z2_V_U", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_data_gen_config_Pipeline_data_gen_label0_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_Output_1_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_Output_2_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	data_gen_config {
		Output_1 {Type O LastRead -1 FirstWrite 0}
		Output_2 {Type O LastRead -1 FirstWrite 1}
		triangle_3ds_x0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z0_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_x1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z1_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_x2_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_y2_V {Type I LastRead -1 FirstWrite -1}
		triangle_3ds_z2_V {Type I LastRead -1 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "807", "Max" : "807"}
	, {"Name" : "Interval", "Min" : "808", "Max" : "808"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	Output_1 { axis {  { Output_1_TDATA out_data 1 64 }  { Output_1_TVALID out_vld 1 1 }  { Output_1_TREADY out_acc 0 1 } } }
	Output_2 { axis {  { Output_2_TDATA out_data 1 512 }  { Output_2_TVALID out_vld 1 1 }  { Output_2_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

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
