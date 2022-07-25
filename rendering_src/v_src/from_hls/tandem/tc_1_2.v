// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="tc_1_2_tc_1_2,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.434000,HLS_SYN_LAT=4,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=333,HLS_SYN_LUT=531,HLS_VERSION=2021_1}" *)

module tc_1_2 (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_V_TDATA,
        Input_1_V_TVALID,
        Input_1_V_TREADY,
        Input_2_V_TDATA,
        Input_2_V_TVALID,
        Input_2_V_TREADY,
        Input_3_V_TDATA,
        Input_3_V_TVALID,
        Input_3_V_TREADY,
        Input_4_V_TDATA,
        Input_4_V_TVALID,
        Input_4_V_TREADY,
        Output_1_V_TDATA,
        Output_1_V_TVALID,
        Output_1_V_TREADY,
        Output_2_V_TDATA,
        Output_2_V_TVALID,
        Output_2_V_TREADY,
        Output_3_V_TDATA,
        Output_3_V_TVALID,
        Output_3_V_TREADY
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] Input_1_V_TDATA;
input   Input_1_V_TVALID;
output   Input_1_V_TREADY;
input  [31:0] Input_2_V_TDATA;
input   Input_2_V_TVALID;
output   Input_2_V_TREADY;
input  [31:0] Input_3_V_TDATA;
input   Input_3_V_TVALID;
output   Input_3_V_TREADY;
input  [31:0] Input_4_V_TDATA;
input   Input_4_V_TVALID;
output   Input_4_V_TREADY;
output  [31:0] Output_1_V_TDATA;
output   Output_1_V_TVALID;
input   Output_1_V_TREADY;
output  [31:0] Output_2_V_TDATA;
output   Output_2_V_TVALID;
input   Output_2_V_TREADY;
output  [31:0] Output_3_V_TDATA;
output   Output_3_V_TVALID;
input   Output_3_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] counter_1_1;
reg   [31:0] counter_1_2;
reg   [31:0] counter_2_1;
reg   [31:0] counter_2_2;
reg   [0:0] eval_1_done;
reg   [0:0] eval_2_done;
reg    Output_1_V_TDATA_blk_n;
wire   [0:0] p_vld_fu_161_p1;
wire    ap_CS_fsm_state2;
reg   [0:0] p_vld_reg_333;
reg    Output_2_V_TDATA_blk_n;
wire   [0:0] p_vld2_fu_192_p1;
wire    ap_CS_fsm_state3;
reg   [0:0] p_vld2_reg_356;
reg    Output_3_V_TDATA_blk_n;
wire    ap_CS_fsm_state4;
reg   [0:0] icmp_ln64_reg_395;
wire    ap_CS_fsm_state5;
reg   [0:0] eval_1_done_load_reg_399;
wire   [0:0] icmp_ln68_fu_311_p2;
reg   [0:0] icmp_ln68_reg_403;
reg   [0:0] eval_2_done_load_reg_407;
wire   [31:0] add_ln39_fu_180_p2;
wire   [0:0] icmp_ln38_fu_174_p2;
wire   [31:0] add_ln45_fu_211_p2;
wire   [0:0] icmp_ln44_fu_205_p2;
wire   [31:0] add_ln57_fu_277_p2;
wire   [0:0] and_ln56_fu_271_p2;
wire   [0:0] icmp_ln64_fu_295_p2;
reg   [31:0] counter_1_1_loc_0_reg_103;
reg    ap_block_state1;
reg    ap_block_state1_io;
reg   [31:0] counter_1_1_loc_1_reg_112;
reg    ap_block_state2;
reg    ap_block_state2_io;
reg   [31:0] counter_1_2_loc_0_reg_123;
reg   [31:0] ap_phi_mux_counter_1_2_loc_1_phi_fu_135_p4;
reg   [31:0] counter_1_2_loc_1_reg_132;
reg    ap_block_state3;
reg    ap_block_state3_io;
reg   [31:0] counter_2_1_loc_1_reg_142;
wire   [0:0] and_ln51_fu_238_p2;
wire   [31:0] add_ln52_fu_244_p2;
reg   [31:0] counter_2_2_loc_1_reg_152;
reg    ap_predicate_op83_write_state5;
reg    ap_predicate_op86_write_state5;
wire    regslice_both_Output_1_V_U_apdone_blk;
wire    regslice_both_Output_2_V_U_apdone_blk;
wire    regslice_both_Output_3_V_U_apdone_blk;
reg    ap_block_state5;
reg    ap_block_state5_io;
wire   [0:0] Input_1_V_read_nbread_fu_56_p2_0;
wire   [0:0] Input_3_V_read_nbread_fu_69_p2_0;
wire   [0:0] Input_2_V_read_nbread_fu_82_p2_0;
wire   [0:0] Input_4_V_read_nbread_fu_88_p2_0;
reg    ap_predicate_op77_write_state4;
reg    ap_predicate_op82_write_state4;
reg    ap_block_state4;
reg    ap_block_state4_io;
wire   [0:0] icmp_ln51_fu_232_p2;
wire   [0:0] icmp_ln56_fu_265_p2;
wire   [31:0] counter_1_sum_fu_289_p2;
wire   [31:0] counter_2_sum_fu_301_p2;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    regslice_both_Input_1_V_U_apdone_blk;
wire   [31:0] Input_1_V_TDATA_int_regslice;
wire    Input_1_V_TVALID_int_regslice;
reg    Input_1_V_TREADY_int_regslice;
wire    regslice_both_Input_1_V_U_ack_in;
wire    regslice_both_Input_2_V_U_apdone_blk;
wire   [31:0] Input_2_V_TDATA_int_regslice;
wire    Input_2_V_TVALID_int_regslice;
reg    Input_2_V_TREADY_int_regslice;
wire    regslice_both_Input_2_V_U_ack_in;
wire    regslice_both_Input_3_V_U_apdone_blk;
wire   [31:0] Input_3_V_TDATA_int_regslice;
wire    Input_3_V_TVALID_int_regslice;
reg    Input_3_V_TREADY_int_regslice;
wire    regslice_both_Input_3_V_U_ack_in;
wire    regslice_both_Input_4_V_U_apdone_blk;
wire   [31:0] Input_4_V_TDATA_int_regslice;
wire    Input_4_V_TVALID_int_regslice;
reg    Input_4_V_TREADY_int_regslice;
wire    regslice_both_Input_4_V_U_ack_in;
reg    Output_1_V_TVALID_int_regslice;
wire    Output_1_V_TREADY_int_regslice;
wire    regslice_both_Output_1_V_U_vld_out;
reg    Output_2_V_TVALID_int_regslice;
wire    Output_2_V_TREADY_int_regslice;
wire    regslice_both_Output_2_V_U_vld_out;
reg   [31:0] Output_3_V_TDATA_int_regslice;
reg    Output_3_V_TVALID_int_regslice;
wire    Output_3_V_TREADY_int_regslice;
wire    regslice_both_Output_3_V_U_vld_out;
reg    ap_condition_530;
reg    ap_condition_455;
reg    ap_condition_487;
reg    ap_condition_477;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 counter_1_1 = 32'd0;
#0 counter_1_2 = 32'd0;
#0 counter_2_1 = 32'd0;
#0 counter_2_2 = 32'd0;
#0 eval_1_done = 1'd0;
#0 eval_2_done = 1'd0;
end

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_1_V_TDATA),
    .vld_in(Input_1_V_TVALID),
    .ack_in(regslice_both_Input_1_V_U_ack_in),
    .data_out(Input_1_V_TDATA_int_regslice),
    .vld_out(Input_1_V_TVALID_int_regslice),
    .ack_out(Input_1_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_1_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_2_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_2_V_TDATA),
    .vld_in(Input_2_V_TVALID),
    .ack_in(regslice_both_Input_2_V_U_ack_in),
    .data_out(Input_2_V_TDATA_int_regslice),
    .vld_out(Input_2_V_TVALID_int_regslice),
    .ack_out(Input_2_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_2_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_3_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_3_V_TDATA),
    .vld_in(Input_3_V_TVALID),
    .ack_in(regslice_both_Input_3_V_U_ack_in),
    .data_out(Input_3_V_TDATA_int_regslice),
    .vld_out(Input_3_V_TVALID_int_regslice),
    .ack_out(Input_3_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_3_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_4_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_4_V_TDATA),
    .vld_in(Input_4_V_TVALID),
    .ack_in(regslice_both_Input_4_V_U_ack_in),
    .data_out(Input_4_V_TDATA_int_regslice),
    .vld_out(Input_4_V_TVALID_int_regslice),
    .ack_out(Input_4_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_4_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_1_V_TDATA_int_regslice),
    .vld_in(Output_1_V_TVALID_int_regslice),
    .ack_in(Output_1_V_TREADY_int_regslice),
    .data_out(Output_1_V_TDATA),
    .vld_out(regslice_both_Output_1_V_U_vld_out),
    .ack_out(Output_1_V_TREADY),
    .apdone_blk(regslice_both_Output_1_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_2_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_3_V_TDATA_int_regslice),
    .vld_in(Output_2_V_TVALID_int_regslice),
    .ack_in(Output_2_V_TREADY_int_regslice),
    .data_out(Output_2_V_TDATA),
    .vld_out(regslice_both_Output_2_V_U_vld_out),
    .ack_out(Output_2_V_TREADY),
    .apdone_blk(regslice_both_Output_2_V_U_apdone_blk)
);

