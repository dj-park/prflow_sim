`timescale 1ns / 1ps
module page_2_double(
    input wire clk_0,
    input wire [48 : 0] din_leaf_bft2interface_0,
    output wire  [48 : 0] dout_leaf_interface2bft_0,
    input wire resend_0,
    input wire reset_0,
    input wire ap_start_0,

    input wire clk_1,
    input wire [48 : 0] din_leaf_bft2interface_1,
    output wire  [48 : 0] dout_leaf_interface2bft_1,
    input wire resend_1,
    input wire reset_1,
    input wire ap_start_1
    );

    wire ap_start_user_0;
    wire [32-1 :0] dout_leaf_interface2user_1_0;
    wire vld_interface2user_1_0;
    wire ack_user2interface_1_0;
    wire [128-1 :0] dout_leaf_interface2user_1_user_0;
    wire vld_interface2user_1_user_0;
    wire ack_user2interface_1_user_0;
    read_queue#(
      .IN_WIDTH(32),
      .OUT_WIDTH(128)
    )Input_1_converter(
      .clk(clk_0),
      .reset(reset_0),
      .din(dout_leaf_interface2user_1_0),
      .vld_in(vld_interface2user_1_0),
      .rdy_upward(ack_user2interface_1_0),
      .dout(dout_leaf_interface2user_1_user_0),
      .vld_out(vld_interface2user_1_user_0),
      .rdy_downward(ack_user2interface_1_user_0),
      .ap_start(ap_start_0)
    );
    // wire [32-1 :0] din_leaf_user2interface_2;
    // wire vld_user2interface_2;
    // wire ack_interface2user_2;
    // wire [32-1 :0] din_leaf_user2interface_2_user;
    // wire vld_user2interface_2_user;
    // wire ack_interface2user_2_user;
    // assign din_leaf_user2interface_2 = din_leaf_user2interface_2_user;
    // assign vld_user2interface_2 = vld_user2interface_2_user;
    // assign ack_interface2user_2_user = ack_interface2user_2;
    // wire [32-1 :0] din_leaf_user2interface_1;
    // wire vld_user2interface_1;
    // wire ack_interface2user_1;
    // wire [32-1 :0] din_leaf_user2interface_1_user;
    // wire vld_user2interface_1_user;
    // wire ack_interface2user_1_user;
    // assign din_leaf_user2interface_1 = din_leaf_user2interface_1_user;
    // assign vld_user2interface_1 = vld_user2interface_1_user;
    // assign ack_interface2user_1_user = ack_interface2user_1;
 
    wire [32-1 :0] din_leaf_user2interface_2_user_0;
    wire vld_user2interface_2_user_0;
    wire ack_interface2user_2_user_0;
    wire [32-1 :0] din_leaf_user2interface_1_user_0;
    wire vld_user2interface_1_user_0;
    wire ack_interface2user_1_user_0;

    leaf_interface #(
        .PACKET_BITS(49),
        .PAYLOAD_BITS(32),
        .NUM_LEAF_BITS(5),
        .NUM_PORT_BITS(4),
        .NUM_ADDR_BITS(7),
        .NUM_IN_PORTS(1),
        .NUM_OUT_PORTS(2),
        .NUM_BRAM_ADDR_BITS(7),
        .FREESPACE_UPDATE_SIZE(64)
    )leaf_interface_inst_0(
        .clk(clk_0),
        .reset(reset_0),
        .din_leaf_bft2interface(din_leaf_bft2interface_0),
        .dout_leaf_interface2bft(dout_leaf_interface2bft_0),
        .ap_start_user(ap_start_user_0),
        .resend(resend_0),
        .dout_leaf_interface2user({dout_leaf_interface2user_1_0}),
        .vld_interface2user({vld_interface2user_1_0}),
        .ack_user2interface({ack_user2interface_1_0}),

        .ack_interface2user(),
        .vld_user2interface(),
        .din_leaf_user2interface(),
        .ap_start(ap_start_0)
    );
    


    data_redir_m data_redir_m_inst(
        .ap_clk(clk_0),
        .ap_start(ap_start_user_0),
        .ap_done(),
        .ap_idle(),
        .ap_ready(),
        .Input_1_V_TDATA(dout_leaf_interface2user_1_user_0),
        .Input_1_V_TVALID(vld_interface2user_1_user_0),
        .Input_1_V_TREADY(ack_user2interface_1_user_0),

        .Output_2_V_TDATA(din_leaf_user2interface_2_user_0),
        .Output_2_V_TVALID(vld_user2interface_2_user_0),
        .Output_2_V_TREADY(ack_interface2user_2_user_0),

        .Output_1_V_TDATA(din_leaf_user2interface_1_user_0),
        .Output_1_V_TVALID(vld_user2interface_1_user_0),
        .Output_1_V_TREADY(ack_interface2user_1_user_0),
        .ap_rst_n(~reset_0)
        );  


    wire [32-1 :0] dout_leaf_interface2user_2_user_1;
    wire vld_interface2user_2_user_1;
    wire ack_user2interface_2_user_1;
    wire [32-1 :0] dout_leaf_interface2user_1_user_1;
    wire vld_interface2user_1_user_1;
    wire ack_user2interface_1_user_1;


stream_shell #(
  .PAYLOAD_BITS(32),
  .NUM_BRAM_ADDR_BITS(7)
  )stream_shell_0(
  .clk(clk_0), // don't matter
  .din(din_leaf_user2interface_2_user_0),
  .val_in(vld_user2interface_2_user_0),
  .ready_upward(ack_interface2user_2_user_0),

  .dout(dout_leaf_interface2user_2_user_1), // raster
  .val_out(vld_interface2user_2_user_1), // raster
  .ready_downward(ack_user2interface_2_user_1), // raster
  .reset(reset_0)); // don't matter

stream_shell #(
  .PAYLOAD_BITS(32),
  .NUM_BRAM_ADDR_BITS(7)
  )stream_shell_1(
  .clk(clk_0), // don't matter
  .din(din_leaf_user2interface_1_user_0),
  .val_in(vld_user2interface_1_user_0),
  .ready_upward(ack_interface2user_1_user_0),

  .dout(dout_leaf_interface2user_1_user_1), // raster
  .val_out(vld_interface2user_1_user_1), // raster
  .ready_downward(ack_user2interface_1_user_1), // raster
  .reset(reset_0)); // don't matter

    wire ap_start_user_1;
    wire [32-1 :0] dout_leaf_interface2user_2_1;
    wire vld_interface2user_2_1;
    wire ack_user2interface_2_1;
    // wire [32-1 :0] dout_leaf_interface2user_2_user;
    // wire vld_interface2user_2_user;
    // wire ack_user2interface_2_user;
    // assign dout_leaf_interface2user_2_user = dout_leaf_interface2user_2;
    // assign vld_interface2user_2_user = vld_interface2user_2;
    // assign ack_user2interface_2 = ack_user2interface_2_user;
    // wire [32-1 :0] dout_leaf_interface2user_1;
    // wire vld_interface2user_1;
    // wire ack_user2interface_1;
    // wire [32-1 :0] dout_leaf_interface2user_1_user;
    // wire vld_interface2user_1_user;
    // wire ack_user2interface_1_user;
    // assign dout_leaf_interface2user_1_user = dout_leaf_interface2user_1;
    // assign vld_interface2user_1_user = vld_interface2user_1;
    // assign ack_user2interface_1 = ack_user2interface_1_user;
    wire [32-1 :0] din_leaf_user2interface_4_1;
    wire vld_user2interface_4_1;
    wire ack_interface2user_4_1;
    wire [32-1 :0] din_leaf_user2interface_4_user_1;
    wire vld_user2interface_4_user_1;
    wire ack_interface2user_4_user_1;
    assign din_leaf_user2interface_4_1 = din_leaf_user2interface_4_user_1;
    assign vld_user2interface_4_1 = vld_user2interface_4_user_1;
    assign ack_interface2user_4_user_1 = ack_interface2user_4_1;
    wire [32-1 :0] din_leaf_user2interface_3_1;
    wire vld_user2interface_3_1;
    wire ack_interface2user_3_1;
    wire [32-1 :0] din_leaf_user2interface_3_user_1;
    wire vld_user2interface_3_user_1;
    wire ack_interface2user_3_user_1;
    assign din_leaf_user2interface_3_1 = din_leaf_user2interface_3_user_1;
    assign vld_user2interface_3_1 = vld_user2interface_3_user_1;
    assign ack_interface2user_3_user_1 = ack_interface2user_3_1;
    wire [32-1 :0] din_leaf_user2interface_2_1;
    wire vld_user2interface_2_1;
    wire ack_interface2user_2_1;
    wire [32-1 :0] din_leaf_user2interface_2_user_1;
    wire vld_user2interface_2_user_1;
    wire ack_interface2user_2_user_1;
    assign din_leaf_user2interface_2_1 = din_leaf_user2interface_2_user_1;
    assign vld_user2interface_2_1 = vld_user2interface_2_user_1;
    assign ack_interface2user_2_user_1 = ack_interface2user_2_1;
    wire [32-1 :0] din_leaf_user2interface_1_1;
    wire vld_user2interface_1_1;
    wire ack_interface2user_1_1;
    wire [32-1 :0] din_leaf_user2interface_1_user_1;
    wire vld_user2interface_1_user_1;
    wire ack_interface2user_1_user_1;
    assign din_leaf_user2interface_1_1 = din_leaf_user2interface_1_user_1;
    assign vld_user2interface_1_1 = vld_user2interface_1_user_1;
    assign ack_interface2user_1_user_1 = ack_interface2user_1_1;
    
    leaf_interface #(
        .PACKET_BITS(49),
        .PAYLOAD_BITS(32),
        .NUM_LEAF_BITS(5),
        .NUM_PORT_BITS(4),
        .NUM_ADDR_BITS(7),
        .NUM_IN_PORTS(2),
        .NUM_OUT_PORTS(4),
        .NUM_BRAM_ADDR_BITS(7),
        .FREESPACE_UPDATE_SIZE(64)
    )leaf_interface_inst_1(
        .clk(clk_1),
        .reset(reset_1),
        .din_leaf_bft2interface(din_leaf_bft2interface_1),
        .dout_leaf_interface2bft(dout_leaf_interface2bft_1),
        .ap_start_user(ap_start_user_1),
        .resend(resend_1),
        .dout_leaf_interface2user(),
        .vld_interface2user(),
        .ack_user2interface(),
        .ack_interface2user({ack_interface2user_4_1,ack_interface2user_3_1,ack_interface2user_2_1,ack_interface2user_1_1}),
        .vld_user2interface({vld_user2interface_4_1,vld_user2interface_3_1,vld_user2interface_2_1,vld_user2interface_1_1}),
        .din_leaf_user2interface({din_leaf_user2interface_4_1,din_leaf_user2interface_3_1,din_leaf_user2interface_2_1,din_leaf_user2interface_1_1}),
        .ap_start(ap_start_1)
    );
    
    rasterization2_m rasterization2_m_inst(
        .ap_clk(clk_1),
        .ap_start(ap_start_user_1),
        .ap_done(),
        .ap_idle(),
        .ap_ready(),
        .Input_2_V_TDATA(dout_leaf_interface2user_2_user_1),
        .Input_2_V_TVALID(vld_interface2user_2_user_1),
        .Input_2_V_TREADY(ack_user2interface_2_user_1),
        .Input_1_V_TDATA(dout_leaf_interface2user_1_user_1),
        .Input_1_V_TVALID(vld_interface2user_1_user_1),
        .Input_1_V_TREADY(ack_user2interface_1_user_1),
        .Output_4_V_TDATA(din_leaf_user2interface_4_user_1),
        .Output_4_V_TVALID(vld_user2interface_4_user_1),
        .Output_4_V_TREADY(ack_interface2user_4_user_1),
        .Output_3_V_TDATA(din_leaf_user2interface_3_user_1),
        .Output_3_V_TVALID(vld_user2interface_3_user_1),
        .Output_3_V_TREADY(ack_interface2user_3_user_1),
        .Output_2_V_TDATA(din_leaf_user2interface_2_user_1),
        .Output_2_V_TVALID(vld_user2interface_2_user_1),
        .Output_2_V_TREADY(ack_interface2user_2_user_1),
        .Output_1_V_TDATA(din_leaf_user2interface_1_user_1),
        .Output_1_V_TVALID(vld_user2interface_1_user_1),
        .Output_1_V_TREADY(ack_interface2user_1_user_1),
        .ap_rst_n(~reset_1)
        );  

endmodule
