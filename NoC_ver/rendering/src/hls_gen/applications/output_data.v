// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="output_data_output_data,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.402500,HLS_SYN_LAT=16386,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=248,HLS_SYN_LUT=172,HLS_VERSION=2022_1}" *)

module output_data (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_TVALID,
        Output_1_TREADY,
        Input_1_TDATA,
        Input_1_TREADY,
        Output_1_TDATA,
        Output_1_TVALID
);

parameter    ap_ST_fsm_pp0_stage0 = 8'd1;
parameter    ap_ST_fsm_pp0_stage1 = 8'd2;
parameter    ap_ST_fsm_pp0_stage2 = 8'd4;
parameter    ap_ST_fsm_pp0_stage3 = 8'd8;
parameter    ap_ST_fsm_pp0_stage4 = 8'd16;
parameter    ap_ST_fsm_pp0_stage5 = 8'd32;
parameter    ap_ST_fsm_pp0_stage6 = 8'd64;
parameter    ap_ST_fsm_pp0_stage7 = 8'd128;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Input_1_TVALID;
input   Output_1_TREADY;
input  [31:0] Input_1_TDATA;
output   Input_1_TREADY;
output  [255:0] Output_1_TDATA;
output   Output_1_TVALID;

reg ap_idle;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln12_fu_73_p2;
wire    regslice_both_Output_1_U_apdone_blk;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state9_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage7;
reg   [0:0] icmp_ln12_reg_111;
reg    ap_block_state8_pp0_stage7_iter0;
reg    ap_block_state8_io;
reg    ap_block_pp0_stage7_subdone;
reg    Input_1_TDATA_blk_n;
wire    ap_block_pp0_stage0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_pp0_stage4;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_pp0_stage5;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_pp0_stage6;
wire    ap_block_pp0_stage7;
reg    Output_1_TDATA_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [31:0] tmp_reg_115;
reg   [31:0] tmp_1_reg_120;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_pp0_stage1_11001;
reg   [31:0] tmp_2_reg_125;
reg    ap_block_state3_pp0_stage2_iter0;
reg    ap_block_pp0_stage2_11001;
reg   [31:0] tmp_3_reg_130;
reg    ap_block_state4_pp0_stage3_iter0;
reg    ap_block_pp0_stage3_11001;
reg   [31:0] tmp_4_reg_135;
reg    ap_block_state5_pp0_stage4_iter0;
reg    ap_block_pp0_stage4_11001;
reg   [31:0] tmp_5_reg_140;
reg    ap_block_state6_pp0_stage5_iter0;
reg    ap_block_pp0_stage5_11001;
reg   [31:0] tmp_6_reg_145;
reg    ap_block_state7_pp0_stage6_iter0;
reg    ap_block_pp0_stage6_11001;
reg    ap_block_pp0_stage7_11001;
reg    ap_enable_reg_pp0_iter0_reg;
reg   [11:0] indvar_flatten_fu_48;
wire   [11:0] add_ln12_fu_79_p2;
wire    ap_loop_init;
reg   [11:0] ap_sig_allocacmp_indvar_flatten_load;
reg    ap_block_pp0_stage7_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
reg    ap_block_pp0_stage1_subdone;
reg    ap_block_pp0_stage2_subdone;
reg    ap_block_pp0_stage3_subdone;
reg    ap_block_pp0_stage4_subdone;
reg    ap_block_pp0_stage5_subdone;
reg    ap_block_pp0_stage6_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    regslice_both_Input_1_U_apdone_blk;
wire   [31:0] Input_1_TDATA_int_regslice;
wire    Input_1_TVALID_int_regslice;
reg    Input_1_TREADY_int_regslice;
wire    regslice_both_Input_1_U_ack_in;
wire   [255:0] Output_1_TDATA_int_regslice;
reg    Output_1_TVALID_int_regslice;
wire    Output_1_TREADY_int_regslice;
wire    regslice_both_Output_1_U_vld_out;
reg    ap_condition_192;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

output_data_flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(1'b1)
);

output_data_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_1_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_1_TDATA),
    .vld_in(Input_1_TVALID),
    .ack_in(regslice_both_Input_1_U_ack_in),
    .data_out(Input_1_TDATA_int_regslice),
    .vld_out(Input_1_TVALID_int_regslice),
    .ack_out(Input_1_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_1_U_apdone_blk)
);

output_data_regslice_both #(
    .DataWidth( 256 ))
