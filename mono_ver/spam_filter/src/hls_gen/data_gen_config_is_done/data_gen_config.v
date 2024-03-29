// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="data_gen_config_data_gen_config,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.501250,HLS_SYN_LAT=720080,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=32,HLS_SYN_LUT=185,HLS_VERSION=2022_1}" *)

module data_gen_config (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Output_1_TDATA,
        Output_1_TVALID,
        Output_1_TREADY,
        Output_2_TDATA,
        Output_2_TVALID,
        Output_2_TREADY
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [63:0] Output_1_TDATA;
output   Output_1_TVALID;
input   Output_1_TREADY;
output  [511:0] Output_2_TDATA;
output   Output_2_TVALID;
input   Output_2_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    Output_1_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_done;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_idle;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_ready;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TREADY;
wire   [511:0] grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TDATA;
wire    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TVALID;
reg    grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg;
wire    ap_CS_fsm_state7;
reg    ap_block_state1;
wire    ap_CS_fsm_state8;
wire    regslice_both_Output_1_U_apdone_blk;
wire    regslice_both_Output_2_U_apdone_blk;
reg    ap_block_state8;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
reg   [63:0] Output_1_TDATA_int_regslice;
reg    Output_1_TVALID_int_regslice;
wire    Output_1_TREADY_int_regslice;
wire    regslice_both_Output_1_U_vld_out;
wire    Output_2_TREADY_int_regslice;
wire    regslice_both_Output_2_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg = 1'b0;
end

data_gen_config_data_gen_config_Pipeline_VITIS_LOOP_40_1 grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start),
    .ap_done(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_done),
    .ap_idle(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_idle),
    .ap_ready(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_ready),
    .Output_2_TREADY(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TREADY),
    .Output_2_TDATA(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TDATA),
    .Output_2_TVALID(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TVALID)
);

data_gen_config_regslice_both #(
    .DataWidth( 64 ))
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

data_gen_config_regslice_both #(
    .DataWidth( 512 ))
regslice_both_Output_2_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TDATA),
    .vld_in(grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TVALID),
    .ack_in(Output_2_TREADY_int_regslice),
    .data_out(Output_2_TDATA),
    .vld_out(regslice_both_Output_2_U_vld_out),
    .ack_out(Output_2_TREADY),
    .apdone_blk(regslice_both_Output_2_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state6) & (1'b1 == Output_1_TREADY_int_regslice))) begin
            grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg <= 1'b1;
        end else if ((grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_ready == 1'b1)) begin
            grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        Output_1_TDATA_blk_n = Output_1_TREADY_int_regslice;
    end else begin
        Output_1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (1'b1 == Output_1_TREADY_int_regslice))) begin
        Output_1_TDATA_int_regslice = 64'd62;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == Output_1_TREADY_int_regslice))) begin
        Output_1_TDATA_int_regslice = 64'd64;
    end else if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == Output_1_TREADY_int_regslice))) begin
        Output_1_TDATA_int_regslice = 64'd7;
    end else if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == Output_1_TREADY_int_regslice))) begin
        Output_1_TDATA_int_regslice = 64'd720071;
    end else if ((~((1'b0 == Output_1_TREADY_int_regslice) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        Output_1_TDATA_int_regslice = 64'd0;
    end else begin
        Output_1_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state5) & (1'b1 == Output_1_TREADY_int_regslice)) | ((1'b1 == ap_CS_fsm_state4) & (1'b1 == Output_1_TREADY_int_regslice)) | ((1'b1 == ap_CS_fsm_state3) & (1'b1 == Output_1_TREADY_int_regslice)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == Output_1_TREADY_int_regslice)) | (~((1'b0 == Output_1_TREADY_int_regslice) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        Output_1_TVALID_int_regslice = 1'b1;
    end else begin
        Output_1_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == Output_1_TREADY_int_regslice) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_TREADY_int_regslice)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_TREADY_int_regslice)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_TREADY_int_regslice)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_TREADY_int_regslice)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_TREADY_int_regslice)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_2_U_apdone_blk == 1'b1) | (regslice_both_Output_1_U_apdone_blk == 1'b1))) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_2_U_apdone_blk == 1'b1) | (regslice_both_Output_1_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state8))) begin
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
    if ((~((regslice_both_Output_2_U_apdone_blk == 1'b1) | (regslice_both_Output_1_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == Output_1_TREADY_int_regslice) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == Output_1_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == Output_1_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == Output_1_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (1'b1 == Output_1_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (1'b1 == Output_1_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if ((~((regslice_both_Output_2_U_apdone_blk == 1'b1) | (regslice_both_Output_1_U_apdone_blk == 1'b1)) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Output_1_TVALID = regslice_both_Output_1_U_vld_out;

assign Output_2_TVALID = regslice_both_Output_2_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((1'b0 == Output_1_TREADY_int_regslice) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state8 = ((regslice_both_Output_2_U_apdone_blk == 1'b1) | (regslice_both_Output_1_U_apdone_blk == 1'b1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_Output_2_TREADY = (ap_CS_fsm_state7 & Output_2_TREADY_int_regslice);

assign grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start = grp_data_gen_config_Pipeline_VITIS_LOOP_40_1_fu_52_ap_start_reg;

endmodule //data_gen_config
