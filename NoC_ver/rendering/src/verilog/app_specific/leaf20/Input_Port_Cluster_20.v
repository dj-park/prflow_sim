`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2018 04:43:15 PM
// Design Name: 
// Module Name: Input_Port_Cluster
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Input_Port_Cluster_20 # (
    parameter PACKET_BITS = 97,
    parameter NUM_LEAF_BITS = 6,
    parameter NUM_PORT_BITS = 4,
    parameter NUM_ADDR_BITS = 7,
    parameter PAYLOAD_BITS = 64, 
    parameter NUM_IN_PORTS = 7, 
    parameter NUM_OUT_PORTS = 7,
    parameter NUM_BRAM_ADDR_BITS = 7,
    parameter FREESPACE_UPDATE_SIZE = 64,
    parameter DATA_USER_IN_TOTAL = 32
    )(
    input clk,
    input clk_user,
    input reset,
    input reset_user,    
    
    //internal interface
    output [NUM_IN_PORTS-1:0] freespace_update,
    output [PACKET_BITS*NUM_IN_PORTS-1:0] packet_from_input_ports,
    input [PACKET_BITS-1:0] stream_in,
    input [(NUM_LEAF_BITS+NUM_PORT_BITS)*NUM_IN_PORTS-1:0] in_control_reg,
    
    //user interface
    output [DATA_USER_IN_TOTAL-1:0] dout2user,
    output [NUM_IN_PORTS-1:0] vld2user,
    input [NUM_IN_PORTS-1:0] ack_user2b_in,

    input is_done_mode, // clk(_bft) domain
    input is_done_mode_user, // clk_user domain
    output [PAYLOAD_BITS*NUM_IN_PORTS-1:0] input_port_full_cnt,
    output [PAYLOAD_BITS*NUM_IN_PORTS-1:0] input_port_empty_cnt,
    output [PAYLOAD_BITS*NUM_IN_PORTS-1:0] input_port_read_cnt,
    output input_port_cluster_stall_condition
    );

    wire [NUM_IN_PORTS-1:0] input_port_stall_condition;
    assign input_port_cluster_stall_condition = |input_port_stall_condition;
    
    // genvar gv_i;
    // generate
    // for(gv_i = 0; gv_i < NUM_IN_PORTS; gv_i = gv_i + 1) begin: input_port_inst
    //     Input_Port #(
    //         .PACKET_BITS(PACKET_BITS),
    //         .NUM_LEAF_BITS(NUM_LEAF_BITS),
    //         .NUM_PORT_BITS(NUM_PORT_BITS),
    //         .NUM_ADDR_BITS(NUM_ADDR_BITS),
    //         .PAYLOAD_BITS(PAYLOAD_BITS),
    //         .NUM_IN_PORTS(NUM_IN_PORTS),
    //         .NUM_OUT_PORTS(NUM_OUT_PORTS),
    //         .NUM_BRAM_ADDR_BITS(NUM_BRAM_ADDR_BITS),
    //         .PORT_No(gv_i+2),
    //         .FREESPACE_UPDATE_SIZE(FREESPACE_UPDATE_SIZE)
    //     )IPort(
    //         .clk(clk),
    //         .clk_user(clk_user),
    //         .reset(reset),
    //         .reset_user(reset_user),
    //         .freespace_update(freespace_update[gv_i]),
    //         .packet_from_input_port(packet_from_input_ports[PACKET_BITS*(gv_i+1)-1:PACKET_BITS*gv_i]),
    //         .din_leaf_bft2interface(stream_in),
    //         .src_leaf(in_control_reg[(NUM_LEAF_BITS+NUM_PORT_BITS)*(gv_i+1)-1:(NUM_LEAF_BITS+NUM_PORT_BITS)*gv_i+NUM_PORT_BITS]),
    //         .src_port(in_control_reg[(NUM_LEAF_BITS+NUM_PORT_BITS)*gv_i+NUM_PORT_BITS-1:(NUM_LEAF_BITS+NUM_PORT_BITS)*gv_i]),
    //         .dout2user(dout2user[PAYLOAD_BITS*(gv_i+1)-1:PAYLOAD_BITS*gv_i]),
    //         .vld2user(vld2user[gv_i]),
    //         .ack_user2b_in(ack_user2b_in[gv_i])
    //         // .is_done_mode(is_done_mode),
    //         // .is_done_mode_user(is_done_mode_user),
    //         // .input_port_full_cnt(input_port_full_cnt[PAYLOAD_BITS*(gv_i+1)-1:PAYLOAD_BITS*gv_i]),
    //         // .input_port_empty_cnt(input_port_empty_cnt[PAYLOAD_BITS*(gv_i+1)-1:PAYLOAD_BITS*gv_i]),
    //         // .input_port_read_cnt(input_port_read_cnt[PAYLOAD_BITS*(gv_i+1)-1:PAYLOAD_BITS*gv_i]),
    //         // .input_port_stall_condition(input_port_stall_condition[gv_i])
    //     );
    // end
    // endgenerate

    Input_Port #(
        .PACKET_BITS(PACKET_BITS),
        .NUM_LEAF_BITS(NUM_LEAF_BITS),
        .NUM_PORT_BITS(NUM_PORT_BITS),
        .NUM_ADDR_BITS(NUM_ADDR_BITS),
        .PAYLOAD_BITS(PAYLOAD_BITS),
        .NUM_IN_PORTS(NUM_IN_PORTS),
        .NUM_OUT_PORTS(NUM_OUT_PORTS),
        .NUM_BRAM_ADDR_BITS(NUM_BRAM_ADDR_BITS),
        .PORT_No(0+2),
        .FREESPACE_UPDATE_SIZE(FREESPACE_UPDATE_SIZE),
        .DATA_USER_IN(32)  // OPERATOR SPECIFIC!
    )IPort_0(
        .clk(clk),
        .clk_user(clk_user),
        .reset(reset),
        .reset_user(reset_user),

        .freespace_update(freespace_update[0]),
        .packet_from_input_port(packet_from_input_ports[PACKET_BITS*(0+1)-1:PACKET_BITS*0]),
        .din_leaf_bft2interface(stream_in),
        .src_leaf(in_control_reg[(NUM_LEAF_BITS+NUM_PORT_BITS)*(0+1)-1:(NUM_LEAF_BITS+NUM_PORT_BITS)*0+NUM_PORT_BITS]),
        .src_port(in_control_reg[(NUM_LEAF_BITS+NUM_PORT_BITS)*0+NUM_PORT_BITS-1:(NUM_LEAF_BITS+NUM_PORT_BITS)*0]),
        
        .dout2user(dout2user[31:0]), // OPERATOR SPECIFIC!
        .vld2user(vld2user[0]),
        .ack_user2b_in(ack_user2b_in[0]),

        .is_done_mode(is_done_mode),
        .is_done_mode_user(is_done_mode_user),
        .input_port_full_cnt(input_port_full_cnt[PAYLOAD_BITS*(0+1)-1:PAYLOAD_BITS*0]),
        .input_port_empty_cnt(input_port_empty_cnt[PAYLOAD_BITS*(0+1)-1:PAYLOAD_BITS*0]),
        .input_port_read_cnt(input_port_read_cnt[PAYLOAD_BITS*(0+1)-1:PAYLOAD_BITS*0]),
        .input_port_stall_condition(input_port_stall_condition[0])
    );

        
    
    
    
endmodule
