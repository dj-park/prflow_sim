`timescale 1ns / 1ps
module page_4(
    input wire clk,
    input wire [49-1 : 0] din_leaf_bft2interface,
    output wire [49-1 : 0] dout_leaf_interface2bft,
    input wire resend,
    input wire reset,
    input wire ap_start
    );

    wire ap_start_user;
    wire [32-1 :0] dout_leaf_interface2user_2;
    wire vld_interface2user_2;
    wire ack_user2interface_2;
    wire [32-1 :0] dout_leaf_interface2user_2_user;
    wire vld_interface2user_2_user;
    wire ack_user2interface_2_user;
    assign dout_leaf_interface2user_2_user = dout_leaf_interface2user_2;
    assign vld_interface2user_2_user = vld_interface2user_2;
    assign ack_user2interface_2 = ack_user2interface_2_user;
    wire [32-1 :0] dout_leaf_interface2user_1;
    wire vld_interface2user_1;
    wire ack_user2interface_1;
    wire [32-1 :0] dout_leaf_interface2user_1_user;
    wire vld_interface2user_1_user;
    wire ack_user2interface_1_user;
    assign dout_leaf_interface2user_1_user = dout_leaf_interface2user_1;
    assign vld_interface2user_1_user = vld_interface2user_1;
    assign ack_user2interface_1 = ack_user2interface_1_user;
    wire [32-1 :0] din_leaf_user2interface_1;
    wire vld_user2interface_1;
    wire ack_interface2user_1;
    wire [32-1 :0] din_leaf_user2interface_1_user;
    wire vld_user2interface_1_user;
    wire ack_interface2user_1_user;
    assign din_leaf_user2interface_1 = din_leaf_user2interface_1_user;
    assign vld_user2interface_1 = vld_user2interface_1_user;
    assign ack_interface2user_1_user = ack_interface2user_1;
    
    leaf_interface #(
        .PACKET_BITS(49),
        .PAYLOAD_BITS(32),
        .NUM_LEAF_BITS(5),
        .NUM_PORT_BITS(4),
        .NUM_ADDR_BITS(7),
        .NUM_IN_PORTS(2),
        .NUM_OUT_PORTS(1),
        .NUM_BRAM_ADDR_BITS(7),
        .FREESPACE_UPDATE_SIZE(64)
    )leaf_interface_inst(
        .clk(clk),
        .reset(reset),
        .din_leaf_bft2interface(din_leaf_bft2interface),
        .dout_leaf_interface2bft(dout_leaf_interface2bft),
        .ap_start_user(ap_start_user),
        .resend(resend),
        .dout_leaf_interface2user({dout_leaf_interface2user_2,dout_leaf_interface2user_1}),
        .vld_interface2user({vld_interface2user_2,vld_interface2user_1}),
        .ack_user2interface({ack_user2interface_2,ack_user2interface_1}),
        .ack_interface2user({ack_interface2user_1}),
        .vld_user2interface({vld_user2interface_1}),
        .din_leaf_user2interface({din_leaf_user2interface_1}),
        .ap_start(ap_start)
    );
    
    zculling_bot zculling_bot_inst(
        .ap_clk(clk),
        .ap_start(ap_start_user),
        .ap_done(),
        .ap_idle(),
        .ap_ready(),
        .Input_2_V_TDATA(dout_leaf_interface2user_2_user),
        .Input_2_V_TVALID(vld_interface2user_2_user),
        .Input_2_V_TREADY(ack_user2interface_2_user),
        .Input_1_V_TDATA(dout_leaf_interface2user_1_user),
        .Input_1_V_TVALID(vld_interface2user_1_user),
        .Input_1_V_TREADY(ack_user2interface_1_user),
        .Output_1_V_TDATA(din_leaf_user2interface_1_user),
        .Output_1_V_TVALID(vld_user2interface_1_user),
        .Output_1_V_TREADY(ack_interface2user_1_user),
        .ap_rst_n(~reset)
        );  

    
endmodule
