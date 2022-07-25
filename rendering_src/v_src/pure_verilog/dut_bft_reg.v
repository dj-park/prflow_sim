// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 


// module dut (
//   input [63:0] Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_din,
//   input Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_write,
//   output v1_buffer_V_full_n,
//   input [511:0] Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_din ,
//   input Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_write,
//   output v2_buffer_V_full_n,
//   output [63:0] v1_buffer_V_dout,
//   output v1_buffer_V_empty_n,
//   input Loop_VITIS_LOOP_32_2_proc2_U0_v1_buffer_V_read,
//   output [511:0] v2_buffer_V_dout,
//   output v2_buffer_V_empty_n,
//   input Loop_VITIS_LOOP_36_4_proc4_U0_v2_buffer_V_read,
//   input ap_rst_n,
//   input ap_clk,
//   input ap_start
// );
//     .input1_V_TDATA(Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_din),
//     .input1_V_TVALID(Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_write),
//     .input1_V_TREADY(v1_buffer_V_full_n),
//     .input2_V_TDATA(Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_din),
//     .input2_V_TVALID(Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_write),
//     .input2_V_TREADY(v2_buffer_V_full_n),
//     .output1_V_TDATA(tdata3),
//     .output1_V_TVALID(tvalid3),
//     .output1_V_TREADY(~resend_0),
//     .output2_V_TDATA(tdata1),
//     .output2_V_TVALID(tvalid1),
//     .output2_V_TREADY(tready1),
//     .output3_V_TDATA(v1_buffer_V_dout),
//     .output3_V_TVALID(v1_buffer_V_empty_n),
//     .output3_V_TREADY(Loop_VITIS_LOOP_32_2_proc2_U0_v1_buffer_V_read)


module dut (
  input [63:0] Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_din,
  input Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_write,
  output v1_buffer_V_full_n,
  input [511:0] Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_din ,
  input Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_write,
  output v2_buffer_V_full_n,
  output [63:0] v1_buffer_V_dout,
  output v1_buffer_V_empty_n,
  input Loop_VITIS_LOOP_40_2_proc2_U0_v1_buffer_V_read,
  output [511:0] v2_buffer_V_dout, // data out
  output v2_buffer_V_empty_n,
  input Loop_VITIS_LOOP_44_4_proc4_U0_v2_buffer_V_read,
  
  output [31:0] v3_buffer_V_dout, // winner signal
  output v3_buffer_V_empty_n,
  input v3_buffer_V_read,

  input ap_rst_n,
  input ap_clk,
  input ap_start
);
    // .input1_V_TDATA(Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_din),
    // .input1_V_TVALID(Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_write),
    // .input1_V_TREADY(v1_buffer_V_full_n),
    // .input2_V_TDATA(Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_din),
    // .input2_V_TVALID(Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_write),
    // .input2_V_TREADY(v2_buffer_V_full_n),
    // .output1_V_TDATA(tdata3),
    // .output1_V_TVALID(tvalid3),
    // .output1_V_TREADY(~resend_0),
    // .output2_V_TDATA(tdata1),
    // .output2_V_TVALID(tvalid1),
    // .output2_V_TREADY(tready1),
    // .output3_V_TDATA(v1_buffer_V_dout),
    // .output3_V_TVALID(v1_buffer_V_empty_n),
    // .output3_V_TREADY(Loop_VITIS_LOOP_40_2_proc2_U0_v1_buffer_V_read)


wire ap_rst_n_inv;
assign ap_rst_n_inv = ~ap_rst_n;



