module mono #(
    parameter OUTPUT_SIZE = 1024
  )(
  input          clk_200,
  input          clk_250,
  input          clk_300,
  input          clk_350,
  input          clk_400,
  input          ap_rst_n,

  input [63:0]   Input_1_TDATA,
  input          Input_1_TVALID,
  output         Input_1_TREADY,
  output [63:0]  Output_1_TDATA,
  output         Output_1_TVALID,
  input          Output_1_TREADY,

  input [511:0]  Input_2_TDATA,
  input          Input_2_TVALID,
  output         Input_2_TREADY,
  output [511:0] Output_2_TDATA,
  output         Output_2_TVALID,
  input          Output_2_TREADY,

  input         ap_start);

  localparam WAIT_CNT = 20;

  wire [511:0] DMA_Input_1_TDATA;
  wire         DMA_Input_1_TVALID;
  wire         DMA_Input_1_TREADY;
  wire [511:0] DMA_Output_1_TDATA;
  wire         DMA_Output_1_TVALID;
  wire         DMA_Output_1_TREADY;

  wire [31:0] coloringFB_i1_Input_1_TDATA;
  wire        coloringFB_i1_Input_1_TVALID;
  wire        coloringFB_i1_Input_1_TREADY;
  wire [31:0] coloringFB_i1_Output_1_TDATA;
  wire        coloringFB_i1_Output_1_TVALID;
  wire        coloringFB_i1_Output_1_TREADY;
  wire [31:0] output_data_Input_1_TDATA;
  wire        output_data_Input_1_TVALID;
  wire        output_data_Input_1_TREADY;
  wire [255:0] output_data_Output_1_TDATA;
  wire        output_data_Output_1_TVALID;
  wire        output_data_Output_1_TREADY;
  wire [255:0] prj_rast1_Input_1_TDATA;
  wire        prj_rast1_Input_1_TVALID;
  wire        prj_rast1_Input_1_TREADY;
  wire [31:0] prj_rast1_Output_1_TDATA;
  wire        prj_rast1_Output_1_TVALID;
  wire        prj_rast1_Output_1_TREADY;
  wire [31:0] rast2_i1_Input_1_TDATA;
  wire        rast2_i1_Input_1_TVALID;
  wire        rast2_i1_Input_1_TREADY;
  wire [31:0] rast2_i1_Output_1_TDATA;
  wire        rast2_i1_Output_1_TVALID;
  wire        rast2_i1_Output_1_TREADY;
  wire [31:0] zculling_i1_Input_1_TDATA;
  wire        zculling_i1_Input_1_TVALID;
  wire        zculling_i1_Input_1_TREADY;
  wire [31:0] zculling_i1_Output_1_TDATA;
  wire        zculling_i1_Output_1_TVALID;
  wire        zculling_i1_Output_1_TREADY;

  wire [31:0] full_cnt_wr_dummy, empty_cnt_rd_dummy, read_cnt_rd_dummy;
  wire [31:0] full_cnt_wr_0, empty_cnt_rd_0, read_cnt_rd_0;
  wire [31:0] full_cnt_wr_1, empty_cnt_rd_1, read_cnt_rd_1;
  wire [31:0] full_cnt_wr_2, empty_cnt_rd_2, read_cnt_rd_2;
  wire [31:0] full_cnt_wr_3, empty_cnt_rd_3, read_cnt_rd_3;
  wire [31:0] full_cnt_wr_4, empty_cnt_rd_4, read_cnt_rd_4;
  wire [31:0] full_cnt_wr_5, empty_cnt_rd_5, read_cnt_rd_5;

  wire full_dummy, empty_dummy;
  wire full_0, empty_0;
  wire full_1, empty_1;
  wire full_2, empty_2;
  wire full_3, empty_3;
  wire full_4, empty_4;
  wire full_5, empty_5;

  wire [31:0] stall_cnt_coloringFB_i1;
  wire [31:0] stall_cnt_output_data;
  wire [31:0] stall_cnt_prj_rast1;
  wire [31:0] stall_cnt_rast2_i1;
  wire [31:0] stall_cnt_zculling_i1;

  ///////////////
  // reset CDC //
  ///////////////

  wire reset_200, reset_250, reset_300, reset_350, reset_400;
  assign reset_300 = ~ap_rst_n;

  xpm_cdc_async_rst #(
     .DEST_SYNC_FF(4),    // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .RST_ACTIVE_HIGH(1)  // DECIMAL; 0=active low reset, 1=active high reset
  )
  xpm_cdc_async_reset_200_inst (
     .dest_arst(reset_200), // 1-bit output: src_arst asynchronous reset signal synchronized to destination
                            // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                            // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                            // (DEST_SYNC_FF*dest_clk) period.
     .dest_clk(clk_200),   // 1-bit input: Destination clock.
     .src_arst(reset_300)    // 1-bit input: Source asynchronous reset signal.
  );

  xpm_cdc_async_rst #(
     .DEST_SYNC_FF(4),    // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .RST_ACTIVE_HIGH(1)  // DECIMAL; 0=active low reset, 1=active high reset
  )
  xpm_cdc_async_reset_250_inst (
     .dest_arst(reset_250), // 1-bit output: src_arst asynchronous reset signal synchronized to destination
                            // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                            // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                            // (DEST_SYNC_FF*dest_clk) period.
     .dest_clk(clk_250),   // 1-bit input: Destination clock.
     .src_arst(reset_300)    // 1-bit input: Source asynchronous reset signal.
  );

  xpm_cdc_async_rst #(
     .DEST_SYNC_FF(4),    // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .RST_ACTIVE_HIGH(1)  // DECIMAL; 0=active low reset, 1=active high reset
  )
  xpm_cdc_async_reset_350_inst (
     .dest_arst(reset_350), // 1-bit output: src_arst asynchronous reset signal synchronized to destination
                            // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                            // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                            // (DEST_SYNC_FF*dest_clk) period.
     .dest_clk(clk_350),   // 1-bit input: Destination clock.
     .src_arst(reset_300)    // 1-bit input: Source asynchronous reset signal.
  );

  xpm_cdc_async_rst #(
     .DEST_SYNC_FF(4),    // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .RST_ACTIVE_HIGH(1)  // DECIMAL; 0=active low reset, 1=active high reset
  )
  xpm_cdc_async_reset_400_inst (
     .dest_arst(reset_400), // 1-bit output: src_arst asynchronous reset signal synchronized to destination
                            // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                            // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                            // (DEST_SYNC_FF*dest_clk) period.
     .dest_clk(clk_400),   // 1-bit input: Destination clock.
     .src_arst(reset_300)    // 1-bit input: Source asynchronous reset signal.
  );

  ///////////////////////////
  // ap_start to reset 300 //
  ///////////////////////////

  wire ap_start_asserted_300;
  wire reset_ap_start_300; 
  reg ap_start_1, ap_start_2; // in order to stretch ap_start for two more cycles

  rise_detect #(
      .data_width(1)
  )rise_detect_ap_start_u(
      .data_out(ap_start_asserted_300),
      .data_in(ap_start),
      .clk(clk_300),
      .reset(reset_300)
  );
  assign reset_ap_start_300 = reset_300 || ap_start_asserted_300;

  // CDC for ap_start, can also be done with xpm_cdc_pulse
  always @ (posedge clk_300) begin
      ap_start_1 <= ap_start;
      ap_start_2 <= ap_start_1;
  end

  // I want to reset counters with ap_start
  //////////////////////////////////////////
  // ap_start to reset 200, 250, 350, 400 //
  //////////////////////////////////////////
  wire ap_start_200, ap_start_250, ap_start_350, ap_start_400;
  wire ap_start_asserted_200, ap_start_asserted_250, ap_start_asserted_350, ap_start_asserted_400;
  wire reset_ap_start_200, reset_ap_start_250, reset_ap_start_350, reset_ap_start_400;

  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_ap_start_200_inst (
     .dest_out(ap_start_200), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                                 // registered.
     .dest_clk(clk_200),        // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),              // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(ap_start | ap_start_1 | ap_start_2)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  rise_detect #(
      .data_width(1)
  )rise_detect_ap_start_200_u(
      .data_out(ap_start_asserted_200),
      .data_in(ap_start_200),
      .clk(clk_200),
      .reset(reset_200)
  );
  assign reset_ap_start_200 = reset_200 || ap_start_asserted_200;

  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_ap_start_250_inst (
     .dest_out(ap_start_250), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                                 // registered.
     .dest_clk(clk_250),        // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),              // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(ap_start | ap_start_1 | ap_start_2)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  rise_detect #(
      .data_width(1)
  )rise_detect_ap_start_250_u(
      .data_out(ap_start_asserted_250),
      .data_in(ap_start_250),
      .clk(clk_250),
      .reset(reset_250)
  );
  assign reset_ap_start_250 = reset_250 || ap_start_asserted_250;

  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_ap_start_350_inst (
     .dest_out(ap_start_350), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                                 // registered.
     .dest_clk(clk_350),        // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),              // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(ap_start | ap_start_1 | ap_start_2)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  rise_detect #(
      .data_width(1)
  )rise_detect_ap_start_350_u(
      .data_out(ap_start_asserted_350),
      .data_in(ap_start_350),
      .clk(clk_350),
      .reset(reset_350)
  );
  assign reset_ap_start_350 = reset_350 || ap_start_asserted_350;

  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_ap_start_400_inst (
     .dest_out(ap_start_400), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                                 // registered.
     .dest_clk(clk_400),        // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),              // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(ap_start | ap_start_1 | ap_start_2)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  rise_detect #(
      .data_width(1)
  )rise_detect_ap_start_400_u(
      .data_out(ap_start_asserted_400),
      .data_in(ap_start_400),
      .clk(clk_400),
      .reset(reset_400)
  );
  assign reset_ap_start_400 = reset_400 || ap_start_asserted_400;


  wire [63:0] cnt_data_in;
  wire cnt_data_valid;
  wire cnt_data_ready;

  // counter logic for output_size here
  // feed is_done to all the stream_shells
  // async_fifo for counter, separate clk (200,250,350,400)
  reg [63:0] Output_1_TDATA_reg;
  reg        Output_1_TVALID_reg;
  // assign Output_1_TDATA = Output_1_TDATA_reg;
  // assign Output_1_TVALID = Output_1_TVALID_reg;
  assign Input_1_TREADY = 1; // not used

  reg state_300; // 0: processing, 1: is_done state_300
  reg [31:0] output_cnt, is_done_wait_cnt;

  wire state_200, state_250, state_350, state_400;

  assign cnt_data_in = (!state_300) ? Input_1_TDATA : Output_1_TDATA_reg;
  assign cnt_data_valid = (!state_300) ? Input_1_TVALID : Output_1_TVALID_reg;

  // Stream shell to send cnt to host
  stream_shell #(
   .WRITE_DATA_WIDTH(64),
   .READ_DATA_WIDTH(64),
   .NUM_BRAM_ADDR_BITS(9)
   )stream_shell_cnt(
   .wr_clk(clk_300),
   .wr_rst(reset_300),
   .din(cnt_data_in),
   .val_in(cnt_data_valid),
   .ready_upward(cnt_data_ready),

   .rd_clk(clk_300),
   .rd_rst(reset_300),
   .dout(Output_1_TDATA),
   .val_out(Output_1_TVALID),
   .ready_downward(Output_1_TREADY),

   .reset_ap_start_wr(reset_ap_start_300),
   .reset_ap_start_rd(reset_ap_start_300),
   .state_wr(state_300),
   .state_rd(state_300),
   .full_cnt_wr(full_cnt_wr_dummy),
   .empty_cnt_rd(empty_cnt_rd_dummy),
   .read_cnt_rd(read_cnt_rd_dummy),
   .full(full_dummy),
   .empty(empty_dummy));


  always@(posedge clk_300)begin
    if(reset_ap_start_300) begin
      output_cnt <= 0;
      state_300 <= 0;
      is_done_wait_cnt <= 0;
      Output_1_TDATA_reg <= 0;
      Output_1_TVALID_reg <= 0;
    end
    else begin
      if (Output_2_TVALID && Output_2_TREADY && state_300 == 0) begin
        output_cnt <= output_cnt + 1;
      end
      if (output_cnt == OUTPUT_SIZE && state_300 == 0) begin
        state_300 <= 1; // is_done state_300
      end

      // WAIT_CNT is long enough num of cycles to make counters from different clk frequencies to be static
      if (state_300 && is_done_wait_cnt < WAIT_CNT) begin 
        is_done_wait_cnt <= is_done_wait_cnt + 1;
      end
      else begin
        // stream shell 0
        if (is_done_wait_cnt == WAIT_CNT) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_0};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 1) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_0};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 2) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_0};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 1
        else if (is_done_wait_cnt == WAIT_CNT + 3) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 4) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 5) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 2
        else if (is_done_wait_cnt == WAIT_CNT + 6) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_2};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 7) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_2};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 8) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_2};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 3
        else if (is_done_wait_cnt == WAIT_CNT + 9) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_3};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 10) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_3};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 11) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_3};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 4
        else if (is_done_wait_cnt == WAIT_CNT + 12) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_4};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 13) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_4};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 14) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_4};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 5
        else if (is_done_wait_cnt == WAIT_CNT + 15) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_5};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 16) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_5};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 17) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_5};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stall counters
        else if (is_done_wait_cnt == WAIT_CNT + 18) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_coloringFB_i1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 19) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_output_data};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 20) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_prj_rast1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 21) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_rast2_i1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 22) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_zculling_i1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else begin
          Output_1_TDATA_reg <= 0;
          Output_1_TVALID_reg <= 0;
        end
      end
    end
  end

  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_is_done_200_inst (
     .dest_out(state_200), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                              // registered.
     .dest_clk(clk_200),     // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),           // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(state_300)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_is_done_250_inst (
     .dest_out(state_250), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                              // registered.
     .dest_clk(clk_250),     // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),           // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(state_300)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_is_done_350_inst (
     .dest_out(state_350), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                              // registered.
     .dest_clk(clk_350),     // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),           // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(state_300)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );
  xpm_cdc_single #(
     .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
     .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
     .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
  )
  xpm_cdc_single_is_done_400_inst (
     .dest_out(state_400), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                              // registered.
     .dest_clk(clk_400),     // 1-bit input: Clock signal for the destination clock domain.
     .src_clk(clk_300),           // 1-bit input: optional; required when SRC_INPUT_REG = 1
     .src_in(state_300)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
  );


  stream_shell #(
    .WRITE_DATA_WIDTH(512),
    .READ_DATA_WIDTH(256),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_0(
    .wr_clk(clk_300),
    .wr_rst(reset_300),
    .din(DMA_Output_1_TDATA),
    .val_in(DMA_Output_1_TVALID),
    .ready_upward(DMA_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(prj_rast1_Input_1_TDATA),
    .val_out(prj_rast1_Input_1_TVALID),
    .ready_downward(prj_rast1_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_300),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_0),
    .empty_cnt_rd(empty_cnt_rd_0),
    .read_cnt_rd(read_cnt_rd_0),
    .full(full_0),
    .empty(empty_0));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_1(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(coloringFB_i1_Output_1_TDATA),
    .val_in(coloringFB_i1_Output_1_TVALID),
    .ready_upward(coloringFB_i1_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(output_data_Input_1_TDATA),
    .val_out(output_data_Input_1_TVALID),
    .ready_downward(output_data_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_1),
    .empty_cnt_rd(empty_cnt_rd_1),
    .read_cnt_rd(read_cnt_rd_1),
    .full(full_1),
    .empty(empty_1));

  stream_shell #(
    .WRITE_DATA_WIDTH(256),
    .READ_DATA_WIDTH(512),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_2(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(output_data_Output_1_TDATA),
    .val_in(output_data_Output_1_TVALID),
    .ready_upward(output_data_Output_1_TREADY),

    .rd_clk(clk_300),
    .rd_rst(reset_300),
    .dout(DMA_Input_1_TDATA),
    .val_out(DMA_Input_1_TVALID),
    .ready_downward(DMA_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_300),
    .state_wr(state_200),
    .state_rd(state_300),
    .full_cnt_wr(full_cnt_wr_2),
    .empty_cnt_rd(empty_cnt_rd_2),
    .read_cnt_rd(read_cnt_rd_2),
    .full(full_2),
    .empty(empty_2));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_3(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(prj_rast1_Output_1_TDATA),
    .val_in(prj_rast1_Output_1_TVALID),
    .ready_upward(prj_rast1_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(rast2_i1_Input_1_TDATA),
    .val_out(rast2_i1_Input_1_TVALID),
    .ready_downward(rast2_i1_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_3),
    .empty_cnt_rd(empty_cnt_rd_3),
    .read_cnt_rd(read_cnt_rd_3),
    .full(full_3),
    .empty(empty_3));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_4(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(rast2_i1_Output_1_TDATA),
    .val_in(rast2_i1_Output_1_TVALID),
    .ready_upward(rast2_i1_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(zculling_i1_Input_1_TDATA),
    .val_out(zculling_i1_Input_1_TVALID),
    .ready_downward(zculling_i1_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_4),
    .empty_cnt_rd(empty_cnt_rd_4),
    .read_cnt_rd(read_cnt_rd_4),
    .full(full_4),
    .empty(empty_4));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_5(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(zculling_i1_Output_1_TDATA),
    .val_in(zculling_i1_Output_1_TVALID),
    .ready_upward(zculling_i1_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(coloringFB_i1_Input_1_TDATA),
    .val_out(coloringFB_i1_Input_1_TVALID),
    .ready_downward(coloringFB_i1_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_5),
    .empty_cnt_rd(empty_cnt_rd_5),
    .read_cnt_rd(read_cnt_rd_5),
    .full(full_5),
    .empty(empty_5));

  wire coloringFB_i1_Input_1_stall_condition = (!state_200) && coloringFB_i1_Input_1_TREADY && empty_5;
  wire coloringFB_i1_Output_1_stall_condition = (!state_200) && coloringFB_i1_Output_1_TVALID && full_1;

  stall_cnt stall_cnt_coloringFB_i1_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(coloringFB_i1_Input_1_stall_condition),
    .output_stall_condition(coloringFB_i1_Output_1_stall_condition),
    .stall_cnt(stall_cnt_coloringFB_i1)
  );

  coloringFB_i1 coloringFB_i1_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(coloringFB_i1_Input_1_TDATA),
    .Input_1_TVALID(coloringFB_i1_Input_1_TVALID),
    .Input_1_TREADY(coloringFB_i1_Input_1_TREADY),
    .Output_1_TDATA(coloringFB_i1_Output_1_TDATA),
    .Output_1_TVALID(coloringFB_i1_Output_1_TVALID),
    .Output_1_TREADY(coloringFB_i1_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire output_data_Input_1_stall_condition = (!state_200) && output_data_Input_1_TREADY && empty_1;
  wire output_data_Output_1_stall_condition = (!state_200) && output_data_Output_1_TVALID && full_2;

  stall_cnt stall_cnt_output_data_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(output_data_Input_1_stall_condition),
    .output_stall_condition(output_data_Output_1_stall_condition),
    .stall_cnt(stall_cnt_output_data)
  );

  output_data output_data_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(output_data_Input_1_TDATA),
    .Input_1_TVALID(output_data_Input_1_TVALID),
    .Input_1_TREADY(output_data_Input_1_TREADY),
    .Output_1_TDATA(output_data_Output_1_TDATA),
    .Output_1_TVALID(output_data_Output_1_TVALID),
    .Output_1_TREADY(output_data_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire prj_rast1_Input_1_stall_condition = (!state_200) && prj_rast1_Input_1_TREADY && empty_0;
  wire prj_rast1_Output_1_stall_condition = (!state_200) && prj_rast1_Output_1_TVALID && full_3;

  stall_cnt stall_cnt_prj_rast1_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(prj_rast1_Input_1_stall_condition),
    .output_stall_condition(prj_rast1_Output_1_stall_condition),
    .stall_cnt(stall_cnt_prj_rast1)
  );

  prj_rast1 prj_rast1_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(prj_rast1_Input_1_TDATA),
    .Input_1_TVALID(prj_rast1_Input_1_TVALID),
    .Input_1_TREADY(prj_rast1_Input_1_TREADY),
    .Output_1_TDATA(prj_rast1_Output_1_TDATA),
    .Output_1_TVALID(prj_rast1_Output_1_TVALID),
    .Output_1_TREADY(prj_rast1_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire rast2_i1_Input_1_stall_condition = (!state_200) && rast2_i1_Input_1_TREADY && empty_3;
  wire rast2_i1_Output_1_stall_condition = (!state_200) && rast2_i1_Output_1_TVALID && full_4;

  stall_cnt stall_cnt_rast2_i1_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(rast2_i1_Input_1_stall_condition),
    .output_stall_condition(rast2_i1_Output_1_stall_condition),
    .stall_cnt(stall_cnt_rast2_i1)
  );

  rast2_i1 rast2_i1_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(rast2_i1_Input_1_TDATA),
    .Input_1_TVALID(rast2_i1_Input_1_TVALID),
    .Input_1_TREADY(rast2_i1_Input_1_TREADY),
    .Output_1_TDATA(rast2_i1_Output_1_TDATA),
    .Output_1_TVALID(rast2_i1_Output_1_TVALID),
    .Output_1_TREADY(rast2_i1_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire zculling_i1_Input_1_stall_condition = (!state_200) && zculling_i1_Input_1_TREADY && empty_4;
  wire zculling_i1_Output_1_stall_condition = (!state_200) && zculling_i1_Output_1_TVALID && full_5;

  stall_cnt stall_cnt_zculling_i1_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(zculling_i1_Input_1_stall_condition),
    .output_stall_condition(zculling_i1_Output_1_stall_condition),
    .stall_cnt(stall_cnt_zculling_i1)
  );

  zculling_i1 zculling_i1_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(zculling_i1_Input_1_TDATA),
    .Input_1_TVALID(zculling_i1_Input_1_TVALID),
    .Input_1_TREADY(zculling_i1_Input_1_TREADY),
    .Output_1_TDATA(zculling_i1_Output_1_TDATA),
    .Output_1_TVALID(zculling_i1_Output_1_TVALID),
    .Output_1_TREADY(zculling_i1_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );


  assign Output_2_TDATA  = DMA_Input_1_TDATA;
  assign Output_2_TVALID = DMA_Input_1_TVALID;
  assign DMA_Input_1_TREADY = Output_2_TREADY;

  assign DMA_Output_1_TDATA  = Input_2_TDATA;
  assign DMA_Output_1_TVALID = Input_2_TVALID;
  assign Input_2_TREADY = DMA_Output_1_TREADY;

endmodule