tc_1_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_3_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Output_3_V_TDATA_int_regslice),
    .vld_in(Output_3_V_TVALID_int_regslice),
    .ack_in(Output_3_V_TREADY_int_regslice),
    .data_out(Output_3_V_TDATA),
    .vld_out(regslice_both_Output_3_V_U_vld_out),
    .ack_out(Output_3_V_TREADY),
    .apdone_blk(regslice_both_Output_3_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_455)) begin
        if ((icmp_ln38_fu_174_p2 == 1'd0)) begin
            counter_1_1_loc_0_reg_103 <= counter_1_1;
        end else if ((icmp_ln38_fu_174_p2 == 1'd1)) begin
            counter_1_1_loc_0_reg_103 <= add_ln39_fu_180_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (p_vld_fu_161_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        counter_1_1_loc_1_reg_112 <= counter_1_1;
    end else if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (p_vld_reg_333 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        counter_1_1_loc_1_reg_112 <= counter_1_1_loc_0_reg_103;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_487)) begin
        if ((icmp_ln44_fu_205_p2 == 1'd0)) begin
            counter_1_2_loc_0_reg_123 <= counter_1_2;
        end else if ((icmp_ln44_fu_205_p2 == 1'd1)) begin
            counter_1_2_loc_0_reg_123 <= add_ln45_fu_211_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (p_vld2_fu_192_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        counter_1_2_loc_1_reg_132 <= counter_1_2;
    end else if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (p_vld2_reg_356 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        counter_1_2_loc_1_reg_132 <= counter_1_2_loc_0_reg_123;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_477)) begin
        if ((1'd1 == and_ln51_fu_238_p2)) begin
            counter_2_1_loc_1_reg_142 <= add_ln52_fu_244_p2;
        end else if ((1'd0 == and_ln51_fu_238_p2)) begin
            counter_2_1_loc_1_reg_142 <= counter_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_477)) begin
        if ((1'd1 == and_ln56_fu_271_p2)) begin
            counter_2_2_loc_1_reg_152 <= add_ln57_fu_277_p2;
        end else if ((1'd0 == and_ln56_fu_271_p2)) begin
            counter_2_2_loc_1_reg_152 <= counter_2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln38_fu_174_p2 == 1'd1))) begin
        counter_1_1 <= add_ln39_fu_180_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln44_fu_205_p2 == 1'd1))) begin
        counter_1_2 <= add_ln45_fu_211_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'd1 == and_ln51_fu_238_p2) & (1'b1 == ap_CS_fsm_state3))) begin
        counter_2_1 <= add_ln52_fu_244_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'd1 == and_ln56_fu_271_p2) & (1'b1 == ap_CS_fsm_state3))) begin
        counter_2_2 <= add_ln57_fu_277_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1))) & (icmp_ln64_reg_395 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (eval_1_done_load_reg_399 == 1'd0))) begin
        eval_1_done <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln64_reg_395 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        eval_1_done_load_reg_399 <= eval_1_done;
    end
end

always @ (posedge ap_clk) begin
    if ((~((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1))) & (1'b1 == ap_CS_fsm_state5) & (((eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1) & (eval_1_done_load_reg_399 == 1'd1)) | ((icmp_ln64_reg_395 == 1'd0) & (eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1))))) begin
        eval_2_done <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (((icmp_ln64_reg_395 == 1'd0) & (icmp_ln68_fu_311_p2 == 1'd1)) | ((eval_1_done == 1'd1) & (icmp_ln68_fu_311_p2 == 1'd1))))) begin
        eval_2_done_load_reg_407 <= eval_2_done;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln64_reg_395 <= icmp_ln64_fu_295_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & ((eval_1_done == 1'd1) | (icmp_ln64_reg_395 == 1'd0)))) begin
        icmp_ln68_reg_403 <= icmp_ln68_fu_311_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_vld2_reg_356 <= Input_3_V_read_nbread_fu_69_p2_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        p_vld_reg_333 <= Input_1_V_read_nbread_fu_56_p2_0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'b1 == Input_1_V_TVALID_int_regslice) & (1'b1 == ap_CS_fsm_state1))) begin
        Input_1_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_1_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == Input_2_V_TVALID_int_regslice))) begin
        Input_2_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_2_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == Input_3_V_TVALID_int_regslice))) begin
        Input_3_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_3_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == Input_4_V_TVALID_int_regslice))) begin
        Input_4_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_4_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((p_vld_reg_333 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        Output_1_V_TDATA_blk_n = Output_1_V_TREADY_int_regslice;
    end else begin
        Output_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b1 == ap_CS_fsm_state1))) begin
        Output_1_V_TVALID_int_regslice = 1'b1;
    end else begin
        Output_1_V_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((p_vld2_reg_356 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b1 == ap_CS_fsm_state2)))) begin
        Output_2_V_TDATA_blk_n = Output_2_V_TREADY_int_regslice;
    end else begin
        Output_2_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b1 == ap_CS_fsm_state2))) begin
        Output_2_V_TVALID_int_regslice = 1'b1;
    end else begin
        Output_2_V_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((eval_1_done == 1'd0) & (icmp_ln64_reg_395 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) | ((icmp_ln64_reg_395 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (eval_1_done_load_reg_399 == 1'd0)) | ((1'b1 == ap_CS_fsm_state4) & (((icmp_ln64_reg_395 == 1'd0) & (eval_2_done == 1'd0) & (icmp_ln68_fu_311_p2 == 1'd1)) | ((eval_1_done == 1'd1) & (eval_2_done == 1'd0) & (icmp_ln68_fu_311_p2 == 1'd1)))) | ((1'b1 == ap_CS_fsm_state5) & (((eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1) & (eval_1_done_load_reg_399 == 1'd1)) | ((icmp_ln64_reg_395 == 1'd0) & (eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1)))))) begin
        Output_3_V_TDATA_blk_n = Output_3_V_TREADY_int_regslice;
    end else begin
        Output_3_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_530)) begin
        if ((ap_predicate_op82_write_state4 == 1'b1)) begin
            Output_3_V_TDATA_int_regslice = 32'd2;
        end else if ((ap_predicate_op77_write_state4 == 1'b1)) begin
            Output_3_V_TDATA_int_regslice = 32'd1;
        end else begin
            Output_3_V_TDATA_int_regslice = 'bx;
        end
    end else begin
        Output_3_V_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if (((~((1'b1 == ap_block_state4_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1))) & (ap_predicate_op82_write_state4 == 1'b1) & (1'b1 == ap_CS_fsm_state4)) | (~((1'b1 == ap_block_state4_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1))) & (ap_predicate_op77_write_state4 == 1'b1) & (1'b1 == ap_CS_fsm_state4)))) begin
        Output_3_V_TVALID_int_regslice = 1'b1;
    end else begin
        Output_3_V_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice)))) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state4_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1)))) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1)))) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1))) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((p_vld2_reg_356 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_counter_1_2_loc_1_phi_fu_135_p4 = counter_1_2_loc_0_reg_123;
    end else begin
        ap_phi_mux_counter_1_2_loc_1_phi_fu_135_p4 = counter_1_2_loc_1_reg_132;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1))) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((1'b1 == ap_block_state4_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1))) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state5_io) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1))) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Input_1_V_TREADY = regslice_both_Input_1_V_U_ack_in;

assign Input_1_V_read_nbread_fu_56_p2_0 = Input_1_V_TVALID_int_regslice;

assign Input_2_V_TREADY = regslice_both_Input_2_V_U_ack_in;

assign Input_2_V_read_nbread_fu_82_p2_0 = Input_2_V_TVALID_int_regslice;

assign Input_3_V_TREADY = regslice_both_Input_3_V_U_ack_in;

assign Input_3_V_read_nbread_fu_69_p2_0 = Input_3_V_TVALID_int_regslice;

assign Input_4_V_TREADY = regslice_both_Input_4_V_U_ack_in;

assign Input_4_V_read_nbread_fu_88_p2_0 = Input_4_V_TVALID_int_regslice;

assign Output_1_V_TVALID = regslice_both_Output_1_V_U_vld_out;

assign Output_2_V_TVALID = regslice_both_Output_2_V_U_vld_out;

assign Output_3_V_TVALID = regslice_both_Output_3_V_U_vld_out;

assign add_ln39_fu_180_p2 = (counter_1_1 + 32'd1);

assign add_ln45_fu_211_p2 = (counter_1_2 + 32'd1);

assign add_ln52_fu_244_p2 = (counter_2_1 + 32'd1);

assign add_ln57_fu_277_p2 = (counter_2_2 + 32'd1);

assign and_ln51_fu_238_p2 = (icmp_ln51_fu_232_p2 & Input_2_V_read_nbread_fu_82_p2_0);

assign and_ln56_fu_271_p2 = (icmp_ln56_fu_265_p2 & Input_4_V_read_nbread_fu_88_p2_0);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice)));
end

always @ (*) begin
    ap_block_state1_io = ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice));
end

always @ (*) begin
    ap_block_state2 = (((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice)));
end

always @ (*) begin
    ap_block_state2_io = (((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice)));
end

always @ (*) begin
    ap_block_state3 = ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice));
