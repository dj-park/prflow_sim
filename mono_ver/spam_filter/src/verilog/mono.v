module mono #(
    parameter OUTPUT_SIZE = 64
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

  wire [255:0] data_in_redir_Input_1_TDATA;
  wire        data_in_redir_Input_1_TVALID;
  wire        data_in_redir_Input_1_TREADY;
  wire [63:0] data_in_redir_Output_1_TDATA;
  wire        data_in_redir_Output_1_TVALID;
  wire        data_in_redir_Output_1_TREADY;
  wire [63:0] data_in_redir_Output_2_TDATA;
  wire        data_in_redir_Output_2_TVALID;
  wire        data_in_redir_Output_2_TREADY;
  wire [63:0] data_in_redir_Output_3_TDATA;
  wire        data_in_redir_Output_3_TVALID;
  wire        data_in_redir_Output_3_TREADY;
  wire [63:0] data_in_redir_Output_4_TDATA;
  wire        data_in_redir_Output_4_TVALID;
  wire        data_in_redir_Output_4_TREADY;
  wire [63:0] dotProduct_i1_Input_1_TDATA;
  wire        dotProduct_i1_Input_1_TVALID;
  wire        dotProduct_i1_Input_1_TREADY;
  wire [31:0] dotProduct_i1_Input_2_TDATA;
  wire        dotProduct_i1_Input_2_TVALID;
  wire        dotProduct_i1_Input_2_TREADY;
  wire [31:0] dotProduct_i1_Output_1_TDATA;
  wire        dotProduct_i1_Output_1_TVALID;
  wire        dotProduct_i1_Output_1_TREADY;
  wire [63:0] dotProduct_i1_Output_2_TDATA;
  wire        dotProduct_i1_Output_2_TVALID;
  wire        dotProduct_i1_Output_2_TREADY;
  wire [63:0] dotProduct_i3_Input_1_TDATA;
  wire        dotProduct_i3_Input_1_TVALID;
  wire        dotProduct_i3_Input_1_TREADY;
  wire [31:0] dotProduct_i3_Input_2_TDATA;
  wire        dotProduct_i3_Input_2_TVALID;
  wire        dotProduct_i3_Input_2_TREADY;
  wire [31:0] dotProduct_i3_Output_1_TDATA;
  wire        dotProduct_i3_Output_1_TVALID;
  wire        dotProduct_i3_Output_1_TREADY;
  wire [63:0] dotProduct_i3_Output_2_TDATA;
  wire        dotProduct_i3_Output_2_TVALID;
  wire        dotProduct_i3_Output_2_TREADY;
  wire [63:0] dotProduct_i5_Input_1_TDATA;
  wire        dotProduct_i5_Input_1_TVALID;
  wire        dotProduct_i5_Input_1_TREADY;
  wire [31:0] dotProduct_i5_Input_2_TDATA;
  wire        dotProduct_i5_Input_2_TVALID;
  wire        dotProduct_i5_Input_2_TREADY;
  wire [31:0] dotProduct_i5_Output_1_TDATA;
  wire        dotProduct_i5_Output_1_TVALID;
  wire        dotProduct_i5_Output_1_TREADY;
  wire [63:0] dotProduct_i5_Output_2_TDATA;
  wire        dotProduct_i5_Output_2_TVALID;
  wire        dotProduct_i5_Output_2_TREADY;
  wire [63:0] dotProduct_i7_Input_1_TDATA;
  wire        dotProduct_i7_Input_1_TVALID;
  wire        dotProduct_i7_Input_1_TREADY;
  wire [31:0] dotProduct_i7_Input_2_TDATA;
  wire        dotProduct_i7_Input_2_TVALID;
  wire        dotProduct_i7_Input_2_TREADY;
  wire [31:0] dotProduct_i7_Output_1_TDATA;
  wire        dotProduct_i7_Output_1_TVALID;
  wire        dotProduct_i7_Output_1_TREADY;
  wire [63:0] dotProduct_i7_Output_2_TDATA;
  wire        dotProduct_i7_Output_2_TVALID;
  wire        dotProduct_i7_Output_2_TREADY;
  wire [63:0] output_collect_Input_1_TDATA;
  wire        output_collect_Input_1_TVALID;
  wire        output_collect_Input_1_TREADY;
  wire [63:0] output_collect_Input_2_TDATA;
  wire        output_collect_Input_2_TVALID;
  wire        output_collect_Input_2_TREADY;
  wire [63:0] output_collect_Input_3_TDATA;
  wire        output_collect_Input_3_TVALID;
  wire        output_collect_Input_3_TREADY;
  wire [63:0] output_collect_Input_4_TDATA;
  wire        output_collect_Input_4_TVALID;
  wire        output_collect_Input_4_TREADY;
  wire [255:0] output_collect_Output_1_TDATA;
  wire        output_collect_Output_1_TVALID;
  wire        output_collect_Output_1_TREADY;
  wire [31:0] sigmoid_Input_1_TDATA;
  wire        sigmoid_Input_1_TVALID;
  wire        sigmoid_Input_1_TREADY;
  wire [31:0] sigmoid_Input_2_TDATA;
  wire        sigmoid_Input_2_TVALID;
  wire        sigmoid_Input_2_TREADY;
  wire [31:0] sigmoid_Input_3_TDATA;
  wire        sigmoid_Input_3_TVALID;
  wire        sigmoid_Input_3_TREADY;
  wire [31:0] sigmoid_Input_4_TDATA;
  wire        sigmoid_Input_4_TVALID;
  wire        sigmoid_Input_4_TREADY;
  wire [31:0] sigmoid_Output_1_TDATA;
  wire        sigmoid_Output_1_TVALID;
  wire        sigmoid_Output_1_TREADY;
  wire [31:0] sigmoid_Output_2_TDATA;
  wire        sigmoid_Output_2_TVALID;
  wire        sigmoid_Output_2_TREADY;
  wire [31:0] sigmoid_Output_3_TDATA;
  wire        sigmoid_Output_3_TVALID;
  wire        sigmoid_Output_3_TREADY;
  wire [31:0] sigmoid_Output_4_TDATA;
  wire        sigmoid_Output_4_TVALID;
  wire        sigmoid_Output_4_TREADY;

  wire [31:0] full_cnt_wr_dummy, empty_cnt_rd_dummy, read_cnt_rd_dummy;
  wire [31:0] full_cnt_wr_0, empty_cnt_rd_0, read_cnt_rd_0;
  wire [31:0] full_cnt_wr_1, empty_cnt_rd_1, read_cnt_rd_1;
  wire [31:0] full_cnt_wr_2, empty_cnt_rd_2, read_cnt_rd_2;
  wire [31:0] full_cnt_wr_3, empty_cnt_rd_3, read_cnt_rd_3;
  wire [31:0] full_cnt_wr_4, empty_cnt_rd_4, read_cnt_rd_4;
  wire [31:0] full_cnt_wr_5, empty_cnt_rd_5, read_cnt_rd_5;
  wire [31:0] full_cnt_wr_6, empty_cnt_rd_6, read_cnt_rd_6;
  wire [31:0] full_cnt_wr_7, empty_cnt_rd_7, read_cnt_rd_7;
  wire [31:0] full_cnt_wr_8, empty_cnt_rd_8, read_cnt_rd_8;
  wire [31:0] full_cnt_wr_9, empty_cnt_rd_9, read_cnt_rd_9;
  wire [31:0] full_cnt_wr_10, empty_cnt_rd_10, read_cnt_rd_10;
  wire [31:0] full_cnt_wr_11, empty_cnt_rd_11, read_cnt_rd_11;
  wire [31:0] full_cnt_wr_12, empty_cnt_rd_12, read_cnt_rd_12;
  wire [31:0] full_cnt_wr_13, empty_cnt_rd_13, read_cnt_rd_13;
  wire [31:0] full_cnt_wr_14, empty_cnt_rd_14, read_cnt_rd_14;
  wire [31:0] full_cnt_wr_15, empty_cnt_rd_15, read_cnt_rd_15;
  wire [31:0] full_cnt_wr_16, empty_cnt_rd_16, read_cnt_rd_16;
  wire [31:0] full_cnt_wr_17, empty_cnt_rd_17, read_cnt_rd_17;

  wire full_dummy, empty_dummy;
  wire full_0, empty_0;
  wire full_1, empty_1;
  wire full_2, empty_2;
  wire full_3, empty_3;
  wire full_4, empty_4;
  wire full_5, empty_5;
  wire full_6, empty_6;
  wire full_7, empty_7;
  wire full_8, empty_8;
  wire full_9, empty_9;
  wire full_10, empty_10;
  wire full_11, empty_11;
  wire full_12, empty_12;
  wire full_13, empty_13;
  wire full_14, empty_14;
  wire full_15, empty_15;
  wire full_16, empty_16;
  wire full_17, empty_17;

  wire [31:0] stall_cnt_data_in_redir;
  wire [31:0] stall_cnt_dotProduct_i1;
  wire [31:0] stall_cnt_dotProduct_i3;
  wire [31:0] stall_cnt_dotProduct_i5;
  wire [31:0] stall_cnt_dotProduct_i7;
  wire [31:0] stall_cnt_output_collect;
  wire [31:0] stall_cnt_sigmoid;

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

        // stream shell 6
        else if (is_done_wait_cnt == WAIT_CNT + 18) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_6};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 19) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_6};
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
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_6};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 7
        else if (is_done_wait_cnt == WAIT_CNT + 21) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_7};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 22) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_7};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 23) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_7};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 8
        else if (is_done_wait_cnt == WAIT_CNT + 24) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_8};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 25) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_8};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 26) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_8};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 9
        else if (is_done_wait_cnt == WAIT_CNT + 27) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_9};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 28) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_9};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 29) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_9};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 10
        else if (is_done_wait_cnt == WAIT_CNT + 30) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_10};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 31) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_10};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 32) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_10};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 11
        else if (is_done_wait_cnt == WAIT_CNT + 33) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_11};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 34) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_11};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 35) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_11};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 12
        else if (is_done_wait_cnt == WAIT_CNT + 36) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_12};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 37) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_12};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 38) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_12};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 13
        else if (is_done_wait_cnt == WAIT_CNT + 39) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_13};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 40) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_13};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 41) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_13};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 14
        else if (is_done_wait_cnt == WAIT_CNT + 42) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_14};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 43) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_14};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 44) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_14};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 15
        else if (is_done_wait_cnt == WAIT_CNT + 45) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_15};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 46) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_15};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 47) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_15};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 16
        else if (is_done_wait_cnt == WAIT_CNT + 48) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_16};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 49) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_16};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 50) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_16};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stream shell 17
        else if (is_done_wait_cnt == WAIT_CNT + 51) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,full_cnt_wr_17};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0; // garbage
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 52) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,empty_cnt_rd_17};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end
        else if (is_done_wait_cnt == WAIT_CNT + 53) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,read_cnt_rd_17};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        // stall counters
        else if (is_done_wait_cnt == WAIT_CNT + 54) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_data_in_redir};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 55) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_dotProduct_i1};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 56) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_dotProduct_i3};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 57) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_dotProduct_i5};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 58) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_dotProduct_i7};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 59) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_output_collect};
            Output_1_TVALID_reg <= 1;
            is_done_wait_cnt <= is_done_wait_cnt + 1;
          end
          else begin
            Output_1_TDATA_reg <= 0;
            Output_1_TVALID_reg <= 0;
          end
        end

        else if (is_done_wait_cnt == WAIT_CNT + 60) begin
          if (cnt_data_ready) begin
            Output_1_TDATA_reg <= {32'b0,stall_cnt_sigmoid};
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

    .rd_clk(clk_300),
    .rd_rst(reset_300),
    .dout(data_in_redir_Input_1_TDATA),
    .val_out(data_in_redir_Input_1_TVALID),
    .ready_downward(data_in_redir_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_300),
    .state_wr(state_300),
    .state_rd(state_300),
    .full_cnt_wr(full_cnt_wr_0),
    .empty_cnt_rd(empty_cnt_rd_0),
    .read_cnt_rd(read_cnt_rd_0),
    .full(full_0),
    .empty(empty_0));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_1(
    .wr_clk(clk_300),
    .wr_rst(reset_300),
    .din(data_in_redir_Output_1_TDATA),
    .val_in(data_in_redir_Output_1_TVALID),
    .ready_upward(data_in_redir_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i1_Input_1_TDATA),
    .val_out(dotProduct_i1_Input_1_TVALID),
    .ready_downward(dotProduct_i1_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_300),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_1),
    .empty_cnt_rd(empty_cnt_rd_1),
    .read_cnt_rd(read_cnt_rd_1),
    .full(full_1),
    .empty(empty_1));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_2(
    .wr_clk(clk_300),
    .wr_rst(reset_300),
    .din(data_in_redir_Output_2_TDATA),
    .val_in(data_in_redir_Output_2_TVALID),
    .ready_upward(data_in_redir_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i3_Input_1_TDATA),
    .val_out(dotProduct_i3_Input_1_TVALID),
    .ready_downward(dotProduct_i3_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_300),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_2),
    .empty_cnt_rd(empty_cnt_rd_2),
    .read_cnt_rd(read_cnt_rd_2),
    .full(full_2),
    .empty(empty_2));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_3(
    .wr_clk(clk_300),
    .wr_rst(reset_300),
    .din(data_in_redir_Output_3_TDATA),
    .val_in(data_in_redir_Output_3_TVALID),
    .ready_upward(data_in_redir_Output_3_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i5_Input_1_TDATA),
    .val_out(dotProduct_i5_Input_1_TVALID),
    .ready_downward(dotProduct_i5_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_300),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_3),
    .empty_cnt_rd(empty_cnt_rd_3),
    .read_cnt_rd(read_cnt_rd_3),
    .full(full_3),
    .empty(empty_3));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_4(
    .wr_clk(clk_300),
    .wr_rst(reset_300),
    .din(data_in_redir_Output_4_TDATA),
    .val_in(data_in_redir_Output_4_TVALID),
    .ready_upward(data_in_redir_Output_4_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i7_Input_1_TDATA),
    .val_out(dotProduct_i7_Input_1_TVALID),
    .ready_downward(dotProduct_i7_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_300),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_300),
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
    .din(dotProduct_i1_Output_1_TDATA),
    .val_in(dotProduct_i1_Output_1_TVALID),
    .ready_upward(dotProduct_i1_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(sigmoid_Input_1_TDATA),
    .val_out(sigmoid_Input_1_TVALID),
    .ready_downward(sigmoid_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_5),
    .empty_cnt_rd(empty_cnt_rd_5),
    .read_cnt_rd(read_cnt_rd_5),
    .full(full_5),
    .empty(empty_5));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_6(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i1_Output_2_TDATA),
    .val_in(dotProduct_i1_Output_2_TVALID),
    .ready_upward(dotProduct_i1_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(output_collect_Input_1_TDATA),
    .val_out(output_collect_Input_1_TVALID),
    .ready_downward(output_collect_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_6),
    .empty_cnt_rd(empty_cnt_rd_6),
    .read_cnt_rd(read_cnt_rd_6),
    .full(full_6),
    .empty(empty_6));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_7(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i3_Output_1_TDATA),
    .val_in(dotProduct_i3_Output_1_TVALID),
    .ready_upward(dotProduct_i3_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(sigmoid_Input_2_TDATA),
    .val_out(sigmoid_Input_2_TVALID),
    .ready_downward(sigmoid_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_7),
    .empty_cnt_rd(empty_cnt_rd_7),
    .read_cnt_rd(read_cnt_rd_7),
    .full(full_7),
    .empty(empty_7));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_8(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i3_Output_2_TDATA),
    .val_in(dotProduct_i3_Output_2_TVALID),
    .ready_upward(dotProduct_i3_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(output_collect_Input_2_TDATA),
    .val_out(output_collect_Input_2_TVALID),
    .ready_downward(output_collect_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_8),
    .empty_cnt_rd(empty_cnt_rd_8),
    .read_cnt_rd(read_cnt_rd_8),
    .full(full_8),
    .empty(empty_8));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_9(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i5_Output_1_TDATA),
    .val_in(dotProduct_i5_Output_1_TVALID),
    .ready_upward(dotProduct_i5_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(sigmoid_Input_3_TDATA),
    .val_out(sigmoid_Input_3_TVALID),
    .ready_downward(sigmoid_Input_3_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_9),
    .empty_cnt_rd(empty_cnt_rd_9),
    .read_cnt_rd(read_cnt_rd_9),
    .full(full_9),
    .empty(empty_9));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_10(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i5_Output_2_TDATA),
    .val_in(dotProduct_i5_Output_2_TVALID),
    .ready_upward(dotProduct_i5_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(output_collect_Input_3_TDATA),
    .val_out(output_collect_Input_3_TVALID),
    .ready_downward(output_collect_Input_3_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_10),
    .empty_cnt_rd(empty_cnt_rd_10),
    .read_cnt_rd(read_cnt_rd_10),
    .full(full_10),
    .empty(empty_10));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_11(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i7_Output_1_TDATA),
    .val_in(dotProduct_i7_Output_1_TVALID),
    .ready_upward(dotProduct_i7_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(sigmoid_Input_4_TDATA),
    .val_out(sigmoid_Input_4_TVALID),
    .ready_downward(sigmoid_Input_4_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_11),
    .empty_cnt_rd(empty_cnt_rd_11),
    .read_cnt_rd(read_cnt_rd_11),
    .full(full_11),
    .empty(empty_11));

  stream_shell #(
    .WRITE_DATA_WIDTH(64),
    .READ_DATA_WIDTH(64),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_12(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(dotProduct_i7_Output_2_TDATA),
    .val_in(dotProduct_i7_Output_2_TVALID),
    .ready_upward(dotProduct_i7_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(output_collect_Input_4_TDATA),
    .val_out(output_collect_Input_4_TVALID),
    .ready_downward(output_collect_Input_4_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_12),
    .empty_cnt_rd(empty_cnt_rd_12),
    .read_cnt_rd(read_cnt_rd_12),
    .full(full_12),
    .empty(empty_12));

  stream_shell #(
    .WRITE_DATA_WIDTH(256),
    .READ_DATA_WIDTH(512),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_13(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(output_collect_Output_1_TDATA),
    .val_in(output_collect_Output_1_TVALID),
    .ready_upward(output_collect_Output_1_TREADY),

    .rd_clk(clk_300),
    .rd_rst(reset_300),
    .dout(DMA_Input_1_TDATA),
    .val_out(DMA_Input_1_TVALID),
    .ready_downward(DMA_Input_1_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_300),
    .state_wr(state_200),
    .state_rd(state_300),
    .full_cnt_wr(full_cnt_wr_13),
    .empty_cnt_rd(empty_cnt_rd_13),
    .read_cnt_rd(read_cnt_rd_13),
    .full(full_13),
    .empty(empty_13));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_14(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(sigmoid_Output_1_TDATA),
    .val_in(sigmoid_Output_1_TVALID),
    .ready_upward(sigmoid_Output_1_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i1_Input_2_TDATA),
    .val_out(dotProduct_i1_Input_2_TVALID),
    .ready_downward(dotProduct_i1_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_14),
    .empty_cnt_rd(empty_cnt_rd_14),
    .read_cnt_rd(read_cnt_rd_14),
    .full(full_14),
    .empty(empty_14));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_15(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(sigmoid_Output_2_TDATA),
    .val_in(sigmoid_Output_2_TVALID),
    .ready_upward(sigmoid_Output_2_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i3_Input_2_TDATA),
    .val_out(dotProduct_i3_Input_2_TVALID),
    .ready_downward(dotProduct_i3_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_15),
    .empty_cnt_rd(empty_cnt_rd_15),
    .read_cnt_rd(read_cnt_rd_15),
    .full(full_15),
    .empty(empty_15));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_16(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(sigmoid_Output_3_TDATA),
    .val_in(sigmoid_Output_3_TVALID),
    .ready_upward(sigmoid_Output_3_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i5_Input_2_TDATA),
    .val_out(dotProduct_i5_Input_2_TVALID),
    .ready_downward(dotProduct_i5_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_16),
    .empty_cnt_rd(empty_cnt_rd_16),
    .read_cnt_rd(read_cnt_rd_16),
    .full(full_16),
    .empty(empty_16));

  stream_shell #(
    .WRITE_DATA_WIDTH(32),
    .READ_DATA_WIDTH(32),
    .NUM_BRAM_ADDR_BITS(7)
    )stream_shell_17(
    .wr_clk(clk_200),
    .wr_rst(reset_200),
    .din(sigmoid_Output_4_TDATA),
    .val_in(sigmoid_Output_4_TVALID),
    .ready_upward(sigmoid_Output_4_TREADY),

    .rd_clk(clk_200),
    .rd_rst(reset_200),
    .dout(dotProduct_i7_Input_2_TDATA),
    .val_out(dotProduct_i7_Input_2_TVALID),
    .ready_downward(dotProduct_i7_Input_2_TREADY),

    .reset_ap_start_wr(reset_ap_start_200),
    .reset_ap_start_rd(reset_ap_start_200),
    .state_wr(state_200),
    .state_rd(state_200),
    .full_cnt_wr(full_cnt_wr_17),
    .empty_cnt_rd(empty_cnt_rd_17),
    .read_cnt_rd(read_cnt_rd_17),
    .full(full_17),
    .empty(empty_17));

  wire data_in_redir_Input_1_stall_condition = (!state_300) && data_in_redir_Input_1_TREADY && empty_0;
  wire data_in_redir_Output_1_stall_condition = (!state_300) && data_in_redir_Output_1_TVALID && full_1;
  wire data_in_redir_Output_2_stall_condition = (!state_300) && data_in_redir_Output_2_TVALID && full_2;
  wire data_in_redir_Output_3_stall_condition = (!state_300) && data_in_redir_Output_3_TVALID && full_3;
  wire data_in_redir_Output_4_stall_condition = (!state_300) && data_in_redir_Output_4_TVALID && full_4;

  stall_cnt stall_cnt_data_in_redir_inst(
    .clk(clk_300),
    .reset(reset_ap_start_300),
    .state(state_300),
    .input_stall_condition(data_in_redir_Input_1_stall_condition),
    .output_stall_condition(data_in_redir_Output_1_stall_condition || data_in_redir_Output_2_stall_condition || data_in_redir_Output_3_stall_condition || data_in_redir_Output_4_stall_condition),
    .stall_cnt(stall_cnt_data_in_redir)
  );

  data_in_redir data_in_redir_inst(
    .ap_clk(clk_300),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(data_in_redir_Input_1_TDATA),
    .Input_1_TVALID(data_in_redir_Input_1_TVALID),
    .Input_1_TREADY(data_in_redir_Input_1_TREADY),
    .Output_1_TDATA(data_in_redir_Output_1_TDATA),
    .Output_1_TVALID(data_in_redir_Output_1_TVALID),
    .Output_1_TREADY(data_in_redir_Output_1_TREADY),
    .Output_2_TDATA(data_in_redir_Output_2_TDATA),
    .Output_2_TVALID(data_in_redir_Output_2_TVALID),
    .Output_2_TREADY(data_in_redir_Output_2_TREADY),
    .Output_3_TDATA(data_in_redir_Output_3_TDATA),
    .Output_3_TVALID(data_in_redir_Output_3_TVALID),
    .Output_3_TREADY(data_in_redir_Output_3_TREADY),
    .Output_4_TDATA(data_in_redir_Output_4_TDATA),
    .Output_4_TVALID(data_in_redir_Output_4_TVALID),
    .Output_4_TREADY(data_in_redir_Output_4_TREADY),
    .ap_rst_n(~reset_300)
  );

  wire dotProduct_i1_Input_1_stall_condition = (!state_200) && dotProduct_i1_Input_1_TREADY && empty_1;
  wire dotProduct_i1_Input_2_stall_condition = (!state_200) && dotProduct_i1_Input_2_TREADY && empty_14;
  wire dotProduct_i1_Output_1_stall_condition = (!state_200) && dotProduct_i1_Output_1_TVALID && full_5;
  wire dotProduct_i1_Output_2_stall_condition = (!state_200) && dotProduct_i1_Output_2_TVALID && full_6;

  stall_cnt stall_cnt_dotProduct_i1_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(dotProduct_i1_Input_1_stall_condition || dotProduct_i1_Input_2_stall_condition),
    .output_stall_condition(dotProduct_i1_Output_1_stall_condition || dotProduct_i1_Output_2_stall_condition),
    .stall_cnt(stall_cnt_dotProduct_i1)
  );

  dotProduct_i1 dotProduct_i1_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(dotProduct_i1_Input_1_TDATA),
    .Input_1_TVALID(dotProduct_i1_Input_1_TVALID),
    .Input_1_TREADY(dotProduct_i1_Input_1_TREADY),
    .Input_2_TDATA(dotProduct_i1_Input_2_TDATA),
    .Input_2_TVALID(dotProduct_i1_Input_2_TVALID),
    .Input_2_TREADY(dotProduct_i1_Input_2_TREADY),
    .Output_1_TDATA(dotProduct_i1_Output_1_TDATA),
    .Output_1_TVALID(dotProduct_i1_Output_1_TVALID),
    .Output_1_TREADY(dotProduct_i1_Output_1_TREADY),
    .Output_2_TDATA(dotProduct_i1_Output_2_TDATA),
    .Output_2_TVALID(dotProduct_i1_Output_2_TVALID),
    .Output_2_TREADY(dotProduct_i1_Output_2_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire dotProduct_i3_Input_1_stall_condition = (!state_200) && dotProduct_i3_Input_1_TREADY && empty_2;
  wire dotProduct_i3_Input_2_stall_condition = (!state_200) && dotProduct_i3_Input_2_TREADY && empty_15;
  wire dotProduct_i3_Output_1_stall_condition = (!state_200) && dotProduct_i3_Output_1_TVALID && full_7;
  wire dotProduct_i3_Output_2_stall_condition = (!state_200) && dotProduct_i3_Output_2_TVALID && full_8;

  stall_cnt stall_cnt_dotProduct_i3_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(dotProduct_i3_Input_1_stall_condition || dotProduct_i3_Input_2_stall_condition),
    .output_stall_condition(dotProduct_i3_Output_1_stall_condition || dotProduct_i3_Output_2_stall_condition),
    .stall_cnt(stall_cnt_dotProduct_i3)
  );

  dotProduct_i3 dotProduct_i3_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(dotProduct_i3_Input_1_TDATA),
    .Input_1_TVALID(dotProduct_i3_Input_1_TVALID),
    .Input_1_TREADY(dotProduct_i3_Input_1_TREADY),
    .Input_2_TDATA(dotProduct_i3_Input_2_TDATA),
    .Input_2_TVALID(dotProduct_i3_Input_2_TVALID),
    .Input_2_TREADY(dotProduct_i3_Input_2_TREADY),
    .Output_1_TDATA(dotProduct_i3_Output_1_TDATA),
    .Output_1_TVALID(dotProduct_i3_Output_1_TVALID),
    .Output_1_TREADY(dotProduct_i3_Output_1_TREADY),
    .Output_2_TDATA(dotProduct_i3_Output_2_TDATA),
    .Output_2_TVALID(dotProduct_i3_Output_2_TVALID),
    .Output_2_TREADY(dotProduct_i3_Output_2_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire dotProduct_i5_Input_1_stall_condition = (!state_200) && dotProduct_i5_Input_1_TREADY && empty_3;
  wire dotProduct_i5_Input_2_stall_condition = (!state_200) && dotProduct_i5_Input_2_TREADY && empty_16;
  wire dotProduct_i5_Output_1_stall_condition = (!state_200) && dotProduct_i5_Output_1_TVALID && full_9;
  wire dotProduct_i5_Output_2_stall_condition = (!state_200) && dotProduct_i5_Output_2_TVALID && full_10;

  stall_cnt stall_cnt_dotProduct_i5_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(dotProduct_i5_Input_1_stall_condition || dotProduct_i5_Input_2_stall_condition),
    .output_stall_condition(dotProduct_i5_Output_1_stall_condition || dotProduct_i5_Output_2_stall_condition),
    .stall_cnt(stall_cnt_dotProduct_i5)
  );

  dotProduct_i5 dotProduct_i5_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(dotProduct_i5_Input_1_TDATA),
    .Input_1_TVALID(dotProduct_i5_Input_1_TVALID),
    .Input_1_TREADY(dotProduct_i5_Input_1_TREADY),
    .Input_2_TDATA(dotProduct_i5_Input_2_TDATA),
    .Input_2_TVALID(dotProduct_i5_Input_2_TVALID),
    .Input_2_TREADY(dotProduct_i5_Input_2_TREADY),
    .Output_1_TDATA(dotProduct_i5_Output_1_TDATA),
    .Output_1_TVALID(dotProduct_i5_Output_1_TVALID),
    .Output_1_TREADY(dotProduct_i5_Output_1_TREADY),
    .Output_2_TDATA(dotProduct_i5_Output_2_TDATA),
    .Output_2_TVALID(dotProduct_i5_Output_2_TVALID),
    .Output_2_TREADY(dotProduct_i5_Output_2_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire dotProduct_i7_Input_1_stall_condition = (!state_200) && dotProduct_i7_Input_1_TREADY && empty_4;
  wire dotProduct_i7_Input_2_stall_condition = (!state_200) && dotProduct_i7_Input_2_TREADY && empty_17;
  wire dotProduct_i7_Output_1_stall_condition = (!state_200) && dotProduct_i7_Output_1_TVALID && full_11;
  wire dotProduct_i7_Output_2_stall_condition = (!state_200) && dotProduct_i7_Output_2_TVALID && full_12;

  stall_cnt stall_cnt_dotProduct_i7_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(dotProduct_i7_Input_1_stall_condition || dotProduct_i7_Input_2_stall_condition),
    .output_stall_condition(dotProduct_i7_Output_1_stall_condition || dotProduct_i7_Output_2_stall_condition),
    .stall_cnt(stall_cnt_dotProduct_i7)
  );

  dotProduct_i7 dotProduct_i7_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(dotProduct_i7_Input_1_TDATA),
    .Input_1_TVALID(dotProduct_i7_Input_1_TVALID),
    .Input_1_TREADY(dotProduct_i7_Input_1_TREADY),
    .Input_2_TDATA(dotProduct_i7_Input_2_TDATA),
    .Input_2_TVALID(dotProduct_i7_Input_2_TVALID),
    .Input_2_TREADY(dotProduct_i7_Input_2_TREADY),
    .Output_1_TDATA(dotProduct_i7_Output_1_TDATA),
    .Output_1_TVALID(dotProduct_i7_Output_1_TVALID),
    .Output_1_TREADY(dotProduct_i7_Output_1_TREADY),
    .Output_2_TDATA(dotProduct_i7_Output_2_TDATA),
    .Output_2_TVALID(dotProduct_i7_Output_2_TVALID),
    .Output_2_TREADY(dotProduct_i7_Output_2_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire output_collect_Input_1_stall_condition = (!state_200) && output_collect_Input_1_TREADY && empty_6;
  wire output_collect_Input_2_stall_condition = (!state_200) && output_collect_Input_2_TREADY && empty_8;
  wire output_collect_Input_3_stall_condition = (!state_200) && output_collect_Input_3_TREADY && empty_10;
  wire output_collect_Input_4_stall_condition = (!state_200) && output_collect_Input_4_TREADY && empty_12;
  wire output_collect_Output_1_stall_condition = (!state_200) && output_collect_Output_1_TVALID && full_13;

  stall_cnt stall_cnt_output_collect_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(output_collect_Input_1_stall_condition || output_collect_Input_2_stall_condition || output_collect_Input_3_stall_condition || output_collect_Input_4_stall_condition),
    .output_stall_condition(output_collect_Output_1_stall_condition),
    .stall_cnt(stall_cnt_output_collect)
  );

  output_collect output_collect_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(output_collect_Input_1_TDATA),
    .Input_1_TVALID(output_collect_Input_1_TVALID),
    .Input_1_TREADY(output_collect_Input_1_TREADY),
    .Input_2_TDATA(output_collect_Input_2_TDATA),
    .Input_2_TVALID(output_collect_Input_2_TVALID),
    .Input_2_TREADY(output_collect_Input_2_TREADY),
    .Input_3_TDATA(output_collect_Input_3_TDATA),
    .Input_3_TVALID(output_collect_Input_3_TVALID),
    .Input_3_TREADY(output_collect_Input_3_TREADY),
    .Input_4_TDATA(output_collect_Input_4_TDATA),
    .Input_4_TVALID(output_collect_Input_4_TVALID),
    .Input_4_TREADY(output_collect_Input_4_TREADY),
    .Output_1_TDATA(output_collect_Output_1_TDATA),
    .Output_1_TVALID(output_collect_Output_1_TVALID),
    .Output_1_TREADY(output_collect_Output_1_TREADY),
    .ap_rst_n(~reset_200)
  );

  wire sigmoid_Input_1_stall_condition = (!state_200) && sigmoid_Input_1_TREADY && empty_5;
  wire sigmoid_Input_2_stall_condition = (!state_200) && sigmoid_Input_2_TREADY && empty_7;
  wire sigmoid_Input_3_stall_condition = (!state_200) && sigmoid_Input_3_TREADY && empty_9;
  wire sigmoid_Input_4_stall_condition = (!state_200) && sigmoid_Input_4_TREADY && empty_11;
  wire sigmoid_Output_1_stall_condition = (!state_200) && sigmoid_Output_1_TVALID && full_14;
  wire sigmoid_Output_2_stall_condition = (!state_200) && sigmoid_Output_2_TVALID && full_15;
  wire sigmoid_Output_3_stall_condition = (!state_200) && sigmoid_Output_3_TVALID && full_16;
  wire sigmoid_Output_4_stall_condition = (!state_200) && sigmoid_Output_4_TVALID && full_17;

  stall_cnt stall_cnt_sigmoid_inst(
    .clk(clk_200),
    .reset(reset_ap_start_200),
    .state(state_200),
    .input_stall_condition(sigmoid_Input_1_stall_condition || sigmoid_Input_2_stall_condition || sigmoid_Input_3_stall_condition || sigmoid_Input_4_stall_condition),
    .output_stall_condition(sigmoid_Output_1_stall_condition || sigmoid_Output_2_stall_condition || sigmoid_Output_3_stall_condition || sigmoid_Output_4_stall_condition),
    .stall_cnt(stall_cnt_sigmoid)
  );

  sigmoid sigmoid_inst(
    .ap_clk(clk_200),
    .ap_start(1'b1),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .Input_1_TDATA(sigmoid_Input_1_TDATA),
    .Input_1_TVALID(sigmoid_Input_1_TVALID),
    .Input_1_TREADY(sigmoid_Input_1_TREADY),
    .Input_2_TDATA(sigmoid_Input_2_TDATA),
    .Input_2_TVALID(sigmoid_Input_2_TVALID),
    .Input_2_TREADY(sigmoid_Input_2_TREADY),
    .Input_3_TDATA(sigmoid_Input_3_TDATA),
    .Input_3_TVALID(sigmoid_Input_3_TVALID),
    .Input_3_TREADY(sigmoid_Input_3_TREADY),
    .Input_4_TDATA(sigmoid_Input_4_TDATA),
    .Input_4_TVALID(sigmoid_Input_4_TVALID),
    .Input_4_TREADY(sigmoid_Input_4_TREADY),
    .Output_1_TDATA(sigmoid_Output_1_TDATA),
    .Output_1_TVALID(sigmoid_Output_1_TVALID),
    .Output_1_TREADY(sigmoid_Output_1_TREADY),
    .Output_2_TDATA(sigmoid_Output_2_TDATA),
    .Output_2_TVALID(sigmoid_Output_2_TVALID),
    .Output_2_TREADY(sigmoid_Output_2_TREADY),
    .Output_3_TDATA(sigmoid_Output_3_TDATA),
    .Output_3_TVALID(sigmoid_Output_3_TVALID),
    .Output_3_TREADY(sigmoid_Output_3_TREADY),
    .Output_4_TDATA(sigmoid_Output_4_TDATA),
    .Output_4_TVALID(sigmoid_Output_4_TVALID),
    .Output_4_TREADY(sigmoid_Output_4_TREADY),
    .ap_rst_n(~reset_200)
  );


  assign Output_2_TDATA  = DMA_Input_1_TDATA;
  assign Output_2_TVALID = DMA_Input_1_TVALID;
  assign DMA_Input_1_TREADY = Output_2_TREADY;

  assign DMA_Output_1_TDATA  = Input_2_TDATA;
  assign DMA_Output_1_TVALID = Input_2_TVALID;
  assign Input_2_TREADY = DMA_Output_1_TREADY;

endmodule
