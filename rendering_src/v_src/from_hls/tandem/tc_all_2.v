// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="tc_all_2_tc_all_2,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.459000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=455,HLS_SYN_LUT=799,HLS_VERSION=2021_1}" *)

module tc_all_2 (
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
        Output_1_V_TREADY
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

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

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] counter_1_1;
reg   [31:0] counter_2_1;
reg   [31:0] counter_1_2;
reg   [31:0] counter_2_2;
reg   [31:0] counter_1_3;
reg   [31:0] counter_2_3;
reg   [31:0] counter_1_4;
reg   [31:0] counter_2_4;
reg   [0:0] winner_sent;
reg    Output_1_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] or_ln71_fu_433_p2;
wire   [0:0] icmp_ln71_fu_421_p2;
wire    ap_CS_fsm_state3;
reg   [0:0] or_ln71_reg_487;
reg   [0:0] winner_sent_load_reg_491;
reg   [0:0] icmp_ln71_reg_483;
wire   [31:0] add_ln68_1_fu_387_p2;
reg   [31:0] add_ln68_1_reg_473;
wire   [31:0] add_ln69_1_fu_393_p2;
reg   [31:0] add_ln69_1_reg_478;
reg   [31:0] counter_1_1_loc_1_reg_87;
wire   [0:0] p_vld_fu_179_p1;
wire   [31:0] add_ln36_fu_218_p2;
wire   [0:0] icmp_ln1049_fu_199_p2;
reg   [31:0] counter_2_1_loc_1_reg_99;
wire   [31:0] add_ln39_fu_205_p2;
reg   [31:0] counter_1_2_loc_1_reg_111;
wire   [0:0] p_vld1_fu_231_p1;
wire   [31:0] add_ln44_fu_270_p2;
wire   [0:0] icmp_ln1049_1_fu_251_p2;
reg   [31:0] counter_2_2_loc_1_reg_123;
wire   [31:0] add_ln47_fu_257_p2;
reg   [31:0] ap_phi_mux_counter_1_3_loc_1_phi_fu_138_p6;
wire   [0:0] p_vld3_fu_283_p1;
wire   [31:0] add_ln52_fu_322_p2;
wire   [0:0] icmp_ln1049_2_fu_303_p2;
reg   [31:0] ap_phi_mux_counter_2_3_loc_1_phi_fu_149_p6;
wire   [31:0] add_ln55_fu_309_p2;
reg   [31:0] ap_phi_mux_counter_1_4_loc_1_phi_fu_160_p6;
wire   [0:0] p_vld5_fu_335_p1;
wire   [31:0] add_ln60_fu_374_p2;
wire   [0:0] icmp_ln1049_3_fu_355_p2;
reg   [31:0] ap_phi_mux_counter_2_4_loc_1_phi_fu_171_p6;
wire   [31:0] add_ln63_fu_361_p2;
reg    ap_predicate_op94_write_state3;
reg    ap_predicate_op96_write_state3;
wire    regslice_both_Output_1_V_U_apdone_blk;
reg    ap_block_state3;
reg    ap_block_state3_io;
wire   [0:0] Input_1_V_read_nbread_fu_54_p2_0;
wire   [0:0] Input_2_V_read_nbread_fu_60_p2_0;
wire   [0:0] Input_3_V_read_nbread_fu_66_p2_0;
wire   [0:0] Input_4_V_read_nbread_fu_72_p2_0;
reg    ap_predicate_op92_write_state2;
reg    ap_predicate_op93_write_state2;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire   [31:0] add_ln68_fu_399_p2;
wire   [31:0] add_ln69_fu_410_p2;
wire   [31:0] counter_1_sum_fu_405_p2;
wire   [31:0] counter_2_sum_fu_416_p2;
wire   [0:0] icmp_ln71_1_fu_427_p2;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
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
reg   [31:0] Output_1_V_TDATA_int_regslice;
reg    Output_1_V_TVALID_int_regslice;
wire    Output_1_V_TREADY_int_regslice;
wire    regslice_both_Output_1_V_U_vld_out;
reg    ap_condition_452;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 counter_1_1 = 32'd0;
#0 counter_2_1 = 32'd0;
#0 counter_1_2 = 32'd0;
#0 counter_2_2 = 32'd0;
#0 counter_1_3 = 32'd0;
#0 counter_2_3 = 32'd0;
#0 counter_1_4 = 32'd0;
#0 counter_2_4 = 32'd0;
#0 winner_sent = 1'd0;
end

