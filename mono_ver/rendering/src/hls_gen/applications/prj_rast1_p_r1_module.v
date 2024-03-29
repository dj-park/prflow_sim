// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module prj_rast1_p_r1_module (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        Output_1_TDATA,
        Output_1_TVALID,
        Output_1_TREADY,
        data_transfer_out_dout,
        data_transfer_out_num_data_valid,
        data_transfer_out_fifo_cap,
        data_transfer_out_empty_n,
        data_transfer_out_read
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [31:0] Output_1_TDATA;
output   Output_1_TVALID;
input   Output_1_TREADY;
input  [127:0] data_transfer_out_dout;
input  [1:0] data_transfer_out_num_data_valid;
input  [1:0] data_transfer_out_fifo_cap;
input   data_transfer_out_empty_n;
output   data_transfer_out_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg data_transfer_out_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    data_transfer_out_blk_n;
wire   [31:0] input_lo_V_fu_88_p1;
reg   [31:0] input_lo_V_reg_140;
reg   [31:0] input_mi_V_reg_145;
reg   [7:0] trunc_ln_reg_150;
reg   [7:0] triangle_2ds_1_x0_V_reg_155;
wire    ap_CS_fsm_state2;
reg   [7:0] triangle_2ds_1_y0_V_reg_160;
reg   [7:0] triangle_2ds_1_x1_V_reg_165;
reg   [7:0] triangle_2ds_1_y1_V_reg_170;
reg   [7:0] triangle_2ds_1_x2_V_reg_175;
reg   [7:0] triangle_2ds_1_y2_V_reg_180;
reg   [7:0] triangle_2ds_1_z_V_reg_185;
wire    call_ret_i_projection_i1_fu_56_ap_ready;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_0;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_1;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_2;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_3;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_4;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_5;
wire   [7:0] call_ret_i_projection_i1_fu_56_ap_return_6;
wire    grp_rasterization1_i1_fu_63_ap_start;
wire    grp_rasterization1_i1_fu_63_ap_done;
wire    grp_rasterization1_i1_fu_63_ap_idle;
wire    grp_rasterization1_i1_fu_63_ap_ready;
wire   [31:0] grp_rasterization1_i1_fu_63_Output_1_TDATA;
wire    grp_rasterization1_i1_fu_63_Output_1_TVALID;
wire    grp_rasterization1_i1_fu_63_Output_1_TREADY;
reg    grp_rasterization1_i1_fu_63_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state1;
wire    ap_CS_fsm_state5;
wire    regslice_both_Output_1_U_apdone_blk;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    Output_1_TREADY_int_regslice;
wire    regslice_both_Output_1_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_rasterization1_i1_fu_63_ap_start_reg = 1'b0;
end

prj_rast1_projection_i1 call_ret_i_projection_i1_fu_56(
    .ap_ready(call_ret_i_projection_i1_fu_56_ap_ready),
    .input_lo(input_lo_V_reg_140),
    .input_mi(input_mi_V_reg_145),
    .input_hi(trunc_ln_reg_150),
    .ap_return_0(call_ret_i_projection_i1_fu_56_ap_return_0),
    .ap_return_1(call_ret_i_projection_i1_fu_56_ap_return_1),
    .ap_return_2(call_ret_i_projection_i1_fu_56_ap_return_2),
    .ap_return_3(call_ret_i_projection_i1_fu_56_ap_return_3),
    .ap_return_4(call_ret_i_projection_i1_fu_56_ap_return_4),
    .ap_return_5(call_ret_i_projection_i1_fu_56_ap_return_5),
    .ap_return_6(call_ret_i_projection_i1_fu_56_ap_return_6)
);