wire [48:0] dout_leaf_0;
wire [48:0] dout_leaf_1;
wire [48:0] dout_leaf_2;
wire [48:0] dout_leaf_3;
wire [48:0] dout_leaf_4;
wire [48:0] dout_leaf_5;
wire [48:0] dout_leaf_6;
wire [48:0] dout_leaf_7;
wire [48:0] dout_leaf_8;
wire [48:0] dout_leaf_9;
wire [48:0] dout_leaf_10;
wire [48:0] dout_leaf_11;
wire [48:0] dout_leaf_12;
wire [48:0] dout_leaf_13;
wire [48:0] dout_leaf_14;
wire [48:0] dout_leaf_15;
wire [48:0] dout_leaf_16;
wire [48:0] dout_leaf_17;
wire [48:0] dout_leaf_18;
wire [48:0] dout_leaf_19;
wire [48:0] dout_leaf_20;
wire [48:0] dout_leaf_21;
wire [48:0] dout_leaf_22;
wire [48:0] dout_leaf_23;
wire [48:0] dout_leaf_24;
wire [48:0] dout_leaf_25;
wire [48:0] dout_leaf_26;
wire [48:0] dout_leaf_27;
wire [48:0] dout_leaf_28;
wire [48:0] dout_leaf_29;
wire [48:0] dout_leaf_30;
wire [48:0] dout_leaf_31;

wire [48:0] din_leaf_0;
wire [48:0] din_leaf_1;
wire [48:0] din_leaf_2;
wire [48:0] din_leaf_3;
wire [48:0] din_leaf_4;
wire [48:0] din_leaf_5;
wire [48:0] din_leaf_6;
wire [48:0] din_leaf_7;
wire [48:0] din_leaf_8;
wire [48:0] din_leaf_9;
wire [48:0] din_leaf_10;
wire [48:0] din_leaf_11;
wire [48:0] din_leaf_12;
wire [48:0] din_leaf_13;
wire [48:0] din_leaf_14;
wire [48:0] din_leaf_15;
wire [48:0] din_leaf_16;
wire [48:0] din_leaf_17;
wire [48:0] din_leaf_18;
wire [48:0] din_leaf_19;
wire [48:0] din_leaf_20;
wire [48:0] din_leaf_21;
wire [48:0] din_leaf_22;
wire [48:0] din_leaf_23;
wire [48:0] din_leaf_24;
wire [48:0] din_leaf_25;
wire [48:0] din_leaf_26;
wire [48:0] din_leaf_27;
wire [48:0] din_leaf_28;
wire [48:0] din_leaf_29;
wire [48:0] din_leaf_30;
wire [48:0] din_leaf_31;

wire resend_0;
wire resend_1;
wire resend_2;
wire resend_3;
wire resend_4;
wire resend_5;
wire resend_6;
wire resend_7;
wire resend_8;
wire resend_9;
wire resend_10;
wire resend_11;
wire resend_12;
wire resend_13;
wire resend_14;
wire resend_15;
wire resend_16;
wire resend_17;
wire resend_18;
wire resend_19;
wire resend_20;
wire resend_21;
wire resend_22;
wire resend_23;
wire resend_24;
wire resend_25;
wire resend_26;
wire resend_27;
wire resend_28;
wire resend_29;
wire resend_30;
wire resend_31;


wire [48:0] dout_leaf_0_bft;
wire [48:0] dout_leaf_1_bft;
wire [48:0] dout_leaf_2_bft;
wire [48:0] dout_leaf_3_bft;
wire [48:0] dout_leaf_4_bft;
wire [48:0] dout_leaf_5_bft;
wire [48:0] dout_leaf_6_bft;
wire [48:0] dout_leaf_7_bft;
wire [48:0] dout_leaf_8_bft;
wire [48:0] dout_leaf_9_bft;
wire [48:0] dout_leaf_10_bft;
wire [48:0] dout_leaf_11_bft;
wire [48:0] dout_leaf_12_bft;
wire [48:0] dout_leaf_13_bft;
wire [48:0] dout_leaf_14_bft;
wire [48:0] dout_leaf_15_bft;
wire [48:0] dout_leaf_16_bft;
wire [48:0] dout_leaf_17_bft;
wire [48:0] dout_leaf_18_bft;
wire [48:0] dout_leaf_19_bft;
wire [48:0] dout_leaf_20_bft;
wire [48:0] dout_leaf_21_bft;
wire [48:0] dout_leaf_22_bft;
wire [48:0] dout_leaf_23_bft;
wire [48:0] dout_leaf_24_bft;
wire [48:0] dout_leaf_25_bft;
wire [48:0] dout_leaf_26_bft;
wire [48:0] dout_leaf_27_bft;
wire [48:0] dout_leaf_28_bft;
wire [48:0] dout_leaf_29_bft;
wire [48:0] dout_leaf_30_bft;
wire [48:0] dout_leaf_31_bft;