tc_all_2_regslice_both #(
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

tc_all_2_regslice_both #(
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

tc_all_2_regslice_both #(
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

tc_all_2_regslice_both #(
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

tc_all_2_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Output_1_V_TDATA_int_regslice),
    .vld_in(Output_1_V_TVALID_int_regslice),
    .ack_in(Output_1_V_TREADY_int_regslice),
    .data_out(Output_1_V_TDATA),
    .vld_out(regslice_both_Output_1_V_U_vld_out),
    .ack_out(Output_1_V_TREADY),
    .apdone_blk(regslice_both_Output_1_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd1))) begin
        counter_1_1_loc_1_reg_87 <= add_ln36_fu_218_p2;
    end else if ((((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd0)) | ((p_vld_fu_179_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        counter_1_1_loc_1_reg_87 <= counter_1_1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd1) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_1_2_loc_1_reg_111 <= add_ln44_fu_270_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd0) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld1_fu_231_p1 == 1'd0) & (ap_start == 1'b1)))) begin
        counter_1_2_loc_1_reg_111 <= counter_1_2;
    end
end

always @ (posedge ap_clk) begin
    if (((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd0))) begin
        counter_2_1_loc_1_reg_99 <= add_ln39_fu_205_p2;
    end else if ((((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd1)) | ((p_vld_fu_179_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        counter_2_1_loc_1_reg_99 <= counter_2_1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd0) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_2_2_loc_1_reg_123 <= add_ln47_fu_257_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd1) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld1_fu_231_p1 == 1'd0) & (ap_start == 1'b1)))) begin
        counter_2_2_loc_1_reg_123 <= counter_2_2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln68_1_reg_473 <= add_ln68_1_fu_387_p2;
        add_ln69_1_reg_478 <= add_ln69_1_fu_393_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd1))) begin
        counter_1_1 <= add_ln36_fu_218_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd1) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_1_2 <= add_ln44_fu_270_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd1) & (p_vld3_fu_283_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_1_3 <= add_ln52_fu_322_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd1) & (p_vld5_fu_335_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_1_4 <= add_ln60_fu_374_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((p_vld_fu_179_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & (icmp_ln1049_fu_199_p2 == 1'd0))) begin
        counter_2_1 <= add_ln39_fu_205_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_1_fu_251_p2 == 1'd0) & (p_vld1_fu_231_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_2_2 <= add_ln47_fu_257_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd0) & (p_vld3_fu_283_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_2_3 <= add_ln55_fu_309_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd0) & (p_vld5_fu_335_p1 == 1'd1) & (ap_start == 1'b1))) begin
        counter_2_4 <= add_ln63_fu_361_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        icmp_ln71_reg_483 <= icmp_ln71_fu_421_p2;
        or_ln71_reg_487 <= or_ln71_fu_433_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1))) & (winner_sent_load_reg_491 == 1'd0) & (or_ln71_reg_487 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        winner_sent <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((or_ln71_fu_433_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        winner_sent_load_reg_491 <= winner_sent;
    end
end

always @ (*) begin
    if (((1'b1 == Input_1_V_TVALID_int_regslice) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        Input_1_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_1_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == Input_2_V_TVALID_int_regslice) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        Input_2_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_2_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == Input_3_V_TVALID_int_regslice) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        Input_3_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_3_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == Input_4_V_TVALID_int_regslice) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        Input_4_V_TREADY_int_regslice = 1'b1;
    end else begin
        Input_4_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln71_reg_483 == 1'd0) & (winner_sent_load_reg_491 == 1'd0) & (or_ln71_reg_487 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((icmp_ln71_fu_421_p2 == 1'd0) & (winner_sent == 1'd0) & (or_ln71_fu_433_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((icmp_ln71_reg_483 == 1'd1) & (winner_sent_load_reg_491 == 1'd0) & (or_ln71_reg_487 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((icmp_ln71_fu_421_p2 == 1'd1) & (winner_sent == 1'd0) & (or_ln71_fu_433_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        Output_1_V_TDATA_blk_n = Output_1_V_TREADY_int_regslice;
    end else begin
        Output_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_452)) begin
        if ((ap_predicate_op93_write_state2 == 1'b1)) begin
            Output_1_V_TDATA_int_regslice = 32'd1;
        end else if ((ap_predicate_op92_write_state2 == 1'b1)) begin
            Output_1_V_TDATA_int_regslice = 32'd2;
        end else begin
            Output_1_V_TDATA_int_regslice = 'bx;
        end
    end else begin
        Output_1_V_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if (((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1))) & (ap_predicate_op93_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1))) & (ap_predicate_op92_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        Output_1_V_TVALID_int_regslice = 1'b1;
    end else begin
        Output_1_V_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1)))) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1))) & (1'b1 == ap_CS_fsm_state3))) begin
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
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd1) & (p_vld3_fu_283_p1 == 1'd1))) begin
        ap_phi_mux_counter_1_3_loc_1_phi_fu_138_p6 = add_ln52_fu_322_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd0) & (p_vld3_fu_283_p1 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld3_fu_283_p1 == 1'd0)))) begin
        ap_phi_mux_counter_1_3_loc_1_phi_fu_138_p6 = counter_1_3;
    end else begin
        ap_phi_mux_counter_1_3_loc_1_phi_fu_138_p6 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd1) & (p_vld5_fu_335_p1 == 1'd1))) begin
        ap_phi_mux_counter_1_4_loc_1_phi_fu_160_p6 = add_ln60_fu_374_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd0) & (p_vld5_fu_335_p1 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld5_fu_335_p1 == 1'd0)))) begin
        ap_phi_mux_counter_1_4_loc_1_phi_fu_160_p6 = counter_1_4;
    end else begin
        ap_phi_mux_counter_1_4_loc_1_phi_fu_160_p6 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd0) & (p_vld3_fu_283_p1 == 1'd1))) begin
        ap_phi_mux_counter_2_3_loc_1_phi_fu_149_p6 = add_ln55_fu_309_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_2_fu_303_p2 == 1'd1) & (p_vld3_fu_283_p1 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld3_fu_283_p1 == 1'd0)))) begin
        ap_phi_mux_counter_2_3_loc_1_phi_fu_149_p6 = counter_2_3;
    end else begin
        ap_phi_mux_counter_2_3_loc_1_phi_fu_149_p6 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd0) & (p_vld5_fu_335_p1 == 1'd1))) begin
        ap_phi_mux_counter_2_4_loc_1_phi_fu_171_p6 = add_ln63_fu_361_p2;
    end else if ((((1'b1 == ap_CS_fsm_state1) & (icmp_ln1049_3_fu_355_p2 == 1'd1) & (p_vld5_fu_335_p1 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (p_vld5_fu_335_p1 == 1'd0)))) begin
        ap_phi_mux_counter_2_4_loc_1_phi_fu_171_p6 = counter_2_4;
    end else begin
        ap_phi_mux_counter_2_4_loc_1_phi_fu_171_p6 = 'bx;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1))) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1))) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Input_1_V_TREADY = regslice_both_Input_1_V_U_ack_in;

assign Input_1_V_read_nbread_fu_54_p2_0 = Input_1_V_TVALID_int_regslice;

assign Input_2_V_TREADY = regslice_both_Input_2_V_U_ack_in;

assign Input_2_V_read_nbread_fu_60_p2_0 = Input_2_V_TVALID_int_regslice;

assign Input_3_V_TREADY = regslice_both_Input_3_V_U_ack_in;

assign Input_3_V_read_nbread_fu_66_p2_0 = Input_3_V_TVALID_int_regslice;

assign Input_4_V_TREADY = regslice_both_Input_4_V_U_ack_in;

assign Input_4_V_read_nbread_fu_72_p2_0 = Input_4_V_TVALID_int_regslice;

assign Output_1_V_TVALID = regslice_both_Output_1_V_U_vld_out;

assign add_ln36_fu_218_p2 = (counter_1_1 + 32'd1);

assign add_ln39_fu_205_p2 = (counter_2_1 + 32'd1);

assign add_ln44_fu_270_p2 = (counter_1_2 + 32'd1);

assign add_ln47_fu_257_p2 = (counter_2_2 + 32'd1);

assign add_ln52_fu_322_p2 = (counter_1_3 + 32'd1);

assign add_ln55_fu_309_p2 = (counter_2_3 + 32'd1);

assign add_ln60_fu_374_p2 = (counter_1_4 + 32'd1);

assign add_ln63_fu_361_p2 = (counter_2_4 + 32'd1);

assign add_ln68_1_fu_387_p2 = (ap_phi_mux_counter_1_3_loc_1_phi_fu_138_p6 + ap_phi_mux_counter_1_4_loc_1_phi_fu_160_p6);

assign add_ln68_fu_399_p2 = (counter_1_2_loc_1_reg_111 + counter_1_1_loc_1_reg_87);

assign add_ln69_1_fu_393_p2 = (ap_phi_mux_counter_2_3_loc_1_phi_fu_149_p6 + ap_phi_mux_counter_2_4_loc_1_phi_fu_171_p6);

assign add_ln69_fu_410_p2 = (counter_2_2_loc_1_reg_123 + counter_2_1_loc_1_reg_99);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2 = (((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_io = (((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state3 = ((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_block_state3_io = (((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op96_write_state3 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op94_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_condition_452 = (~(((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op93_write_state2 == 1'b1)) | ((1'b0 == Output_1_V_TREADY_int_regslice) & (ap_predicate_op92_write_state2 == 1'b1))) & (1'b1 == ap_CS_fsm_state2));
end

always @ (*) begin
    ap_predicate_op92_write_state2 = ((icmp_ln71_fu_421_p2 == 1'd0) & (winner_sent == 1'd0) & (or_ln71_fu_433_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op93_write_state2 = ((icmp_ln71_fu_421_p2 == 1'd1) & (winner_sent == 1'd0) & (or_ln71_fu_433_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op94_write_state3 = ((icmp_ln71_reg_483 == 1'd0) & (winner_sent_load_reg_491 == 1'd0) & (or_ln71_reg_487 == 1'd1));
end

always @ (*) begin
    ap_predicate_op96_write_state3 = ((icmp_ln71_reg_483 == 1'd1) & (winner_sent_load_reg_491 == 1'd0) & (or_ln71_reg_487 == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign counter_1_sum_fu_405_p2 = (add_ln68_1_reg_473 + add_ln68_fu_399_p2);

assign counter_2_sum_fu_416_p2 = (add_ln69_1_reg_478 + add_ln69_fu_410_p2);

assign icmp_ln1049_1_fu_251_p2 = ((Input_2_V_TDATA_int_regslice == 32'd1) ? 1'b1 : 1'b0);

assign icmp_ln1049_2_fu_303_p2 = ((Input_3_V_TDATA_int_regslice == 32'd1) ? 1'b1 : 1'b0);

assign icmp_ln1049_3_fu_355_p2 = ((Input_4_V_TDATA_int_regslice == 32'd1) ? 1'b1 : 1'b0);

assign icmp_ln1049_fu_199_p2 = ((Input_1_V_TDATA_int_regslice == 32'd1) ? 1'b1 : 1'b0);

assign icmp_ln71_1_fu_427_p2 = ((counter_2_sum_fu_416_p2 == 32'd2) ? 1'b1 : 1'b0);

assign icmp_ln71_fu_421_p2 = ((counter_1_sum_fu_405_p2 == 32'd2) ? 1'b1 : 1'b0);

assign or_ln71_fu_433_p2 = (icmp_ln71_fu_421_p2 | icmp_ln71_1_fu_427_p2);

assign p_vld1_fu_231_p1 = Input_2_V_read_nbread_fu_60_p2_0;

assign p_vld3_fu_283_p1 = Input_3_V_read_nbread_fu_66_p2_0;

assign p_vld5_fu_335_p1 = Input_4_V_read_nbread_fu_72_p2_0;

assign p_vld_fu_179_p1 = Input_1_V_read_nbread_fu_54_p2_0;

endmodule //tc_all_2
