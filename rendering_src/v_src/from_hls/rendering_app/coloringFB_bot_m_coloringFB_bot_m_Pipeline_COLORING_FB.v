// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module coloringFB_bot_m_coloringFB_bot_m_Pipeline_COLORING_FB (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_V_TVALID,
        tmp_V_cast,
        Input_1_V_TDATA,
        Input_1_V_TREADY,
        frame_buffer_V_0_address0,
        frame_buffer_V_0_ce0,
        frame_buffer_V_0_we0,
        frame_buffer_V_0_d0,
        frame_buffer_V_1_address0,
        frame_buffer_V_1_ce0,
        frame_buffer_V_1_we0,
        frame_buffer_V_1_d0,
        frame_buffer_V_2_address0,
        frame_buffer_V_2_ce0,
        frame_buffer_V_2_we0,
        frame_buffer_V_2_d0,
        frame_buffer_V_3_address0,
        frame_buffer_V_3_ce0,
        frame_buffer_V_3_we0,
        frame_buffer_V_3_d0,
        frame_buffer_V_4_address0,
        frame_buffer_V_4_ce0,
        frame_buffer_V_4_we0,
        frame_buffer_V_4_d0,
        frame_buffer_V_5_address0,
        frame_buffer_V_5_ce0,
        frame_buffer_V_5_we0,
        frame_buffer_V_5_d0,
        frame_buffer_V_6_address0,
        frame_buffer_V_6_ce0,
        frame_buffer_V_6_we0,
        frame_buffer_V_6_d0,
        frame_buffer_V_7_address0,
        frame_buffer_V_7_ce0,
        frame_buffer_V_7_we0,
        frame_buffer_V_7_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Input_1_V_TVALID;
input  [15:0] tmp_V_cast;
input  [31:0] Input_1_V_TDATA;
output   Input_1_V_TREADY;
output  [11:0] frame_buffer_V_0_address0;
output   frame_buffer_V_0_ce0;
output   frame_buffer_V_0_we0;
output  [7:0] frame_buffer_V_0_d0;
output  [11:0] frame_buffer_V_1_address0;
output   frame_buffer_V_1_ce0;
output   frame_buffer_V_1_we0;
output  [7:0] frame_buffer_V_1_d0;
output  [11:0] frame_buffer_V_2_address0;
output   frame_buffer_V_2_ce0;
output   frame_buffer_V_2_we0;
output  [7:0] frame_buffer_V_2_d0;
output  [11:0] frame_buffer_V_3_address0;
output   frame_buffer_V_3_ce0;
output   frame_buffer_V_3_we0;
output  [7:0] frame_buffer_V_3_d0;
output  [11:0] frame_buffer_V_4_address0;
output   frame_buffer_V_4_ce0;
output   frame_buffer_V_4_we0;
output  [7:0] frame_buffer_V_4_d0;
output  [11:0] frame_buffer_V_5_address0;
output   frame_buffer_V_5_ce0;
output   frame_buffer_V_5_we0;
output  [7:0] frame_buffer_V_5_d0;
output  [11:0] frame_buffer_V_6_address0;
output   frame_buffer_V_6_ce0;
output   frame_buffer_V_6_we0;
output  [7:0] frame_buffer_V_6_d0;
output  [11:0] frame_buffer_V_7_address0;
output   frame_buffer_V_7_ce0;
output   frame_buffer_V_7_we0;
output  [7:0] frame_buffer_V_7_d0;

reg ap_idle;
reg Input_1_V_TREADY;
reg frame_buffer_V_0_ce0;
reg frame_buffer_V_0_we0;
reg frame_buffer_V_1_ce0;
reg frame_buffer_V_1_we0;
reg frame_buffer_V_2_ce0;
reg frame_buffer_V_2_we0;
reg frame_buffer_V_3_ce0;
reg frame_buffer_V_3_we0;
reg frame_buffer_V_4_ce0;
reg frame_buffer_V_4_we0;
reg frame_buffer_V_5_ce0;
reg frame_buffer_V_5_we0;
reg frame_buffer_V_6_ce0;
reg frame_buffer_V_6_we0;
reg frame_buffer_V_7_ce0;
reg frame_buffer_V_7_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln36_fu_212_p2;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    Input_1_V_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg   [7:0] pixels_color_V_reg_302;
reg    ap_block_pp0_stage0_11001;
reg   [2:0] trunc_ln_reg_314;
wire   [11:0] add_ln46_fu_270_p2;
reg   [11:0] add_ln46_reg_318;
wire   [63:0] zext_ln46_1_fu_281_p1;
reg   [15:0] i_V_2_fu_84;
wire    ap_loop_init;
reg   [15:0] ap_sig_allocacmp_i_V;
wire   [15:0] i_V_3_fu_218_p2;
wire   [7:0] trunc_ln46_fu_234_p1;
wire   [4:0] lshr_ln_fu_256_p4;
wire   [11:0] tmp_s_fu_238_p3;
wire   [11:0] zext_ln46_fu_266_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

