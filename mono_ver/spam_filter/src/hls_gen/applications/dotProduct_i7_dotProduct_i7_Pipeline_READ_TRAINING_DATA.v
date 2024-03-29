// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dotProduct_i7_dotProduct_i7_Pipeline_READ_TRAINING_DATA (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_TVALID,
        Input_1_TDATA,
        Input_1_TREADY,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_d0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_we0,
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Input_1_TVALID;
input  [63:0] Input_1_TDATA;
output   Input_1_TREADY;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_d0;
output  [4:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0;
output   dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_we0;
output  [15:0] dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_d0;

reg ap_idle;
reg Input_1_TREADY;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_we0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0;
reg dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln39_fu_192_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    Input_1_TDATA_blk_n;
wire   [63:0] zext_ln340_fu_224_p1;
wire   [0:0] empty_19_fu_204_p1;
reg   [6:0] i_1_fu_70;
wire   [6:0] add_ln39_fu_198_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_i;
wire   [15:0] trunc_ln674_fu_208_p1;
wire   [4:0] lshr_ln_fu_214_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_195;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

dotProduct_i7_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_195)) begin
        if ((icmp_ln39_fu_192_p2 == 1'd0)) begin
            i_1_fu_70 <= add_ln39_fu_198_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_1_fu_70 <= 7'd0;
        end
    end
end

always @ (*) begin
    if (((icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        Input_1_TDATA_blk_n = Input_1_TVALID;
    end else begin
        Input_1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        Input_1_TREADY = 1'b1;
    end else begin
        Input_1_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i = 7'd0;
    end else begin
        ap_sig_allocacmp_i = i_1_fu_70;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd0))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd0))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd0))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_ce0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (icmp_ln39_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (empty_19_fu_204_p1 == 1'd0))) begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_we0 = 1'b1;
    end else begin
        dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln39_fu_198_p2 = (ap_sig_allocacmp_i + 7'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0)));
end

always @ (*) begin
    ap_condition_195 = (~((ap_start_int == 1'b0) | ((1'b0 == Input_1_TVALID) & (icmp_ln39_fu_192_p2 == 1'd0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_1_d0 = {{Input_1_TDATA[31:16]}};

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_2_d0 = {{Input_1_TDATA[63:48]}};

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_3_d0 = {{Input_1_TDATA[47:32]}};

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_4_d0 = {{Input_1_TDATA[31:16]}};

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_5_d0 = trunc_ln674_fu_208_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_6_d0 = {{Input_1_TDATA[63:48]}};

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_7_d0 = trunc_ln674_fu_208_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_address0 = zext_ln340_fu_224_p1;

assign dotProduct_i7_stream_stream_stream_stream_ap_uint_64_0_feature_d0 = {{Input_1_TDATA[47:32]}};

assign empty_19_fu_204_p1 = ap_sig_allocacmp_i[0:0];

assign icmp_ln39_fu_192_p2 = ((ap_sig_allocacmp_i == 7'd64) ? 1'b1 : 1'b0);

assign lshr_ln_fu_214_p4 = {{ap_sig_allocacmp_i[5:1]}};

assign trunc_ln674_fu_208_p1 = Input_1_TDATA[15:0];

assign zext_ln340_fu_224_p1 = lshr_ln_fu_214_p4;

endmodule //dotProduct_i7_dotProduct_i7_Pipeline_READ_TRAINING_DATA
