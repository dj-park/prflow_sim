#include "./typedefs.h"
#include "./input_data.h"

#define INPUT_SIZE (NUM_3D_TRI/4)
#define OUTPUT_SIZE 1024
#define NUM_IS_DONE 5
#define NUM_TOTAL_CNT 30


void data_gen_config(
		  hls::stream<ap_uint<64> > & Output_1,
		  hls::stream<ap_uint<512> > & Output_2){
#pragma HLS INTERFACE axis register_mode=both register port=Output_1
#pragma HLS INTERFACE axis register_mode=both register port=Output_2

    bit64 tmp1;
    bit512 tmp2;

    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = 0x00000011;
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
    tmp1.range(63, 32) = 0x0000b000;
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000880;
    tmp1.range(31,  0) = 0x2b480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a000;
    tmp1.range(31,  0) = 0x9b100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b080;
    tmp1.range(31,  0) = 0x2a480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004000;
    tmp1.range(31,  0) = 0x96100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006080;
    tmp1.range(31,  0) = 0x24480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000800;
    tmp1.range(31,  0) = 0x94100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004080;
    tmp1.range(31,  0) = 0x20c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006000;
    tmp1.range(31,  0) = 0x98100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008080;
    tmp1.range(31,  0) = 0x26480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008000;
    tmp1.range(31,  0) = 0x9a100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a080;
    tmp1.range(31,  0) = 0x28480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);

    tmp2 = 0;
    data_gen_label0:
    for ( int i = 0; i < NUM_3D_TRI/4; i++){
        tmp2.range(128*0+7,  128*0+0)   = triangle_3ds[4*i+0].x0;
        tmp2.range(128*0+15, 128*0+8)   = triangle_3ds[4*i+0].y0;
        tmp2.range(128*0+23, 128*0+16)  = triangle_3ds[4*i+0].z0;
        tmp2.range(128*0+31, 128*0+24)  = triangle_3ds[4*i+0].x1;
        tmp2.range(128*0+39, 128*0+32)  = triangle_3ds[4*i+0].y1;
        tmp2.range(128*0+47, 128*0+40)  = triangle_3ds[4*i+0].z1;
        tmp2.range(128*0+55, 128*0+48)  = triangle_3ds[4*i+0].x2;
        tmp2.range(128*0+63, 128*0+56)  = triangle_3ds[4*i+0].y2;
        tmp2.range(128*0+71, 128*0+64)  = triangle_3ds[4*i+0].z2;
        tmp2.range(128*0+127,128*0+72)  = 0;

        tmp2.range(128*1+7,  128*1+0)   = triangle_3ds[4*i+1].x0;
        tmp2.range(128*1+15, 128*1+8)   = triangle_3ds[4*i+1].y0;
        tmp2.range(128*1+23, 128*1+16)  = triangle_3ds[4*i+1].z0;
        tmp2.range(128*1+31, 128*1+24)  = triangle_3ds[4*i+1].x1;
        tmp2.range(128*1+39, 128*1+32)  = triangle_3ds[4*i+1].y1;
        tmp2.range(128*1+47, 128*1+40)  = triangle_3ds[4*i+1].z1;
        tmp2.range(128*1+55, 128*1+48)  = triangle_3ds[4*i+1].x2;
        tmp2.range(128*1+63, 128*1+56)  = triangle_3ds[4*i+1].y2;
        tmp2.range(128*1+71, 128*1+64)  = triangle_3ds[4*i+1].z2;
        tmp2.range(128*1+127,128*1+72)  = 0;

        tmp2.range(128*2+7,  128*2+0)   = triangle_3ds[4*i+2].x0;
        tmp2.range(128*2+15, 128*2+8)   = triangle_3ds[4*i+2].y0;
        tmp2.range(128*2+23, 128*2+16)  = triangle_3ds[4*i+2].z0;
        tmp2.range(128*2+31, 128*2+24)  = triangle_3ds[4*i+2].x1;
        tmp2.range(128*2+39, 128*2+32)  = triangle_3ds[4*i+2].y1;
        tmp2.range(128*2+47, 128*2+40)  = triangle_3ds[4*i+2].z1;
        tmp2.range(128*2+55, 128*2+48)  = triangle_3ds[4*i+2].x2;
        tmp2.range(128*2+63, 128*2+56)  = triangle_3ds[4*i+2].y2;
        tmp2.range(128*2+71, 128*2+64)  = triangle_3ds[4*i+2].z2;
        tmp2.range(128*2+127,128*2+72)  = 0;

        tmp2.range(128*3+7,  128*3+0)   = triangle_3ds[4*i+3].x0;
        tmp2.range(128*3+15, 128*3+8)   = triangle_3ds[4*i+3].y0;
        tmp2.range(128*3+23, 128*3+16)  = triangle_3ds[4*i+3].z0;
        tmp2.range(128*3+31, 128*3+24)  = triangle_3ds[4*i+3].x1;
        tmp2.range(128*3+39, 128*3+32)  = triangle_3ds[4*i+3].y1;
        tmp2.range(128*3+47, 128*3+40)  = triangle_3ds[4*i+3].z1;
        tmp2.range(128*3+55, 128*3+48)  = triangle_3ds[4*i+3].x2;
        tmp2.range(128*3+63, 128*3+56)  = triangle_3ds[4*i+3].y2;
        tmp2.range(128*3+71, 128*3+64)  = triangle_3ds[4*i+3].z2;
        tmp2.range(128*3+127,128*3+72)  = 0;

        Output_2.write(tmp2);
    }
    // is_done configuration

	// tmp1.range(63, 32) = 0x00001004; // page2
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
	// tmp1.range(63, 32) = 0x00001804; // page3
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
	// tmp1.range(63, 32) = 0x00002004; // page4
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
//	tmp1.range(63, 32) = 0x00002804; // page5
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00003004; // page6
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00003804; // page7
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004004; // page8
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00004804; // page9
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00005004; // page10
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00005804; // page11
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
   tmp1.range(63, 32) = 0x00006004; // page12
   tmp1.range(31,  0) = 0x90900fe0;
   Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00006804; // page13
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00007004; // page14
    // tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00007804; // page15
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008004; // page16
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00008804; // page17
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00009004; // page18
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x00009804; // page19
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000A004; // page20
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x0000A804; // page21
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000B004; // page22
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    // tmp1.range(63, 32) = 0x0000B804; // page23
    // tmp1.range(31,  0) = 0x90900fe0;
    // Output_1.write(tmp1);
}
