`timescale 1 ns / 1 ps

module test();

reg ap_clk;
reg ap_rst_n;
reg ap_start;

wire [63:0]  Output_1_V_TDATA, Output_1_V_TDATA_1, Output_1_V_TDATA_2;
wire         Output_1_V_TVALID, Output_1_V_TVALID_1, Output_1_V_TVALID_2;
wire         Output_1_V_TREADY, Output_1_V_TREADY_1, Output_1_V_TREADY_2;
wire [511:0] Output_2_V_TDATA, Output_2_V_TDATA_1, Output_2_V_TDATA_2;
wire         Output_2_V_TVALID, Output_2_V_TVALID_1, Output_2_V_TVALID_2;
wire         Output_2_V_TREADY, Output_2_V_TREADY_1, Output_2_V_TREADY_2;

wire [63:0]  dout1;
wire         vld_out1;
wire         rdy_out1;

wire [511:0] dout2;
wire         vld_out2;
wire         rdy_out2;

assign rdy_out1 = 1'b1;
assign rdy_out2 = 1'b1;

wire ap_done;
reg [1:0] select;


reg clk_user; // new clock 
reg rst_n_user;


data_gen_config i1_1(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Output_1_TDATA(Output_1_V_TDATA_1), // BFT configuration
    .Output_1_TVALID(Output_1_V_TVALID_1),
    .Output_1_TREADY(Output_1_V_TREADY_1),
    .Output_2_TDATA(Output_2_V_TDATA_1), // data in
    .Output_2_TVALID(Output_2_V_TVALID_1),
    .Output_2_TREADY(Output_2_V_TREADY_1)
);

data_gen_config i1_2(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Output_1_TDATA(Output_1_V_TDATA_2), // BFT configuration
    .Output_1_TVALID(Output_1_V_TVALID_2),
    .Output_1_TREADY(Output_1_V_TREADY_2),
    .Output_2_TDATA(Output_2_V_TDATA_2), // data in
    .Output_2_TVALID(Output_2_V_TVALID_2),
    .Output_2_TREADY(Output_2_V_TREADY_2)
);

wire [63:0]  is_done_config_data;
wire         is_done_valid;

assign Output_1_V_TDATA = (select == 1) ? Output_1_V_TDATA_1 : Output_1_V_TDATA_2;
assign Output_1_V_TVALID = (select == 1) ? Output_1_V_TVALID_1: Output_1_V_TVALID_2;
assign Output_1_V_TREADY_1 = (select == 1) ? Output_1_V_TREADY : 0;
assign Output_2_V_TREADY_1 = (select == 1) ? Output_2_V_TREADY : 0;
assign Output_1_V_TREADY_2 = (select == 2) ? Output_1_V_TREADY : 0;
assign Output_2_V_TREADY_2 = (select == 2) ? Output_2_V_TREADY : 0;

assign Output_2_V_TDATA = (select == 1) ? Output_2_V_TDATA_1 : Output_2_V_TDATA_2;
assign Output_2_V_TVALID = (select == 1) ? Output_2_V_TVALID_1 : Output_2_V_TVALID_2;

wire [63:0] v3_buffer_V_dout;
wire v3_buffer_V_empty_n, v3_buffer_V_read;
reg full_cnt_ready;

dut  i2(
    .Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_din(Output_1_V_TDATA), // BFT configuration
    .Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_write(Output_1_V_TVALID),
    .v1_buffer_V_full_n(Output_1_V_TREADY),
    
    .Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_din(Output_2_V_TDATA), // data in
    .Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_write(Output_2_V_TVALID),
    .v2_buffer_V_full_n(Output_2_V_TREADY),

    .v1_buffer_V_dout(dout1),
    .v1_buffer_V_empty_n(vld_out1),
    .Loop_VITIS_LOOP_40_2_proc2_U0_v1_buffer_V_read(rdy_out1),

    .v2_buffer_V_dout(dout2), // data out
    .v2_buffer_V_empty_n(vld_out2),
    .Loop_VITIS_LOOP_44_4_proc4_U0_v2_buffer_V_read(rdy_out2),

    .v3_buffer_V_dout(v3_buffer_V_dout), // winner signal
    .v3_buffer_V_empty_n(v3_buffer_V_empty_n),
    .v3_buffer_V_read(full_cnt_ready), 

    .ap_rst_n(ap_rst_n),
    .ap_clk(ap_clk),
    .ap_start(ap_start),
    .clk_user(clk_user),
    .rst_n_user(rst_n_user)
);

parameter PERIOD_BFT = 5;
parameter PERIOD_USER_0 = 10;
parameter PERIOD_USER = 8;

always #(PERIOD_BFT/2.0) ap_clk = ~ap_clk;
always #(PERIOD_USER/2.0) clk_user = ~clk_user;

integer fd;

initial begin 
    fd = $fopen("monitor.txt","w");
    $fmonitor(fd, "t=%d, %b",$time,v3_buffer_V_dout);

    ap_start = 0;
    ap_clk = 0;
    ap_rst_n = 0;
    rst_n_user = 0;
    clk_user = 0;
    full_cnt_ready = 1;
    select = 1;

    #1002
    ap_rst_n = 1;
    rst_n_user = 1;
    #PERIOD_BFT
//    ap_rst_n = 1;
//    rst_n_user = 1;

    #1007
    ap_start = 1;
    #PERIOD_BFT
    ap_start = 0;

    #4008200
    $fclose(fd);

    
//    #2308200
////    full_cnt_ready = 0;
////    #10
////    full_cnt_ready = 1;
////    #40
////    full_cnt_ready = 0;
////    #10
////    full_cnt_ready = 1;
////    #10
////    full_cnt_ready = 0;
////    #250    
////    full_cnt_ready = 1;

//    #1500000

//    select = 2;
//    #10
//    ap_start = 1;
//    #PERIOD_BFT
//    ap_start = 0;

//    #4000000


    // force i2.config_parser_inst.input3_TDATA = 1;
    // force i2.config_parser_inst.input3_TVALID = 1;
    // #10
    // force i2.config_parser_inst.input3_TDATA = 0;
    // force i2.config_parser_inst.input3_TVALID = 0;
    // release i2.config_parser_inst.input3_TDATA;
    // release i2.config_parser_inst.input3_TVALID;

//    #2500000 // finish 1st kernel
//    force i2.is_done = 1;
//    #10
//    force i2.is_done = 0;
//    release i2.is_done;

    // v(1b), leaf(5b), port(4b), magic code(7b), self port(4b), dst leaf(5b), dst port(4b), bram addr(7b), free space(7b), dummy(5b)
//    force i2.bft_inst.gen_nw32.interface_2.interface_pe = {1'b1, 5'd2, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_3.interface_pe = {1'b1, 5'd3, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_4.interface_pe = {1'b1, 5'd4, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_6.interface_pe = {1'b1, 5'd6, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_16.interface_pe = {1'b1, 5'd16, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_18.interface_pe = {1'b1, 5'd18, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    force i2.bft_inst.gen_nw32.interface_20.interface_pe = {1'b1, 5'd20, 4'd0, 7'd4, 4'd9, 5'd1, 4'd2, 7'd0, 7'd127, 5'd0};
//    #10
//    force i2.bft_inst.gen_nw32.interface_2.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_3.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_4.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_6.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_16.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_18.interface_pe = 0;
//    force i2.bft_inst.gen_nw32.interface_20.interface_pe = 0;
//    #10
//    release i2.bft_inst.gen_nw32.interface_2.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_3.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_4.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_6.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_16.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_18.interface_pe;
//    release i2.bft_inst.gen_nw32.interface_20.interface_pe;

    $stop();

end

wire [31:0] in_cnt, out_cnt, full_cnt;

counter1 #(
    .CNT_WIDTH(32)
)cnt1(
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .valid(Output_2_V_TVALID),
    .ready(Output_2_V_TREADY),
    .cnt1(in_cnt)
);

counter1 #(
    .CNT_WIDTH(32)
)cnt2(
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .valid(vld_out2),
    .ready(rdy_out2),
    .cnt1(out_cnt)
);

counter1 #(
    .CNT_WIDTH(32)
)cnt3(
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .valid(v3_buffer_V_empty_n),
    .ready(full_cnt_ready),
    .cnt1(full_cnt)
);


endmodule
