// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module data_in_redir_data_in_redir_Pipeline_READ_TRAINING_DATA_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Output_3_TREADY,
        Input_1_TDATA,
        Input_1_TVALID,
        Input_1_TREADY,
        Output_3_TDATA,
        Output_3_TVALID,
        p_phi8_out,
        p_phi8_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 4'd1;
parameter    ap_ST_fsm_pp0_stage1 = 4'd2;
parameter    ap_ST_fsm_pp0_stage2 = 4'd4;
parameter    ap_ST_fsm_pp0_stage3 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Output_3_TREADY;
input  [255:0] Input_1_TDATA;
input   Input_1_TVALID;
output   Input_1_TREADY;
output  [63:0] Output_3_TDATA;
output   Output_3_TVALID;
output  [63:0] p_phi8_out;
output   p_phi8_out_ap_vld;

reg ap_idle;
reg Input_1_TREADY;
reg[63:0] Output_3_TDATA;
reg Output_3_TVALID;
reg p_phi8_out_ap_vld;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state5_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln77_fu_92_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage3;
reg   [0:0] icmp_ln77_reg_166;
reg    ap_block_state4_pp0_stage3_iter0;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage3_subdone;
reg    Input_1_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg    Output_3_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage3;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [63:0] p_Result_4_reg_170;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage1_11001;
reg   [63:0] p_Result_5_reg_175;
reg   [63:0] p_Result_6_reg_180;
reg    ap_enable_reg_pp0_iter0_reg;
reg   [63:0] out_tmp_V_fu_56;
reg   [4:0] i_fu_60;
wire   [4:0] i_4_fu_98_p2;
wire    ap_loop_init;
reg   [4:0] ap_sig_allocacmp_i_3;
wire   [63:0] p_Result_s_fu_109_p1;
reg    ap_block_pp0_stage1_01001;
reg    ap_block_state3_pp0_stage2_iter0;
reg    ap_block_pp0_stage2_01001;
reg    ap_block_pp0_stage3_01001;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage2_11001;
reg    ap_block_pp0_stage3_11001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
reg    ap_block_pp0_stage1_subdone;
reg    ap_block_pp0_stage2_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

data_in_redir_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln77_fu_92_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_60 <= i_4_fu_98_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_60 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln77_reg_166 <= icmp_ln77_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        out_tmp_V_fu_56 <= {{Input_1_TDATA[255:192]}};
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        p_Result_4_reg_170 <= {{Input_1_TDATA[127:64]}};
        p_Result_5_reg_175 <= {{Input_1_TDATA[191:128]}};
        p_Result_6_reg_180 <= {{Input_1_TDATA[255:192]}};
    end
end

always @ (*) begin
    if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        Input_1_TDATA_blk_n = Input_1_TVALID;
    end else begin
        Input_1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        Input_1_TREADY = 1'b1;
    end else begin
        Input_1_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Output_3_TDATA = p_Result_6_reg_180;
    end else if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage3_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        Output_3_TDATA = p_Result_5_reg_175;
    end else if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage2_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        Output_3_TDATA = p_Result_4_reg_170;
    end else if (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        Output_3_TDATA = p_Result_s_fu_109_p1;
    end else begin
        Output_3_TDATA = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Output_3_TDATA_blk_n = Output_3_TREADY;
    end else begin
        Output_3_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Output_3_TVALID = 1'b1;
    end else begin
        Output_3_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln77_fu_92_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_3 = 5'd0;
    end else begin
        ap_sig_allocacmp_i_3 = i_fu_60;
    end
end

always @ (*) begin
    if (((icmp_ln77_fu_92_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_phi8_out_ap_vld = 1'b1;
    end else begin
        p_phi8_out_ap_vld = 1'b0;
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
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((1'b0 == Output_3_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((1'b0 == Output_3_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((1'b0 == Output_3_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Input_1_TVALID))));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Input_1_TVALID))));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Input_1_TVALID))));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_01001 = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY))));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_01001 = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage3_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state4_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state4_io) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_io = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = (((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY)) | ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Input_1_TVALID)));
end

always @ (*) begin
    ap_block_state3_io = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY));
end

always @ (*) begin
    ap_block_state3_pp0_stage2_iter0 = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY));
end

always @ (*) begin
    ap_block_state4_io = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY));
end

always @ (*) begin
    ap_block_state4_pp0_stage3_iter0 = ((icmp_ln77_reg_166 == 1'd0) & (1'b0 == Output_3_TREADY));
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter1 = (1'b0 == Output_3_TREADY);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign i_4_fu_98_p2 = (ap_sig_allocacmp_i_3 + 5'd1);

assign icmp_ln77_fu_92_p2 = ((ap_sig_allocacmp_i_3 == 5'd16) ? 1'b1 : 1'b0);

assign p_Result_s_fu_109_p1 = Input_1_TDATA[63:0];

assign p_phi8_out = out_tmp_V_fu_56;

endmodule //data_in_redir_data_in_redir_Pipeline_READ_TRAINING_DATA_3