coloringFB_bot_m_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln36_fu_212_p2 == 1'd0) & (ap_start_int == 1'b1))) begin
            i_V_2_fu_84 <= i_V_3_fu_218_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_V_2_fu_84 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln36_fu_212_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln46_reg_318 <= add_ln46_fu_270_p2;
        pixels_color_V_reg_302 <= {{Input_1_V_TDATA[23:16]}};
        trunc_ln_reg_314 <= {{Input_1_V_TDATA[10:8]}};
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln36_fu_212_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Input_1_V_TDATA_blk_n = Input_1_V_TVALID;
    end else begin
        Input_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln36_fu_212_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Input_1_V_TREADY = 1'b1;
    end else begin
        Input_1_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln36_fu_212_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_V = 16'd0;
    end else begin
        ap_sig_allocacmp_i_V = i_V_2_fu_84;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_0_ce0 = 1'b1;
    end else begin
        frame_buffer_V_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd0))) begin
        frame_buffer_V_0_we0 = 1'b1;
    end else begin
        frame_buffer_V_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_1_ce0 = 1'b1;
    end else begin
        frame_buffer_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd1))) begin
        frame_buffer_V_1_we0 = 1'b1;
    end else begin
        frame_buffer_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_2_ce0 = 1'b1;
    end else begin
        frame_buffer_V_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd2))) begin
        frame_buffer_V_2_we0 = 1'b1;
    end else begin
        frame_buffer_V_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_3_ce0 = 1'b1;
    end else begin
        frame_buffer_V_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd3))) begin
        frame_buffer_V_3_we0 = 1'b1;
    end else begin
        frame_buffer_V_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_4_ce0 = 1'b1;
    end else begin
        frame_buffer_V_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd4))) begin
        frame_buffer_V_4_we0 = 1'b1;
    end else begin
        frame_buffer_V_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_5_ce0 = 1'b1;
    end else begin
        frame_buffer_V_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd5))) begin
        frame_buffer_V_5_we0 = 1'b1;
    end else begin
        frame_buffer_V_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_6_ce0 = 1'b1;
    end else begin
        frame_buffer_V_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd6))) begin
        frame_buffer_V_6_we0 = 1'b1;
    end else begin
        frame_buffer_V_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        frame_buffer_V_7_ce0 = 1'b1;
    end else begin
        frame_buffer_V_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (trunc_ln_reg_314 == 3'd7))) begin
        frame_buffer_V_7_we0 = 1'b1;
    end else begin
        frame_buffer_V_7_we0 = 1'b0;
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

assign add_ln46_fu_270_p2 = (tmp_s_fu_238_p3 + zext_ln46_fu_266_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln36_fu_212_p2 == 1'd0) & (1'b0 == Input_1_V_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln36_fu_212_p2 == 1'd0) & (1'b0 == Input_1_V_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((icmp_ln36_fu_212_p2 == 1'd0) & (1'b0 == Input_1_V_TVALID));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign frame_buffer_V_0_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_0_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_1_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_1_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_2_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_2_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_3_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_3_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_4_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_4_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_5_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_5_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_6_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_6_d0 = pixels_color_V_reg_302;

assign frame_buffer_V_7_address0 = zext_ln46_1_fu_281_p1;

assign frame_buffer_V_7_d0 = pixels_color_V_reg_302;

assign i_V_3_fu_218_p2 = (ap_sig_allocacmp_i_V + 16'd1);

assign icmp_ln36_fu_212_p2 = ((ap_sig_allocacmp_i_V == tmp_V_cast) ? 1'b1 : 1'b0);

assign lshr_ln_fu_256_p4 = {{Input_1_V_TDATA[15:11]}};

assign tmp_s_fu_238_p3 = {{trunc_ln46_fu_234_p1}, {4'd0}};

assign trunc_ln46_fu_234_p1 = Input_1_V_TDATA[7:0];

assign zext_ln46_1_fu_281_p1 = add_ln46_reg_318;

assign zext_ln46_fu_266_p1 = lshr_ln_fu_256_p4;

endmodule //coloringFB_bot_m_coloringFB_bot_m_Pipeline_COLORING_FB
