`timescale 1ns / 1ps
module leaf22(
    input wire clk_200,
    input wire clk_250,
    input wire clk_300,
    input wire clk_350,
    input wire clk_400,
    input wire [49-1 : 0] din_leaf_bft2interface,
    output wire [49-1 : 0] dout_leaf_interface2bft,
    input wire resend,
    input wire reset_400,
    input wire ap_start
    );

    wire [32-1 :0] dout_leaf_interface2user_1;
    wire vld_interface2user_1;
    wire ack_user2interface_1;
    wire [32-1 :0] dout_leaf_interface2user_1_user;
    wire vld_interface2user_1_user;
    wire ack_user2interface_1_user;
    wire [32-1 :0] din_leaf_user2interface_1;
    wire vld_user2interface_1;
    wire ack_interface2user_1;
    wire [256-1 :0] din_leaf_user2interface_1_user;
    wire vld_user2interface_1_user;
    wire ack_interface2user_1_user;
    wire clk_user;
    assign clk_user = clk_200;
    wire reset_ap_start_user;
    
    wire [48:0] dout_leaf_interface2bft_tmp;
    assign dout_leaf_interface2bft = resend ? 0 : dout_leaf_interface2bft_tmp;
    
    wire is_done_mode_user;
    wire [32-1 : 0] full_cnt_Input_1;
    wire [32-1 : 0] empty_cnt_Input_1;
    wire [32-1 : 0] read_cnt_Input_1;
    wire stall_condition_Input_1;

    wire [32-1 : 0] full_cnt_Output_1;
    wire [32-1 : 0] empty_cnt_Output_1;
    wire stall_condition_Output_1;
    
    leaf_interface_22 #(
        .PACKET_BITS(49),
        .PAYLOAD_BITS(32),
        .NUM_LEAF_BITS(5),
        .NUM_PORT_BITS(4),
        .NUM_ADDR_BITS(7),
        .NUM_IN_PORTS(1),
        .NUM_OUT_PORTS(1),
        .NUM_BRAM_ADDR_BITS(7),
        .FREESPACE_UPDATE_SIZE(64),
        .STALL_CNT(1),
        .DATA_USER_IN_TOTAL(32),
        .DATA_USER_OUT_TOTAL(256)
    )leaf_interface_inst(
        .clk(clk_400),
        .clk_user(clk_user),
        .reset(reset_400),
        .din_leaf_bft2interface(din_leaf_bft2interface),
        .dout_leaf_interface2bft(dout_leaf_interface2bft_tmp),
        .ap_start_user(), // not used
        .resend(resend),
        .dout_leaf_interface2user({dout_leaf_interface2user_1_user}),
        .vld_interface2user({vld_interface2user_1_user}),
        .ack_user2interface({ack_user2interface_1_user}),

        .ack_interface2user({ack_interface2user_1_user}),
        .vld_user2interface({vld_user2interface_1_user}),
        .din_leaf_user2interface({din_leaf_user2interface_1_user}),
        .ap_start(ap_start),
        .reset_ap_start_user(reset_ap_start_user),
        .input_port_cluster_stall_condition_others(0),
        .output_port_cluster_stall_condition_others(0),
        .input_port_cluster_stall_condition_self(),
        .output_port_cluster_stall_condition_self()
    );
    
    output_data output_data_inst(
        .ap_clk(clk_user),
        .ap_start(1'b1), // this should be fine
        .ap_done(),
        .ap_idle(),
        .ap_ready(),
        .Input_1_TDATA(dout_leaf_interface2user_1_user),
        .Input_1_TVALID(vld_interface2user_1_user),
        .Input_1_TREADY(ack_user2interface_1_user),

        .Output_1_TDATA(din_leaf_user2interface_1_user),
        .Output_1_TVALID(vld_user2interface_1_user),
        .Output_1_TREADY(ack_interface2user_1_user),
        .ap_rst_n(~reset_ap_start_user)
        );  
    
endmodule