wire [48:0] din_leaf_0_bft;
wire [48:0] din_leaf_1_bft;
wire [48:0] din_leaf_2_bft;
wire [48:0] din_leaf_3_bft;
wire [48:0] din_leaf_4_bft;
wire [48:0] din_leaf_5_bft;
wire [48:0] din_leaf_6_bft;
wire [48:0] din_leaf_7_bft;
wire [48:0] din_leaf_8_bft;
wire [48:0] din_leaf_9_bft;
wire [48:0] din_leaf_10_bft;
wire [48:0] din_leaf_11_bft;
wire [48:0] din_leaf_12_bft;
wire [48:0] din_leaf_13_bft;
wire [48:0] din_leaf_14_bft;
wire [48:0] din_leaf_15_bft;
wire [48:0] din_leaf_16_bft;
wire [48:0] din_leaf_17_bft;
wire [48:0] din_leaf_18_bft;
wire [48:0] din_leaf_19_bft;
wire [48:0] din_leaf_20_bft;
wire [48:0] din_leaf_21_bft;
wire [48:0] din_leaf_22_bft;
wire [48:0] din_leaf_23_bft;
wire [48:0] din_leaf_24_bft;
wire [48:0] din_leaf_25_bft;
wire [48:0] din_leaf_26_bft;
wire [48:0] din_leaf_27_bft;
wire [48:0] din_leaf_28_bft;
wire [48:0] din_leaf_29_bft;
wire [48:0] din_leaf_30_bft;
wire [48:0] din_leaf_31_bft;

wire resend_0_bft;
wire resend_1_bft;
wire resend_2_bft;
wire resend_3_bft;
wire resend_4_bft;
wire resend_5_bft;
wire resend_6_bft;
wire resend_7_bft;
wire resend_8_bft;
wire resend_9_bft;
wire resend_10_bft;
wire resend_11_bft;
wire resend_12_bft;
wire resend_13_bft;
wire resend_14_bft;
wire resend_15_bft;
wire resend_16_bft;
wire resend_17_bft;
wire resend_18_bft;
wire resend_19_bft;
wire resend_20_bft;
wire resend_21_bft;
wire resend_22_bft;
wire resend_23_bft;
wire resend_24_bft;
wire resend_25_bft;
wire resend_26_bft;
wire resend_27_bft;
wire resend_28_bft;
wire resend_29_bft;
wire resend_30_bft;
wire resend_31_bft;


reg [48:0] dout_leaf_0_reg;
reg [48:0] dout_leaf_1_reg;
reg [48:0] dout_leaf_2_reg;
reg [48:0] dout_leaf_3_reg;
reg [48:0] dout_leaf_4_reg;
reg [48:0] dout_leaf_5_reg;
reg [48:0] dout_leaf_6_reg;
reg [48:0] dout_leaf_7_reg;
reg [48:0] dout_leaf_8_reg;
reg [48:0] dout_leaf_9_reg;
reg [48:0] dout_leaf_10_reg;
reg [48:0] dout_leaf_11_reg;
reg [48:0] dout_leaf_12_reg;
reg [48:0] dout_leaf_13_reg;
reg [48:0] dout_leaf_14_reg;
reg [48:0] dout_leaf_15_reg;
reg [48:0] dout_leaf_16_reg;
reg [48:0] dout_leaf_17_reg;
reg [48:0] dout_leaf_18_reg;
reg [48:0] dout_leaf_19_reg;
reg [48:0] dout_leaf_20_reg;
reg [48:0] dout_leaf_21_reg;
reg [48:0] dout_leaf_22_reg;
reg [48:0] dout_leaf_23_reg;
reg [48:0] dout_leaf_24_reg;
reg [48:0] dout_leaf_25_reg;
reg [48:0] dout_leaf_26_reg;
reg [48:0] dout_leaf_27_reg;
reg [48:0] dout_leaf_28_reg;
reg [48:0] dout_leaf_29_reg;
reg [48:0] dout_leaf_30_reg;
reg [48:0] dout_leaf_31_reg;