end

always @ (*) begin
    ap_block_state3_io = ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice));
end

always @ (*) begin
    ap_block_state4 = (((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1)));
end

always @ (*) begin
    ap_block_state4_io = (((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1)));
end

always @ (*) begin
    ap_block_state5 = ((regslice_both_Output_3_V_U_apdone_blk == 1'b1) | (regslice_both_Output_2_V_U_apdone_blk == 1'b1) | (regslice_both_Output_1_V_U_apdone_blk == 1'b1) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1)));
end

always @ (*) begin
    ap_block_state5_io = (((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op86_write_state5 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op83_write_state5 == 1'b1)));
end

always @ (*) begin
    ap_condition_455 = (~((1'b1 == ap_block_state1_io) | (ap_start == 1'b0) | ((1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_1_V_read_nbread_fu_56_p2_0) & (1'b1 == ap_CS_fsm_state1));
end

always @ (*) begin
    ap_condition_477 = (~((1'b1 == ap_block_state3_io) | ((p_vld2_reg_356 == 1'd1) & (1'b0 == Output_2_V_TREADY_int_regslice))) & (1'b1 == ap_CS_fsm_state3));
end

always @ (*) begin
    ap_condition_487 = (~((1'b1 == ap_block_state2_io) | ((1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b0 == Output_2_V_TREADY_int_regslice)) | ((p_vld_reg_333 == 1'd1) & (1'b0 == Output_1_V_TREADY_int_regslice))) & (1'd1 == Input_3_V_read_nbread_fu_69_p2_0) & (1'b1 == ap_CS_fsm_state2));
end

always @ (*) begin
    ap_condition_530 = (~(((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op82_write_state4 == 1'b1)) | ((1'b0 == Output_3_V_TREADY_int_regslice) & (ap_predicate_op77_write_state4 == 1'b1))) & (1'b1 == ap_CS_fsm_state4));
end

always @ (*) begin
    ap_predicate_op77_write_state4 = ((eval_1_done == 1'd0) & (icmp_ln64_reg_395 == 1'd1));
end

always @ (*) begin
    ap_predicate_op82_write_state4 = (((icmp_ln64_reg_395 == 1'd0) & (eval_2_done == 1'd0) & (icmp_ln68_fu_311_p2 == 1'd1)) | ((eval_1_done == 1'd1) & (eval_2_done == 1'd0) & (icmp_ln68_fu_311_p2 == 1'd1)));
end

always @ (*) begin
    ap_predicate_op83_write_state5 = ((icmp_ln64_reg_395 == 1'd1) & (eval_1_done_load_reg_399 == 1'd0));
end

always @ (*) begin
    ap_predicate_op86_write_state5 = (((eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1) & (eval_1_done_load_reg_399 == 1'd1)) | ((icmp_ln64_reg_395 == 1'd0) & (eval_2_done_load_reg_407 == 1'd0) & (icmp_ln68_reg_403 == 1'd1)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign counter_1_sum_fu_289_p2 = (ap_phi_mux_counter_1_2_loc_1_phi_fu_135_p4 + counter_1_1_loc_1_reg_112);

assign counter_2_sum_fu_301_p2 = (counter_2_2_loc_1_reg_152 + counter_2_1_loc_1_reg_142);

assign icmp_ln38_fu_174_p2 = (($signed(counter_1_1) < $signed(32'd100)) ? 1'b1 : 1'b0);

assign icmp_ln44_fu_205_p2 = (($signed(counter_1_2) < $signed(32'd100)) ? 1'b1 : 1'b0);

assign icmp_ln51_fu_232_p2 = (($signed(counter_2_1) < $signed(32'd100)) ? 1'b1 : 1'b0);

assign icmp_ln56_fu_265_p2 = (($signed(counter_2_2) < $signed(32'd100)) ? 1'b1 : 1'b0);

assign icmp_ln64_fu_295_p2 = ((counter_1_sum_fu_289_p2 == 32'd200) ? 1'b1 : 1'b0);

assign icmp_ln68_fu_311_p2 = ((counter_2_sum_fu_301_p2 == 32'd200) ? 1'b1 : 1'b0);

assign p_vld2_fu_192_p1 = Input_3_V_read_nbread_fu_69_p2_0;

assign p_vld_fu_161_p1 = Input_1_V_read_nbread_fu_56_p2_0;

endmodule //tc_1_2
