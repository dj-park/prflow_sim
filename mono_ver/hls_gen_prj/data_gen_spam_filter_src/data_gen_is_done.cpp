#include "./typedefs.h"

#define CONFIG_SIZE 1
#define INPUT_SIZE 720071 
//                  = ((64*1024*5+32)*4500/4/32)/16
#define NUM_IS_DONE 7
// Please hardcode OUTPUT_SIZE
#define OUTPUT_SIZE 64
//                  = (64*512/32/16)
#define NUM_TOTAL_CNT 62


void data_gen_config(
          hls::stream<ap_uint<64> > & Output_1,
          hls::stream<ap_uint<512> > & Output_2){
#pragma HLS INTERFACE axis register_mode=both register port=Output_1
#pragma HLS INTERFACE axis register_mode=both register port=Output_2

    bit64 tmp1;
    bit512 tmp2;

    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = INPUT_SIZE;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = NUM_IS_DONE;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = OUTPUT_SIZE;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = NUM_TOTAL_CNT;
    Output_1.write(tmp1);


    tmp2 = 0;

    // spam filter is NOT data-dependent application.
    // If we want to check full/empty/read/stall counters, random input values like below are fine.
    for ( int i = 0; i < INPUT_SIZE; i++){
        tmp2.range(511,  0)   = 7;
        Output_2.write(tmp2);
    }

}