reg [48:0] din_leaf_0_reg;
reg [48:0] din_leaf_1_reg;
reg [48:0] din_leaf_2_reg;
reg [48:0] din_leaf_3_reg;
reg [48:0] din_leaf_4_reg;
reg [48:0] din_leaf_5_reg;
reg [48:0] din_leaf_6_reg;
reg [48:0] din_leaf_7_reg;
reg [48:0] din_leaf_8_reg;
reg [48:0] din_leaf_9_reg;
reg [48:0] din_leaf_10_reg;
reg [48:0] din_leaf_11_reg;
reg [48:0] din_leaf_12_reg;
reg [48:0] din_leaf_13_reg;
reg [48:0] din_leaf_14_reg;
reg [48:0] din_leaf_15_reg;
reg [48:0] din_leaf_16_reg;
reg [48:0] din_leaf_17_reg;
reg [48:0] din_leaf_18_reg;
reg [48:0] din_leaf_19_reg;
reg [48:0] din_leaf_20_reg;
reg [48:0] din_leaf_21_reg;
reg [48:0] din_leaf_22_reg;
reg [48:0] din_leaf_23_reg;
reg [48:0] din_leaf_24_reg;
reg [48:0] din_leaf_25_reg;
reg [48:0] din_leaf_26_reg;
reg [48:0] din_leaf_27_reg;
reg [48:0] din_leaf_28_reg;
reg [48:0] din_leaf_29_reg;
reg [48:0] din_leaf_30_reg;
reg [48:0] din_leaf_31_reg;

reg resend_0_reg;
reg resend_1_reg;
reg resend_2_reg;
reg resend_3_reg;
reg resend_4_reg;
reg resend_5_reg;
reg resend_6_reg;
reg resend_7_reg;
reg resend_8_reg;
reg resend_9_reg;
reg resend_10_reg;
reg resend_11_reg;
reg resend_12_reg;
reg resend_13_reg;
reg resend_14_reg;
reg resend_15_reg;
reg resend_16_reg;
reg resend_17_reg;
reg resend_18_reg;
reg resend_19_reg;
reg resend_20_reg;
reg resend_21_reg;
reg resend_22_reg;
reg resend_23_reg;
reg resend_24_reg;
reg resend_25_reg;
reg resend_26_reg;
reg resend_27_reg;
reg resend_28_reg;
reg resend_29_reg;
reg resend_30_reg;
reg resend_31_reg;



wire [31:0] tdata1;
wire        tvalid1;
wire        tready1;

wire [31:0] tdata2;
wire        tvalid2;
wire        tready2;

wire [63:0] tdata3;
wire        tvalid3;
wire        tready3;

config_parser config_parser_inst(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .input1_V_TDATA(Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_din),
    .input1_V_TVALID(Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_write),
    .input1_V_TREADY(v1_buffer_V_full_n),
    .input2_V_TDATA(Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_din),
    .input2_V_TVALID(Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_write),
    .input2_V_TREADY(v2_buffer_V_full_n),
    .output1_V_TDATA(tdata3),
    .output1_V_TVALID(tvalid3),
    .output1_V_TREADY(~resend_0),
    .output2_V_TDATA(tdata1),
    .output2_V_TVALID(tvalid1),
    .output2_V_TREADY(tready1),
    .output3_V_TDATA(v1_buffer_V_dout),
    .output3_V_TVALID(v1_buffer_V_empty_n),
    .output3_V_TREADY(Loop_VITIS_LOOP_32_2_proc2_U0_v1_buffer_V_read)
);

data32to512 data32to512_inst(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_V_TDATA(tdata2),
    .Input_1_V_TVALID(tvalid2),
    .Input_1_V_TREADY(tready2),
    .Output_1_V_TDATA(v2_buffer_V_dout),
    .Output_1_V_TVALID(v2_buffer_V_empty_n),
    .Output_1_V_TREADY(Loop_VITIS_LOOP_36_4_proc4_U0_v2_buffer_V_read)
);

InterfaceWrapper1 InterfaceWrapper1_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_1),
    .dout_leaf_interface2bft(dout_leaf_1),
    .resend(resend_1),
    .Input_1_V_V(tdata1),
    .Input_1_V_V_ap_vld(tvalid1),
    .Input_1_V_V_ap_ack(tready1),
    .Output_1_V_V(tdata2),
    .Output_1_V_V_ap_vld(tvalid2),
    .Output_1_V_V_ap_ack(tready2),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );

