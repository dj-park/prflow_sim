`timescale 1ns / 1ps

module sender #(
    parameter DATA_WIDTH = 32,
    parameter NUM_DATA = 50,
    parameter DATA_RATE = 3)(
    input clk,
    input reset,
    output reg [DATA_WIDTH-1:0] data,
    output valid,
    input ready);

    assign valid = ((num_data_cnt < NUM_DATA) && (counter == DATA_RATE-1)) ? 1: 0;
    reg [31:0] num_data_cnt;     
    reg [31:0] counter;
    
    always@(posedge clk) begin
        if(reset) begin
            data <= 0;
            num_data_cnt <= 0;
            counter <= 0;
        end
        else begin
            if (valid && ready) begin
                if (counter == DATA_RATE-1) begin // send
                    num_data_cnt <= num_data_cnt + 1;
                    data <= data + 1;
                    counter <= 0;
                end
                else begin
                    counter <= counter + 1;
                end
            end
            else begin
                if (counter == DATA_RATE-1) begin
                    counter <= counter;
                end
                else begin
                    counter <= counter + 1;
                end
            end
        end
    end
endmodule

module receiver #(
    parameter DATA_WIDTH = 32,
    parameter NUM_DATA = 50,
    parameter DATA_RATE = 3)(
    input clk,
    input reset,
    input [DATA_WIDTH-1:0] data,
    input valid,
    output ready);

    assign ready = ((num_data_cnt < NUM_DATA) && (counter == DATA_RATE-1)) ? 1: 0;
    reg [31:0] num_data_cnt;     
    reg [31:0] counter;
    
    always@(posedge clk) begin
        if(reset) begin
            num_data_cnt <= 0;
            counter <= 0;
        end
        else begin
            if (valid && ready) begin
                if (counter == DATA_RATE-1) begin // receive
                    num_data_cnt <= num_data_cnt + 1;
                    counter <= 0;
                end
                else begin
                    counter <= counter + 1;
                end
            end
            else begin
                if (counter == DATA_RATE-1) begin
                    counter <= counter;
                end
                else begin
                    counter <= counter + 1;
                end
            end
        end
    end
endmodule


module fifo_hs #(
    parameter WRITE_DATA_WIDTH = 32,
    parameter READ_DATA_WIDTH = 32,
    parameter NUM_BRAM_ADDR_BITS = 7)(
    input clk_a,
    input reset_a,
    input [WRITE_DATA_WIDTH-1:0] d_a,
    input vld_a,
    output rdy_a,

    input clk_b,
    input reset_b,
    output [READ_DATA_WIDTH-1:0] d_b,
    output reg vld_b,
    input rdy_b);

    reg wr_en, rd_en;
    wire full, empty;
    wire wr_rst_busy, rd_rst_busy;

    // wr_en
    always@(*) begin
        if(full) wr_en = 0;
        else begin
            if(vld_a) wr_en = 1;
            else wr_en = 0;              
        end
    end
    assign rdy_a = !full && !wr_rst_busy;
    
    xpm_fifo_async # (
      .FIFO_MEMORY_TYPE          ("block"),           //string; "auto", "block", or "distributed";
      .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
      .RELATED_CLOCKS            (0),                // 250MHz and 350MHz are related clock?
      // .FIFO_WRITE_DEPTH          (FIFO_DEPTH),             //positive integer
      .FIFO_WRITE_DEPTH          (2**NUM_BRAM_ADDR_BITS),             //positive integer
      .WRITE_DATA_WIDTH          (WRITE_DATA_WIDTH),               //positive integer
      .WR_DATA_COUNT_WIDTH       (NUM_BRAM_ADDR_BITS),               //positive integer
      .PROG_FULL_THRESH          (10),               //positive integer
      .FULL_RESET_VALUE          (0),                //positive integer; 0 or 1
      .READ_MODE                 ("std"),            //string; "std" or "fwft";
      .FIFO_READ_LATENCY         (1),                //positive integer;
      .READ_DATA_WIDTH           (READ_DATA_WIDTH),               //positive integer
      .RD_DATA_COUNT_WIDTH       (NUM_BRAM_ADDR_BITS),               //positive integer
      .PROG_EMPTY_THRESH         (10),               //positive integer
      .DOUT_RESET_VALUE          ("0"),              //string
      .CDC_SYNC_STAGES           (2),                //positive integer
      .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;
    ) xpm_fifo_async_0_inst (
      .rst              (reset_a),
      .wr_clk           (clk_a),
      .wr_en            (wr_en),
      .din              (d_a),
      .full             (full),
      .overflow         (), // not used
      .wr_rst_busy      (wr_rst_busy), // not used
      .rd_clk           (clk_b),
      .rd_en            (rd_en),
      .dout             (d_b),
      .empty            (empty),
      .underflow        (), // not used
      .rd_rst_busy      (rd_rst_busy), // not used
      .prog_full        (), // not used
      .wr_data_count    (), // not used
      .prog_empty       (), // not used
      .rd_data_count    (), // not used
      .sleep            (1'b0),
      .injectsbiterr    (1'b0),
      .injectdbiterr    (1'b0),
      .sbiterr          (),
      .dbiterr          ()
    );

    // rd_en
    always@(*) begin
        if(empty) rd_en = 0;
        else begin
            if(rdy_b) begin
                rd_en = 1;
            end else begin
                rd_en = ~vld_b;
            end
        end
    end
        
    // vld_b
    always@(posedge clk_b) begin 
        if(reset_b) vld_b <= 0;
        else begin
            if(rd_en) vld_b <= 1;
            else begin
                if(vld_b) begin
                    if(rdy_b) begin
                        vld_b <= 0;
                    end 
                    else begin
                        vld_b <= 1;
                    end
                end 
                else begin
                    vld_b <= 0;
                end
            end
        end
    end
endmodule


// sender -> nth_fifo -> async_fifo -> async_fifo -> nth_fifo -> receiver
// Check the clk_0 and clk_1.
// This setup demonstrates that why NoC bandwidth bottleneck was detected because of empty counter difference
// even the USER_DATA_WIDTH is 32b.
module test();
//    parameter DATA_WIDTH = 32;
    parameter USER_DATA_WIDTH = 32;
    parameter NUM_BRAM_ADDR_BITS = 7;
    parameter SND_DATA_RATE = 1;
    parameter RCV_DATA_RATE = 1;
    parameter NUM_DATA = 2000;
    
    reg clk_0, clk_1, reset_0, reset_1, clk_NoC, reset_NoC;

    wire [USER_DATA_WIDTH-1:0] data_0_a;
    wire [31:0] data_0_b;
    wire vld_0_a, vld_0_b, rdy_0_a, rdy_0_b;
    wire [31:0] full_cnt_0, empty_cnt_0, read_cnt_0;
    wire stall_condition_0;

    reg is_done_mode_user;
    
    always #(5/2.0) clk_0 = ~clk_0;
    always #(2.5/2.0) clk_1 = ~clk_1;
    always #(2.5/2.0) clk_NoC = ~clk_NoC;
    

    sender #(
      .DATA_WIDTH(USER_DATA_WIDTH),
      .NUM_DATA(NUM_DATA),
      .DATA_RATE(SND_DATA_RATE)
    ) sender_inst(
      .clk(clk_0),
      .reset(reset_0),
      .data(data_0_a),
      .valid(vld_0_a),
      .ready(rdy_0_a)
    );

    nth_fifo#(
      .PAYLOAD_BITS(32),
      .IN_WIDTH(USER_DATA_WIDTH),
      .OUT_WIDTH(32),
      .INPUT_PORT(0)
    ) sender_fifo_inst(
      .clk(clk_0),
      .reset(reset_0),
      .d_a(data_0_a),
      .vld_a(vld_0_a),
      .rdy_a(rdy_0_a),
      
      .d_b(data_0_b),
      .vld_b(vld_0_b),
      .rdy_b(rdy_0_b),

      .is_done_mode_user(is_done_mode_user),
      .full_cnt(full_cnt_0),
      .empty_cnt(empty_cnt_0),
      .read_cnt(read_cnt_0),
      .stall_condition(stall_condition_0)
    );

    // -------------------------------------------------------------

    wire [31:0] data_NoC;
    wire vld_NoC, rdy_NoC;

    fifo_hs#(
      .WRITE_DATA_WIDTH(32),
      .READ_DATA_WIDTH(32),
      .NUM_BRAM_ADDR_BITS(7)
    ) fifo_0_inst(
      .clk_a(clk_0),
      .reset_a(reset_0),
      .d_a(data_0_b),
      .vld_a(vld_0_b),
      .rdy_a(rdy_0_b),

      .clk_b(clk_NoC),
      .reset_b(reset_NoC),
      .d_b(data_NoC),
      .vld_b(vld_NoC),
      .rdy_b(rdy_NoC));


    wire [31:0] data_1_a;
    wire [USER_DATA_WIDTH-1:0] data_1_b;
    wire vld_1_a, vld_1_b, rdy_1_a, rdy_1_b;
    wire [31:0] full_cnt_1, empty_cnt_1, read_cnt_1;
    wire stall_condition_1;

    fifo_hs#(
      .WRITE_DATA_WIDTH(32),
      .READ_DATA_WIDTH(32),
      .NUM_BRAM_ADDR_BITS(7)
    ) fifo_1_inst(
      .clk_a(clk_NoC),
      .reset_a(reset_NoC),
      .d_a(data_NoC),
      .vld_a(vld_NoC),
      .rdy_a(rdy_NoC),

      .clk_b(clk_1),
      .reset_b(reset_1),
      .d_b(data_1_a),
      .vld_b(vld_1_a),
      .rdy_b(rdy_1_a));


    // -------------------------------------------------------------

    nth_fifo#(
      .PAYLOAD_BITS(32),
      .IN_WIDTH(32),
      .OUT_WIDTH(USER_DATA_WIDTH),
      .INPUT_PORT(1)
    ) receiver_fifo_inst(
      .clk(clk_1),
      .reset(reset_1),
      .d_a(data_1_a),
      .vld_a(vld_1_a),
      .rdy_a(rdy_1_a),

      .d_b(data_1_b),
      .vld_b(vld_1_b),
      .rdy_b(rdy_1_b),

      .is_done_mode_user(is_done_mode_user),
      .full_cnt(full_cnt_1),
      .empty_cnt(empty_cnt_1),
      .read_cnt(read_cnt_1),
      .stall_condition(stall_condition_1)
    );
    
    receiver #(
      .DATA_WIDTH(USER_DATA_WIDTH),
      .NUM_DATA(NUM_DATA),
      .DATA_RATE(RCV_DATA_RATE)
    ) receiver_inst(
      .clk(clk_1),
      .reset(reset_1),
      .data(data_1_b),
      .valid(vld_1_b),
      .ready(rdy_1_b)
    );

    initial begin
        clk_0 = 0;
        clk_1 = 0;
        reset_0 = 0;
        reset_1 = 0;
        clk_NoC = 0; 
        reset_NoC = 0;
        #200
        reset_0 = 1;
        reset_1 = 1;
        reset_NoC = 1;
        #200
        is_done_mode_user = 0;
        reset_0 = 0;
        reset_1 = 0;
        reset_NoC = 0;
        #100000
        $stop();
    
    end


endmodule





//    reg wr_en_1, rd_en_1;
//    wire full_1, empty_1, wr_rst_busy_1, rd_rst_busy_1;
//    wire rdy_fifo_1;
//    // wr_en
//    always@(*) begin
//        if(full_1) wr_en_1 = 0;
//        else begin
//            if(vld_0_b) wr_en_1 = 1;
//            else wr_en_1 = 0;              
//        end
//    end
//    assign rdy_fifo_1 = !full_1 && !wr_rst_busy;

//    wire [FIFO_DATA_WIDTH-1:0] fifo_data_in_0, fifo_data_out_0;
//    wire [FIFO_DATA_WIDTH-1:0] fifo_data_in_1, fifo_data_out_1;    
    
//    xpm_fifo_async # (
//      .FIFO_MEMORY_TYPE          ("block"),           //string; "auto", "block", or "distributed";
//      .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
//      .RELATED_CLOCKS            (0),                // 250MHz and 350MHz are related clock?
//      // .FIFO_WRITE_DEPTH          (FIFO_DEPTH),             //positive integer
//      .FIFO_WRITE_DEPTH          (2**NUM_BRAM_ADDR_BITS),             //positive integer
//      .WRITE_DATA_WIDTH          (FIFO_DATA_WIDTH),               //positive integer
//      .WR_DATA_COUNT_WIDTH       (NUM_BRAM_ADDR_BITS),               //positive integer
//      .PROG_FULL_THRESH          (10),               //positive integer
//      .FULL_RESET_VALUE          (0),                //positive integer; 0 or 1
//      .READ_MODE                 ("std"),            //string; "std" or "fwft";
//      .FIFO_READ_LATENCY         (1),                //positive integer;
//      .READ_DATA_WIDTH           (FIFO_DATA_WIDTH),               //positive integer
//      .RD_DATA_COUNT_WIDTH       (NUM_BRAM_ADDR_BITS),               //positive integer
//      .PROG_EMPTY_THRESH         (10),               //positive integer
//      .DOUT_RESET_VALUE          ("0"),              //string
//      .CDC_SYNC_STAGES           (2),                //positive integer
//      .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;
//    ) xpm_fifo_async_1_inst (
//      .rst              (reset_NoC),
//      .wr_clk           (clk_NoC),
//      .wr_en            (wr_en_1),
//      .din              (fifo_data_in_0),
//      .full             (full_1),
//      .overflow         (), // not used
//      .wr_rst_busy      (wr_rst_busy), // not used
//      .rd_clk           (clk_1),
//      .rd_en            (rd_en_0),
//      .dout             (data_1_a),
//      .empty            (empty_0),
//      .underflow        (), // not used
//      .rd_rst_busy      (rd_rst_busy), // not used
//      .prog_full        (), // not used
//      .wr_data_count    (), // not used
//      .prog_empty       (), // not used
//      .rd_data_count    (), // not used
//      .sleep            (1'b0),
//      .injectsbiterr    (1'b0),
//      .injectdbiterr    (1'b0),
//      .sbiterr          (),
//      .dbiterr          ()
//    );





