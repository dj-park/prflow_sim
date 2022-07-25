`timescale 1 ns / 1 ps

module test();

reg ap_clk;
reg ap_rst_n;
reg ap_start;

wire [63:0]  Output_1_V_TDATA, Output_1_V_TDATA_0, Output_1_V_TDATA_1, Output_1_V_TDATA_2;
wire         Output_1_V_TVALID, Output_1_V_TVALID_0, Output_1_V_TVALID_1, Output_1_V_TVALID_2;
wire         Output_1_V_TREADY, Output_1_V_TREADY_0, Output_1_V_TREADY_1, Output_1_V_TREADY_2;
wire [511:0] Output_2_V_TDATA, Output_2_V_TDATA_0, Output_2_V_TDATA_1, Output_2_V_TDATA_2;
wire         Output_2_V_TVALID, Output_2_V_TVALID_0, Output_2_V_TVALID_1, Output_2_V_TVALID_2;
wire         Output_2_V_TREADY, Output_2_V_TREADY_0, Output_2_V_TREADY_1, Output_2_V_TREADY_2;

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


data_gen_continue_config i1_0(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Output_1_V_TDATA(Output_1_V_TDATA_0), // BFT configuration
    .Output_1_V_TVALID(Output_1_V_TVALID_0),
    .Output_1_V_TREADY(Output_1_V_TREADY_0),
    .Output_2_V_TDATA(Output_2_V_TDATA_0), // data in
    .Output_2_V_TVALID(Output_2_V_TVALID_0),
    .Output_2_V_TREADY(Output_2_V_TREADY_0)
);

data_gen_config i1_1(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Output_1_V_TDATA(Output_1_V_TDATA_1), // BFT configuration
    .Output_1_V_TVALID(Output_1_V_TVALID_1),
    .Output_1_V_TREADY(Output_1_V_TREADY_1),
    .Output_2_V_TDATA(Output_2_V_TDATA_1), // data in
    .Output_2_V_TVALID(Output_2_V_TVALID_1),
    .Output_2_V_TREADY(Output_2_V_TREADY_1)
);


 data_gen_reverse_config i1_2(
     .ap_clk(ap_clk),
     .ap_rst_n(ap_rst_n),
     .ap_start(ap_start),
     .ap_done(ap_done),
     .ap_idle(ap_idle),
     .ap_ready(ap_ready),
     .Output_1_V_TDATA(Output_1_V_TDATA_2), // BFT configuration
     .Output_1_V_TVALID(Output_1_V_TVALID_2),
     .Output_1_V_TREADY(Output_1_V_TREADY_2),
     .Output_2_V_TDATA(Output_2_V_TDATA_2), // data in
     .Output_2_V_TVALID(Output_2_V_TVALID_2),
     .Output_2_V_TREADY(Output_2_V_TREADY_2)
 );


assign Output_1_V_TDATA = (select == 0) ? Output_1_V_TDATA_0 : ((select == 1) ? Output_1_V_TDATA_1 : Output_1_V_TDATA_2);
assign Output_1_V_TVALID = (select == 0) ? Output_1_V_TVALID_0 : ((select == 1) ? Output_1_V_TVALID_1 : Output_1_V_TVALID_2);
assign Output_1_V_TREADY_0 = (select == 0) ? Output_1_V_TREADY : 0;
assign Output_1_V_TREADY_1 = (select == 1) ? Output_1_V_TREADY : 0;
assign Output_1_V_TREADY_2 = (select == 2) ? Output_1_V_TREADY : 0;

assign Output_2_V_TREADY_0 = (select == 0) ? Output_2_V_TREADY : 0;
assign Output_2_V_TREADY_1 = (select == 1) ? Output_2_V_TREADY : 0;
assign Output_2_V_TREADY_2 = (select == 2) ? Output_2_V_TREADY : 0;

//assign Output_1_V_TREADY = (select == 0) ? Output_1_V_TREADY_0 : Output_1_V_TREADY_1;
assign Output_2_V_TDATA = (select == 0) ? Output_2_V_TDATA_0 : ((select == 1) ? Output_2_V_TDATA_1 : Output_2_V_TDATA_2);
assign Output_2_V_TVALID = (select == 0) ? Output_2_V_TVALID_0 : ((select == 1) ? Output_2_V_TVALID_1 : Output_2_V_TVALID_2);
//assign Output_2_V_TREADY = (select == 0) ? Output_2_V_TREADY_0 : Output_2_V_TREADY_1;

wire [31:0] v3_buffer_V_dout;
wire v3_buffer_V_empty_n, v3_buffer_V_read;

dut i2(
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
    .v3_buffer_V_dout(v3_buffer_V_dout), // winner signal
    .v3_buffer_V_empty_n(v3_buffer_V_empty_n),
    .v3_buffer_V_read(v3_buffer_V_read),
    .ap_rst_n(ap_rst_n),
    .ap_clk(ap_clk),
    .ap_start(ap_start)
);

always #5 ap_clk = ~ap_clk;

initial begin 

    ap_start = 0;
    ap_clk = 0;
    ap_rst_n = 0;
    #1000
    ap_rst_n = 1;
    select = 1;
    #1007
    ap_start = 1;
    #10
    ap_start = 0;
    
    #2500000 // finish 1st kernel

//    select = 1;
//    #10
//    ap_start = 1;
//    #10
//    ap_start = 0;

//   #2500000 // finish 2nd kernel
//    select = 0; // same as 2nd kernel's BFT configuration
//    #10
//    ap_start = 1;
//    #10
//    ap_start = 0;




//    ap_rst_n = 0;
//    #1000
//    ap_rst_n = 1;
//    #1000


//    #25000 // finish 2nd kernel    
//    select = 1;
//    #10
//    ap_start = 1;
//    #10
//    ap_start = 0;
//    #25000 // finish 3rd kernel    
//    select = 2;
//    #10
//    ap_start = 1;
//    #10
//    ap_start = 0;

    #1_000_000_000
    $stop();

end

wire [31:0] in_cnt, out_cnt;

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



endmodule