// UPDATE: assign hanging wires
//assign dout_leaf_0_bft = {tvalid3, tdata3[47:0]};
assign dout_leaf_18_bft = 0;
assign dout_leaf_19_bft = 0;

assign dout_leaf_20_bft = 0;
assign dout_leaf_21_bft = 0;

assign dout_leaf_22_bft = 0;
assign dout_leaf_23_bft = 0;

assign dout_leaf_24_bft = 0;
assign dout_leaf_25_bft = 0;
assign dout_leaf_26_bft = 0;
assign dout_leaf_27_bft = 0;
assign dout_leaf_28_bft = 0;
assign dout_leaf_29_bft = 0;
assign dout_leaf_30_bft = 0;
assign dout_leaf_31_bft = 0;

assign dout_leaf_0_bft = dout_leaf_0_reg;
assign dout_leaf_1_bft = dout_leaf_1_reg;
assign dout_leaf_2_bft = dout_leaf_2_reg;
assign dout_leaf_3_bft = dout_leaf_3_reg;
assign dout_leaf_4_bft = dout_leaf_4_reg;
assign dout_leaf_5_bft = dout_leaf_5_reg;
assign dout_leaf_6_bft = dout_leaf_6_reg;
assign dout_leaf_7_bft = dout_leaf_7_reg;
assign dout_leaf_8_bft = dout_leaf_8_reg;
assign dout_leaf_9_bft = dout_leaf_9_reg;
assign dout_leaf_10_bft = dout_leaf_10_reg;
assign dout_leaf_11_bft = dout_leaf_11_reg;
assign dout_leaf_12_bft = dout_leaf_12_reg;
assign dout_leaf_13_bft = dout_leaf_13_reg;
assign dout_leaf_14_bft = dout_leaf_14_reg;
assign dout_leaf_15_bft = dout_leaf_15_reg;
assign dout_leaf_16_bft = dout_leaf_16_reg;
assign dout_leaf_17_bft = dout_leaf_17_reg;
assign dout_leaf_18_bft = dout_leaf_18_reg;
assign dout_leaf_19_bft = dout_leaf_19_reg;
assign dout_leaf_20_bft = dout_leaf_20_reg;
assign dout_leaf_21_bft = dout_leaf_21_reg;
assign dout_leaf_22_bft = dout_leaf_22_reg;
assign dout_leaf_23_bft = dout_leaf_23_reg;

assign din_leaf_1 = din_leaf_1_reg;
assign din_leaf_2 = din_leaf_2_reg;
assign din_leaf_3 = din_leaf_3_reg;
assign din_leaf_4 = din_leaf_4_reg;
assign din_leaf_5 = din_leaf_5_reg;
assign din_leaf_6 = din_leaf_6_reg;
assign din_leaf_7 = din_leaf_7_reg;
assign din_leaf_8 = din_leaf_8_reg;
assign din_leaf_9 = din_leaf_9_reg;
assign din_leaf_10 = din_leaf_10_reg;
assign din_leaf_11 = din_leaf_11_reg;
assign din_leaf_12 = din_leaf_12_reg;
assign din_leaf_13 = din_leaf_13_reg;
assign din_leaf_14 = din_leaf_14_reg;
assign din_leaf_15 = din_leaf_15_reg;
assign din_leaf_16 = din_leaf_16_reg;
assign din_leaf_17 = din_leaf_17_reg;
assign din_leaf_18 = din_leaf_18_reg;
assign din_leaf_19 = din_leaf_19_reg;
assign din_leaf_20 = din_leaf_20_reg;
assign din_leaf_21 = din_leaf_21_reg;
assign din_leaf_22 = din_leaf_22_reg;
assign din_leaf_23 = din_leaf_23_reg;

