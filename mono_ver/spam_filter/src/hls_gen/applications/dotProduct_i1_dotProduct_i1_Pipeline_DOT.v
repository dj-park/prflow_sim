// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dotProduct_i1_dotProduct_i1_Pipeline_DOT (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        result_V_out,
        result_V_out_ap_vld,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_q0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_address0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_ce0,
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] result_V_out;
output   result_V_out_ap_vld;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0;
input  [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_q0;
output  [4:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_address0;
output   dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_ce0;
input  [31:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_q0;

reg ap_idle;
reg result_V_out_ap_vld;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0;
reg dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln50_fu_306_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln50_reg_650;
reg   [0:0] icmp_ln50_reg_650_pp0_iter1_reg;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_load_reg_734;
reg  signed [31:0] r_V_reg_739;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_load_reg_744;
reg  signed [31:0] r_V_17_reg_749;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_load_reg_754;
reg  signed [31:0] r_V_19_reg_759;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_load_reg_764;
reg  signed [31:0] r_V_21_reg_769;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_load_reg_774;
reg  signed [31:0] r_V_23_reg_779;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_load_reg_784;
reg  signed [31:0] r_V_25_reg_789;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_load_reg_794;
reg  signed [31:0] r_V_27_reg_799;
reg   [15:0] dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_load_reg_804;
reg  signed [31:0] r_V_29_reg_809;
reg   [31:0] term_reg_814;
reg   [31:0] term_1_reg_819;
reg   [31:0] term_2_reg_824;
reg   [31:0] term_3_reg_829;
reg   [31:0] term_4_reg_834;
reg   [31:0] term_5_reg_839;
reg   [31:0] term_6_reg_844;
reg   [31:0] term_7_reg_849;
wire   [63:0] zext_ln50_fu_318_p1;
wire    ap_block_pp0_stage0;
reg   [31:0] result_V_fu_70;
wire   [31:0] result_V_1_fu_620_p2;
wire    ap_loop_init;
reg   [5:0] i_3_fu_74;
wire   [5:0] add_ln50_fu_312_p2;
reg   [5:0] ap_sig_allocacmp_i;
wire    ap_block_pp0_stage0_01001;
wire  signed [22:0] shl_ln884_9_fu_343_p3;
wire   [50:0] r_V_16_fu_357_p2;
wire  signed [22:0] shl_ln884_s_fu_373_p3;
wire   [50:0] r_V_18_fu_387_p2;
wire  signed [22:0] shl_ln884_1_fu_403_p3;
wire   [50:0] r_V_20_fu_417_p2;
wire  signed [22:0] shl_ln884_2_fu_433_p3;
wire   [50:0] r_V_22_fu_447_p2;
wire  signed [22:0] shl_ln884_3_fu_463_p3;
wire   [50:0] r_V_24_fu_477_p2;
wire  signed [22:0] shl_ln884_4_fu_493_p3;
wire   [50:0] r_V_26_fu_507_p2;
wire  signed [22:0] shl_ln884_5_fu_523_p3;
wire   [50:0] r_V_28_fu_537_p2;
wire  signed [22:0] shl_ln884_6_fu_553_p3;
wire   [50:0] r_V_30_fu_567_p2;
wire   [31:0] add_ln859_9_fu_594_p2;
wire   [31:0] add_ln859_8_fu_590_p2;
wire   [31:0] add_ln859_fu_586_p2;
wire   [31:0] add_ln859_10_fu_603_p2;
wire   [31:0] add_ln859_12_fu_609_p2;
wire   [31:0] add_ln859_11_fu_598_p2;
wire   [31:0] add_ln859_13_fu_614_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U10(
    .din0(r_V_reg_739),
    .din1(shl_ln884_9_fu_343_p3),
    .dout(r_V_16_fu_357_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U11(
    .din0(r_V_17_reg_749),
    .din1(shl_ln884_s_fu_373_p3),
    .dout(r_V_18_fu_387_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U12(
    .din0(r_V_19_reg_759),
    .din1(shl_ln884_1_fu_403_p3),
    .dout(r_V_20_fu_417_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U13(
    .din0(r_V_21_reg_769),
    .din1(shl_ln884_2_fu_433_p3),
    .dout(r_V_22_fu_447_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U14(
    .din0(r_V_23_reg_779),
    .din1(shl_ln884_3_fu_463_p3),
    .dout(r_V_24_fu_477_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U15(
    .din0(r_V_25_reg_789),
    .din1(shl_ln884_4_fu_493_p3),
    .dout(r_V_26_fu_507_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U16(
    .din0(r_V_27_reg_799),
    .din1(shl_ln884_5_fu_523_p3),
    .dout(r_V_28_fu_537_p2)
);

dotProduct_i1_mul_32s_23s_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 51 ))
mul_32s_23s_51_1_1_U17(
    .din0(r_V_29_reg_809),
    .din1(shl_ln884_6_fu_553_p3),
    .dout(r_V_30_fu_567_p2)
);

dotProduct_i1_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln50_fu_306_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_3_fu_74 <= add_ln50_fu_312_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_3_fu_74 <= 6'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            result_V_fu_70 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            result_V_fu_70 <= result_V_1_fu_620_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_load_reg_744 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_load_reg_804 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_load_reg_794 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_load_reg_784 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_load_reg_774 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_load_reg_764 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_load_reg_734 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_q0;
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_load_reg_754 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_q0;
        icmp_ln50_reg_650 <= icmp_ln50_fu_306_p2;
        icmp_ln50_reg_650_pp0_iter1_reg <= icmp_ln50_reg_650;
        r_V_17_reg_749 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_q0;
        r_V_19_reg_759 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_q0;
        r_V_21_reg_769 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_q0;
        r_V_23_reg_779 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_q0;
        r_V_25_reg_789 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_q0;
        r_V_27_reg_799 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_q0;
        r_V_29_reg_809 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_q0;
        r_V_reg_739 <= dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        term_1_reg_819 <= {{r_V_18_fu_387_p2[50:19]}};
        term_2_reg_824 <= {{r_V_20_fu_417_p2[50:19]}};
        term_3_reg_829 <= {{r_V_22_fu_447_p2[50:19]}};
        term_4_reg_834 <= {{r_V_24_fu_477_p2[50:19]}};
        term_5_reg_839 <= {{r_V_26_fu_507_p2[50:19]}};
        term_6_reg_844 <= {{r_V_28_fu_537_p2[50:19]}};
        term_7_reg_849 <= {{r_V_30_fu_567_p2[50:19]}};
        term_reg_814 <= {{r_V_16_fu_357_p2[50:19]}};
    end
end

always @ (*) begin
    if (((icmp_ln50_fu_306_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i = 6'd0;
    end else begin
        ap_sig_allocacmp_i = i_3_fu_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_ce0 = 1'b1;
    end else begin
        dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln50_reg_650_pp0_iter1_reg == 1'd1))) begin
        result_V_out_ap_vld = 1'b1;
    end else begin
        result_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln50_fu_312_p2 = (ap_sig_allocacmp_i + 6'd1);

assign add_ln859_10_fu_603_p2 = (add_ln859_8_fu_590_p2 + add_ln859_fu_586_p2);

assign add_ln859_11_fu_598_p2 = (add_ln859_9_fu_594_p2 + term_6_reg_844);

assign add_ln859_12_fu_609_p2 = (add_ln859_10_fu_603_p2 + term_7_reg_849);

assign add_ln859_13_fu_614_p2 = (add_ln859_12_fu_609_p2 + add_ln859_11_fu_598_p2);

assign add_ln859_8_fu_590_p2 = (term_3_reg_829 + term_2_reg_824);

assign add_ln859_9_fu_594_p2 = (term_5_reg_839 + term_4_reg_834);

assign add_ln859_fu_586_p2 = (term_1_reg_819 + term_reg_814);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_1_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_2_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_3_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_4_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_5_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_6_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_7_address0 = zext_ln50_fu_318_p1;

assign dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_param_address0 = zext_ln50_fu_318_p1;

assign icmp_ln50_fu_306_p2 = ((ap_sig_allocacmp_i == 6'd32) ? 1'b1 : 1'b0);

assign result_V_1_fu_620_p2 = (add_ln859_13_fu_614_p2 + result_V_fu_70);

assign result_V_out = result_V_fu_70;

assign shl_ln884_1_fu_403_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_load_reg_754}, {7'd0}};

assign shl_ln884_2_fu_433_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_6_load_reg_764}, {7'd0}};

assign shl_ln884_3_fu_463_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_5_load_reg_774}, {7'd0}};

assign shl_ln884_4_fu_493_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_4_load_reg_784}, {7'd0}};

assign shl_ln884_5_fu_523_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_3_load_reg_794}, {7'd0}};

assign shl_ln884_6_fu_553_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_2_load_reg_804}, {7'd0}};

assign shl_ln884_9_fu_343_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_7_load_reg_734}, {7'd0}};

assign shl_ln884_s_fu_373_p3 = {{dotProduct_i1_stream_stream_stream_stream_ap_uint_64_0_feature_1_load_reg_744}, {7'd0}};

assign zext_ln50_fu_318_p1 = ap_sig_allocacmp_i;

endmodule //dotProduct_i1_dotProduct_i1_Pipeline_DOT