regslice_both_Output_1_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Output_1_TDATA_int_regslice),
    .vld_in(Output_1_TVALID_int_regslice),
    .ack_in(Output_1_TREADY_int_regslice),
    .data_out(Output_1_TDATA),
    .vld_out(regslice_both_Output_1_U_vld_out),
    .ack_out(Output_1_TREADY),
    .apdone_blk(regslice_both_Output_1_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_exit_pp0_iter0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage7_subdone) & (1'b1 == ap_CS_fsm_pp0_stage7))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_192)) begin
        if ((icmp_ln12_fu_73_p2 == 1'd0)) begin
            indvar_flatten_fu_48 <= add_ln12_fu_79_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_48 <= 12'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln12_reg_111 <= icmp_ln12_fu_73_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        tmp_1_reg_120 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        tmp_2_reg_125 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        tmp_3_reg_130 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        tmp_4_reg_135 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage5_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        tmp_5_reg_140 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage6_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6))) begin
        tmp_6_reg_145 <= Input_1_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_fu_73_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_115 <= Input_1_TDATA_int_regslice;
    end
end

always @ (*) begin
    if ((((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage7) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0) & (icmp_ln12_fu_73_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Input_1_TDATA_blk_n = Input_1_TVALID_int_regslice;
    end else begin
        Input_1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage7_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage6_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage5_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln12_fu_73_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Input_1_TREADY_int_regslice = 1'b1;
    end else begin
        Input_1_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage7) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Output_1_TDATA_blk_n = Output_1_TREADY_int_regslice;
    end else begin
        Output_1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == ap_block_pp0_stage7_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7))) begin
        Output_1_TVALID_int_regslice = 1'b1;
    end else begin
        Output_1_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln12_fu_73_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_exit_pp0_iter0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage7_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage7))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten_load = 12'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_48;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_pp0_stage7 : begin
            if ((1'b0 == ap_block_pp0_stage7_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Input_1_TREADY = regslice_both_Input_1_U_ack_in;

assign Output_1_TDATA_int_regslice = {{{{{{{{Input_1_TDATA_int_regslice}, {tmp_6_reg_145}}, {tmp_5_reg_140}}, {tmp_4_reg_135}}, {tmp_3_reg_130}}, {tmp_2_reg_125}}, {tmp_1_reg_120}}, {tmp_reg_115}};

assign Output_1_TVALID = regslice_both_Output_1_U_vld_out;

assign add_ln12_fu_79_p2 = (ap_sig_allocacmp_indvar_flatten_load + 12'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage7 = ap_CS_fsm[32'd7];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == Output_1_TREADY_int_regslice)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & ((regslice_both_Output_1_U_apdone_blk == 1'b1) | ((icmp_ln12_fu_73_p2 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == Output_1_TREADY_int_regslice)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & ((regslice_both_Output_1_U_apdone_blk == 1'b1) | ((icmp_ln12_fu_73_p2 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)))));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage4_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage4_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage5 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage5_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage5_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage6_11001 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage6_subdone = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)));
end

assign ap_block_pp0_stage7 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage7_01001 = (((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Output_1_TREADY_int_regslice)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)))));
end

always @ (*) begin
    ap_block_pp0_stage7_11001 = (((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state8_io) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Output_1_TREADY_int_regslice)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)))));
end

always @ (*) begin
    ap_block_pp0_stage7_subdone = (((1'b1 == ap_condition_exit_pp0_iter0_stage0) & (regslice_both_Output_1_U_apdone_blk == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state8_io) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Output_1_TREADY_int_regslice)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((regslice_both_Output_1_U_apdone_blk == 1'b1) | ((icmp_ln12_fu_73_p2 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state3_pp0_stage2_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state4_pp0_stage3_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state5_pp0_stage4_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state6_pp0_stage5_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state7_pp0_stage6_iter0 = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice));
end

always @ (*) begin
    ap_block_state8_io = ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Output_1_TREADY_int_regslice));
end

always @ (*) begin
    ap_block_state8_pp0_stage7_iter0 = (((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Output_1_TREADY_int_regslice)) | ((icmp_ln12_reg_111 == 1'd0) & (1'b0 == Input_1_TVALID_int_regslice)));
end

always @ (*) begin
    ap_block_state9_pp0_stage0_iter1 = (1'b0 == Output_1_TREADY_int_regslice);
end

always @ (*) begin
    ap_condition_192 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign icmp_ln12_fu_73_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 12'd2048) ? 1'b1 : 1'b0);

endmodule //output_data