assign resend_0 = resend_0_reg;
assign resend_1 = resend_1_reg;
assign resend_2 = resend_2_reg;
assign resend_3 = resend_3_reg;
assign resend_4 = resend_4_reg;
assign resend_5 = resend_5_reg;
assign resend_6 = resend_6_reg;
assign resend_7 = resend_7_reg;
assign resend_8 = resend_8_reg;
assign resend_9 = resend_9_reg;
assign resend_10 = resend_10_reg;
assign resend_11 = resend_11_reg;
assign resend_12 = resend_12_reg;
assign resend_13 = resend_13_reg;
assign resend_14 = resend_14_reg;
assign resend_15 = resend_15_reg;
assign resend_16 = resend_16_reg;
assign resend_17 = resend_17_reg;
assign resend_18 = resend_18_reg;
assign resend_19 = resend_19_reg;
assign resend_20 = resend_20_reg;
assign resend_21 = resend_21_reg;
assign resend_22 = resend_22_reg;
assign resend_23 = resend_23_reg;


always @ (posedge ap_clk) begin
        dout_leaf_0_reg <= {tvalid3, tdata3[47:0]};
        dout_leaf_1_reg <= dout_leaf_1; 
        dout_leaf_2_reg <= dout_leaf_2; 
        dout_leaf_3_reg <= dout_leaf_3; 
        dout_leaf_4_reg <= dout_leaf_4; 
        dout_leaf_5_reg <= dout_leaf_5; 
        dout_leaf_6_reg <= dout_leaf_6; 
        dout_leaf_7_reg <= dout_leaf_7; 
        dout_leaf_8_reg <= dout_leaf_8; 
        dout_leaf_9_reg <= dout_leaf_9; 
        dout_leaf_10_reg <= dout_leaf_10; 
        dout_leaf_11_reg <= dout_leaf_11; 
        dout_leaf_12_reg <= dout_leaf_12; 
        dout_leaf_13_reg <= dout_leaf_13; 
        dout_leaf_14_reg <= dout_leaf_14; 
        dout_leaf_15_reg <= dout_leaf_15; 
        dout_leaf_16_reg <= dout_leaf_16; 
        dout_leaf_17_reg <= dout_leaf_17; 
        dout_leaf_18_reg <= dout_leaf_18; 
        dout_leaf_19_reg <= dout_leaf_19; 
        dout_leaf_20_reg <= dout_leaf_20; 
        dout_leaf_21_reg <= dout_leaf_21; 
        dout_leaf_22_reg <= dout_leaf_22; 
        dout_leaf_23_reg <= dout_leaf_23; 
end

always @ (posedge ap_clk) begin
        din_leaf_1_reg <= din_leaf_1_bft;
        din_leaf_2_reg <= din_leaf_2_bft; 
        din_leaf_3_reg <= din_leaf_3_bft; 
        din_leaf_4_reg <= din_leaf_4_bft; 
        din_leaf_5_reg <= din_leaf_5_bft; 
        din_leaf_6_reg <= din_leaf_6_bft; 
        din_leaf_7_reg <= din_leaf_7_bft; 
        din_leaf_8_reg <= din_leaf_8_bft; 
        din_leaf_9_reg <= din_leaf_9_bft; 
        din_leaf_10_reg <= din_leaf_10_bft; 
        din_leaf_11_reg <= din_leaf_11_bft; 
        din_leaf_12_reg <= din_leaf_12_bft; 
        din_leaf_13_reg <= din_leaf_13_bft; 
        din_leaf_14_reg <= din_leaf_14_bft; 
        din_leaf_15_reg <= din_leaf_15_bft; 
        din_leaf_16_reg <= din_leaf_16_bft; 
        din_leaf_17_reg <= din_leaf_17_bft; 
        din_leaf_18_reg <= din_leaf_18_bft; 
        din_leaf_19_reg <= din_leaf_19_bft; 
        din_leaf_20_reg <= din_leaf_20_bft; 
        din_leaf_21_reg <= din_leaf_21_bft; 
        din_leaf_22_reg <= din_leaf_22_bft; 
        din_leaf_23_reg <= din_leaf_23_bft; 
end