prj_rast1_rasterization1_i1 grp_rasterization1_i1_fu_63(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_rasterization1_i1_fu_63_ap_start),
    .ap_done(grp_rasterization1_i1_fu_63_ap_done),
    .ap_idle(grp_rasterization1_i1_fu_63_ap_idle),
    .ap_ready(grp_rasterization1_i1_fu_63_ap_ready),
    .triangle_2d_x0(triangle_2ds_1_x0_V_reg_155),
    .triangle_2d_y0(triangle_2ds_1_y0_V_reg_160),
    .triangle_2d_x1(triangle_2ds_1_x1_V_reg_165),
    .triangle_2d_y1(triangle_2ds_1_y1_V_reg_170),
    .triangle_2d_x2(triangle_2ds_1_x2_V_reg_175),
    .triangle_2d_y2(triangle_2ds_1_y2_V_reg_180),
    .triangle_2d_z(triangle_2ds_1_z_V_reg_185),
    .Output_1_TDATA(grp_rasterization1_i1_fu_63_Output_1_TDATA),
    .Output_1_TVALID(grp_rasterization1_i1_fu_63_Output_1_TVALID),
    .Output_1_TREADY(grp_rasterization1_i1_fu_63_Output_1_TREADY)
);

prj_rast1_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_1_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(grp_rasterization1_i1_fu_63_Output_1_TDATA),
    .vld_in(grp_rasterization1_i1_fu_63_Output_1_TVALID),
    .ack_in(Output_1_TREADY_int_regslice),
    .data_out(Output_1_TDATA),
    .vld_out(regslice_both_Output_1_U_vld_out),
    .ack_out(Output_1_TREADY),
    .apdone_blk(regslice_both_Output_1_U_apdone_blk)
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
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((regslice_both_Output_1_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_rasterization1_i1_fu_63_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_rasterization1_i1_fu_63_ap_start_reg <= 1'b1;
        end else if ((grp_rasterization1_i1_fu_63_ap_ready == 1'b1)) begin
            grp_rasterization1_i1_fu_63_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        input_lo_V_reg_140 <= input_lo_V_fu_88_p1;
        input_mi_V_reg_145 <= {{data_transfer_out_dout[63:32]}};
        trunc_ln_reg_150 <= {{data_transfer_out_dout[71:64]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        triangle_2ds_1_x0_V_reg_155 <= call_ret_i_projection_i1_fu_56_ap_return_0;
        triangle_2ds_1_x1_V_reg_165 <= call_ret_i_projection_i1_fu_56_ap_return_2;
        triangle_2ds_1_x2_V_reg_175 <= call_ret_i_projection_i1_fu_56_ap_return_4;
        triangle_2ds_1_y0_V_reg_160 <= call_ret_i_projection_i1_fu_56_ap_return_1;
        triangle_2ds_1_y1_V_reg_170 <= call_ret_i_projection_i1_fu_56_ap_return_3;
        triangle_2ds_1_y2_V_reg_180 <= call_ret_i_projection_i1_fu_56_ap_return_5;
        triangle_2ds_1_z_V_reg_185 <= call_ret_i_projection_i1_fu_56_ap_return_6;
    end
end

always @ (*) begin
    if (((data_transfer_out_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_rasterization1_i1_fu_63_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_Output_1_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_1_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((regslice_both_Output_1_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_transfer_out_blk_n = data_transfer_out_empty_n;
    end else begin
        data_transfer_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((data_transfer_out_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_transfer_out_read = 1'b1;
    end else begin
        data_transfer_out_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((data_transfer_out_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_rasterization1_i1_fu_63_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((regslice_both_Output_1_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state5))) begin
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

assign Output_1_TVALID = regslice_both_Output_1_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((data_transfer_out_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign grp_rasterization1_i1_fu_63_Output_1_TREADY = (ap_CS_fsm_state4 & Output_1_TREADY_int_regslice);

assign grp_rasterization1_i1_fu_63_ap_start = grp_rasterization1_i1_fu_63_ap_start_reg;

assign input_lo_V_fu_88_p1 = data_transfer_out_dout[31:0];

endmodule //prj_rast1_p_r1_module
