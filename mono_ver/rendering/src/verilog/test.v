`timescale 1 ns / 1 ps

module test();


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

reg [1:0] select;
reg clk_200, clk_250, clk_300, clk_350, clk_400; // new clock 
reg rst_n_300;
reg ap_start;
wire ap_done,ap_idle,ap_ready;

data_gen_config i1_1(
    .ap_clk(clk_300),
    .ap_rst_n(rst_n_300),
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
    .ap_clk(clk_300),
    .ap_rst_n(rst_n_300),
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

assign Output_1_V_TDATA = (select == 1) ? Output_1_V_TDATA_1 : Output_1_V_TDATA_2;
assign Output_1_V_TVALID = (select == 1) ? Output_1_V_TVALID_1: Output_1_V_TVALID_2;
assign Output_1_V_TREADY_1 = (select == 1) ? Output_1_V_TREADY : 0;
assign Output_2_V_TREADY_1 = (select == 1) ? Output_2_V_TREADY : 0;
assign Output_1_V_TREADY_2 = (select == 2) ? Output_1_V_TREADY : 0;
assign Output_2_V_TREADY_2 = (select == 2) ? Output_2_V_TREADY : 0;

assign Output_2_V_TDATA = (select == 1) ? Output_2_V_TDATA_1 : Output_2_V_TDATA_2;
assign Output_2_V_TVALID = (select == 1) ? Output_2_V_TVALID_1 : Output_2_V_TVALID_2;


dut  #(.OUTPUT_SIZE(1024)) i2(
    .Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_din(Output_1_V_TDATA), // BFT configuration
    .Loop_VITIS_LOOP_39_1_proc1_U0_v1_buffer_V_write(Output_1_V_TVALID),
    .v1_buffer_V_full_n(Output_1_V_TREADY),
    .Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_din(Output_2_V_TDATA), // data in
    .Loop_VITIS_LOOP_43_3_proc3_U0_v2_buffer_V_write(Output_2_V_TVALID),
    .v2_buffer_V_full_n(Output_2_V_TREADY),
    .v1_buffer_V_dout(dout1), // BFT configuration data readback
    .v1_buffer_V_empty_n(vld_out1),
    .Loop_VITIS_LOOP_40_2_proc2_U0_v1_buffer_V_read(rdy_out1),
    .v2_buffer_V_dout(dout2), // data out
    .v2_buffer_V_empty_n(vld_out2),
    .Loop_VITIS_LOOP_44_4_proc4_U0_v2_buffer_V_read(rdy_out2),

    .clk_200(clk_200),
    .clk_250(clk_250),
    .clk_300(clk_300),
    .clk_350(clk_350),
    .clk_400(clk_400),

    .rst_n_300(rst_n_300),
    .ap_start(ap_start)
);

parameter PERIOD_200 = 10;
parameter PERIOD_250 = 8;
parameter PERIOD_300 = 6.6;
parameter PERIOD_350 = 5.7;
parameter PERIOD_400 = 5;

always #(PERIOD_200/2.0) clk_200 = ~clk_200;
always #(PERIOD_250/2.0) clk_250 = ~clk_250;
always #(PERIOD_300/2.0) clk_300 = ~clk_300;
always #(PERIOD_350/2.0) clk_350 = ~clk_350;
always #(PERIOD_400/2.0) clk_400 = ~clk_400;

integer fd;
initial begin 
    fd = $fopen("monitor.txt","w");
    $fmonitor(fd, "t=%d, %b",$time,dout1);

    ap_start = 0;
    clk_200 = 0;
    clk_250 = 0;
    clk_300 = 0;
    clk_350 = 0;
    clk_400 = 0;

    rst_n_300 = 0;
    select = 1;

    #1000
    rst_n_300 = 1;
    #1000
    ap_start = 1;
    #PERIOD_300
    ap_start = 0;
    
    #5000000
    $fclose(fd);

    $stop();

end

wire [31:0] in_cnt, out_cnt, full_cnt;

counter1 #(
    .CNT_WIDTH(32)
)cnt1(
    .clk(clk_300),
    .reset(~rst_n_300),
    .valid(Output_2_V_TVALID),
    .ready(Output_2_V_TREADY),
    .cnt1(in_cnt)
);

counter1 #(
    .CNT_WIDTH(32)
)cnt2(
    .clk(clk_300),
    .reset(~rst_n_300),
    .valid(vld_out2),
    .ready(rdy_out2),
    .cnt1(out_cnt)
);



counter1 #(
    .CNT_WIDTH(32)
)cnt3(
    .clk(clk_300),
    .reset(~rst_n_300),
    .valid(vld_out1),
    .ready(rdy_out1),
    .cnt1(full_cnt)
);

endmodule