always @ (posedge ap_clk) begin
        resend_0_reg <= resend_0_bft;
        resend_1_reg <= resend_1_bft;
        resend_2_reg <= resend_2_bft; 
        resend_3_reg <= resend_3_bft; 
        resend_4_reg <= resend_4_bft; 
        resend_5_reg <= resend_5_bft; 
        resend_6_reg <= resend_6_bft; 
        resend_7_reg <= resend_7_bft; 
        resend_8_reg <= resend_8_bft; 
        resend_9_reg <= resend_9_bft; 
        resend_10_reg <= resend_10_bft; 
        resend_11_reg <= resend_11_bft; 
        resend_12_reg <= resend_12_bft; 
        resend_13_reg <= resend_13_bft; 
        resend_14_reg <= resend_14_bft; 
        resend_15_reg <= resend_15_bft; 
        resend_16_reg <= resend_16_bft; 
        resend_17_reg <= resend_17_bft; 
        resend_18_reg <= resend_18_bft; 
        resend_19_reg <= resend_19_bft; 
        resend_20_reg <= resend_20_bft; 
        resend_21_reg <= resend_21_bft; 
        resend_22_reg <= resend_22_bft; 
        resend_23_reg <= resend_23_bft; 
end


bft bft_inst(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .dout_leaf_0(dout_leaf_0_bft),
    .dout_leaf_1(dout_leaf_1_bft),
    .dout_leaf_2(dout_leaf_2_bft),
    .dout_leaf_3(dout_leaf_3_bft),
    .dout_leaf_4(dout_leaf_4_bft),
    .dout_leaf_5(dout_leaf_5_bft),
    .dout_leaf_6(dout_leaf_6_bft),
    .dout_leaf_7(dout_leaf_7_bft),
    .dout_leaf_8(dout_leaf_8_bft),
    .dout_leaf_9(dout_leaf_9_bft),
    .dout_leaf_10(dout_leaf_10_bft),
    .dout_leaf_11(dout_leaf_11_bft),
    .dout_leaf_12(dout_leaf_12_bft),
    .dout_leaf_13(dout_leaf_13_bft),
    .dout_leaf_14(dout_leaf_14_bft),
    .dout_leaf_15(dout_leaf_15_bft),
    .dout_leaf_16(dout_leaf_16_bft),
    .dout_leaf_17(dout_leaf_17_bft),
    .dout_leaf_18(dout_leaf_18_bft),
    .dout_leaf_19(dout_leaf_19_bft),
    .dout_leaf_20(dout_leaf_20_bft),
    .dout_leaf_21(dout_leaf_21_bft),
    .dout_leaf_22(dout_leaf_22_bft),
    .dout_leaf_23(dout_leaf_23_bft),
    .dout_leaf_24(dout_leaf_24_bft),
    .dout_leaf_25(dout_leaf_25_bft),
    .dout_leaf_26(dout_leaf_26_bft),
    .dout_leaf_27(dout_leaf_27_bft),
    .dout_leaf_28(dout_leaf_28_bft),
    .dout_leaf_29(dout_leaf_29_bft),
    .dout_leaf_30(dout_leaf_30_bft),
    .dout_leaf_31(dout_leaf_31_bft),
    .din_leaf_0(din_leaf_0),
    .din_leaf_1(din_leaf_1_bft),
    .din_leaf_2(din_leaf_2_bft),
    .din_leaf_3(din_leaf_3_bft),
    .din_leaf_4(din_leaf_4_bft),
    .din_leaf_5(din_leaf_5_bft),
    .din_leaf_6(din_leaf_6_bft),
    .din_leaf_7(din_leaf_7_bft),
    .din_leaf_8(din_leaf_8_bft),
    .din_leaf_9(din_leaf_9_bft),
    .din_leaf_10(din_leaf_10_bft),
    .din_leaf_11(din_leaf_11_bft),
    .din_leaf_12(din_leaf_12_bft),
    .din_leaf_13(din_leaf_13_bft),
    .din_leaf_14(din_leaf_14_bft),
    .din_leaf_15(din_leaf_15_bft),
    .din_leaf_16(din_leaf_16_bft),
    .din_leaf_17(din_leaf_17_bft),
    .din_leaf_18(din_leaf_18_bft),
    .din_leaf_19(din_leaf_19_bft),
    .din_leaf_20(din_leaf_20_bft),
    .din_leaf_21(din_leaf_21_bft),
    .din_leaf_22(din_leaf_22_bft),
    .din_leaf_23(din_leaf_23_bft),
    .din_leaf_24(din_leaf_24_bft),
    .din_leaf_25(din_leaf_25_bft),
    .din_leaf_26(din_leaf_26_bft),
    .din_leaf_27(din_leaf_27_bft),
    .din_leaf_28(din_leaf_28_bft),
    .din_leaf_29(din_leaf_29_bft),
    .din_leaf_30(din_leaf_30_bft),
    .din_leaf_31(din_leaf_31_bft),
    .resend_0(resend_0_bft),
    .resend_1(resend_1_bft),
    .resend_2(resend_2_bft),
    .resend_3(resend_3_bft),
    .resend_4(resend_4_bft),
    .resend_5(resend_5_bft),
    .resend_6(resend_6_bft),
    .resend_7(resend_7_bft),
    .resend_8(resend_8_bft),
    .resend_9(resend_9_bft),
    .resend_10(resend_10_bft),
    .resend_11(resend_11_bft),
    .resend_12(resend_12_bft),
    .resend_13(resend_13_bft),
    .resend_14(resend_14_bft),
    .resend_15(resend_15_bft),
    .resend_16(resend_16_bft),
    .resend_17(resend_17_bft),
    .resend_18(resend_18_bft),
    .resend_19(resend_19_bft),
    .resend_20(resend_20_bft),
    .resend_21(resend_21_bft),
    .resend_22(resend_22_bft),
    .resend_23(resend_23_bft),
    .resend_24(resend_24_bft),
    .resend_25(resend_25_bft),
    .resend_26(resend_26_bft),
    .resend_27(resend_27_bft),
    .resend_28(resend_28_bft),
    .resend_29(resend_29_bft),
    .resend_30(resend_30_bft),
    .resend_31(resend_31_bft)
    );


// UPDATE: page inst
page_2 page2_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_2),
    .dout_leaf_interface2bft(dout_leaf_2),
    .resend(resend_2),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
    
page_3 page3_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_3),
    .dout_leaf_interface2bft(dout_leaf_3),
    .resend(resend_3),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
 
 page_4 page4_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_4),
    .dout_leaf_interface2bft(dout_leaf_4),
    .resend(resend_4),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
    
 page_5 page5_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_5),
    .dout_leaf_interface2bft(dout_leaf_5),
    .resend(resend_5),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
    
 page_6 page6_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_6),
    .dout_leaf_interface2bft(dout_leaf_6),
    .resend(resend_6),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
    
page_7 page7_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_7),
    .dout_leaf_interface2bft(dout_leaf_7),
    .resend(resend_7),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );
    
page_8 page8_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_8),
    .dout_leaf_interface2bft(dout_leaf_8),
    .resend(resend_8),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );

page_9 page9_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_9),
    .dout_leaf_interface2bft(dout_leaf_9),
    .resend(resend_9),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );

page page10_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_10),
    .dout_leaf_interface2bft(dout_leaf_10),
    .resend(resend_10),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );    
    
page_11 page11_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_11),
    .dout_leaf_interface2bft(dout_leaf_11),
    .resend(resend_11),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );    
    
page_12 page12_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_12),
    .dout_leaf_interface2bft(dout_leaf_12),
    .resend(resend_12),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );    
    
page page13_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_13),
    .dout_leaf_interface2bft(dout_leaf_13),
    .resend(resend_13),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );    

page_14 page14_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_14),
    .dout_leaf_interface2bft(dout_leaf_14),
    .resend(resend_14),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );  
      
page_15 page15_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_15),
    .dout_leaf_interface2bft(dout_leaf_15),
    .resend(resend_15),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );    
    
page page16_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_16),
    .dout_leaf_interface2bft(dout_leaf_16),
    .resend(resend_16),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );

page page17_inst(
    .clk(ap_clk),
    .din_leaf_bft2interface(din_leaf_17),
    .dout_leaf_interface2bft(dout_leaf_17),
    .resend(resend_17),
    .reset(ap_rst_n_inv),
    .ap_start(ap_start)
    );

endmodule

