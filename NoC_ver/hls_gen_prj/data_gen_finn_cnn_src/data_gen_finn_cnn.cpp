#include "./typedefs.h"
#include "test_data.h"

#define NUM_TESTS 9600
//#define BATCH_SIZE 640
#define BATCH_SIZE 8
#define NUM_BATCHES 1
// 64 uint8 data in 512bit, so divide it by 64,
#define INPUT_SIZE BATCH_SIZE*32*32*3/64 // 384
// 64 uint8 output in 512bit, so divide it by 64
//#define OUTPUT_SIZE 10
#define OUTPUT_SIZE 1

void data_gen_config(
		  hls::stream<ap_uint<64> > & Output_1,
		  hls::stream<ap_uint<512> > & Output_2){
#pragma HLS INTERFACE axis register_mode=both register port=Output_1
#pragma HLS INTERFACE axis register_mode=both register port=Output_2

    bit64 tmp1;
    bit512 tmp2;


    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = 0x00000035;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = INPUT_SIZE;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = 17;  // NUM OPERATORS
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = OUTPUT_SIZE;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000000;
    tmp1.range(31,  0) = 102;  // NUM_TOTAL_CNT , 2.5*total_ports + num_ops
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b800;
    tmp1.range(31,  0) = 0x97100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007080;
    tmp1.range(31,  0) = 0x2bc80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007800;
    tmp1.range(31,  0) = 0x96100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006080;
    tmp1.range(31,  0) = 0x27c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a000;
    tmp1.range(31,  0) = 0x9b900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b880;
    tmp1.range(31,  0) = 0x2a480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007000;
    tmp1.range(31,  0) = 0x97900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007880;
    tmp1.range(31,  0) = 0x27480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005000;
    tmp1.range(31,  0) = 0x95900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005880;
    tmp1.range(31,  0) = 0x25480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005800;
    tmp1.range(31,  0) = 0x94100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004080;
    tmp1.range(31,  0) = 0x25c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009800;
    tmp1.range(31,  0) = 0x98100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008080;
    tmp1.range(31,  0) = 0x29c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00002000;
    tmp1.range(31,  0) = 0x91900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001880;
    tmp1.range(31,  0) = 0x22480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009000;
    tmp1.range(31,  0) = 0x99900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009880;
    tmp1.range(31,  0) = 0x29480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000800;
    tmp1.range(31,  0) = 0x99100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009080;
    tmp1.range(31,  0) = 0x20c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006000;
    tmp1.range(31,  0) = 0x95100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005080;
    tmp1.range(31,  0) = 0x26480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001800;
    tmp1.range(31,  0) = 0x91100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001080;
    tmp1.range(31,  0) = 0x21c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004000;
    tmp1.range(31,  0) = 0x92100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00002080;
    tmp1.range(31,  0) = 0x24480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003800;
    tmp1.range(31,  0) = 0x93100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003080;
    tmp1.range(31,  0) = 0x23c80000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003000;
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00000880;
    tmp1.range(31,  0) = 0x23480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b000;
    tmp1.range(31,  0) = 0x9a100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a080;
    tmp1.range(31,  0) = 0x2b480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008000;
    tmp1.range(31,  0) = 0x9b100fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b080;
    tmp1.range(31,  0) = 0x28480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001000;
    tmp1.range(31,  0) = 0x93900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003880;
    tmp1.range(31,  0) = 0x21480000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000a002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000b802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00002002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00001002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003802;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003002;
    tmp1.range(31,  0) = 0x00000000;
    Output_1.write(tmp1);



    tmp2 = 0;
    // Prepare input data for this batch
    for (int i = 0; i < NUM_BATCHES; i++){
		for (int j = 0; j < INPUT_SIZE; j++){
			tmp2.range(8*0+7, 8*0+0) = test_data[INPUT_SIZE*64*i + 64*j + 0];
			tmp2.range(8*1+7, 8*1+0) = test_data[INPUT_SIZE*64*i + 64*j + 1];
			tmp2.range(8*2+7, 8*2+0) = test_data[INPUT_SIZE*64*i + 64*j + 2];
			tmp2.range(8*3+7, 8*3+0) = test_data[INPUT_SIZE*64*i + 64*j + 3];
			tmp2.range(8*4+7, 8*4+0) = test_data[INPUT_SIZE*64*i + 64*j + 4];
			tmp2.range(8*5+7, 8*5+0) = test_data[INPUT_SIZE*64*i + 64*j + 5];
			tmp2.range(8*6+7, 8*6+0) = test_data[INPUT_SIZE*64*i + 64*j + 6];
			tmp2.range(8*7+7, 8*7+0) = test_data[INPUT_SIZE*64*i + 64*j + 7];
			tmp2.range(8*8+7, 8*8+0) = test_data[INPUT_SIZE*64*i + 64*j + 8];
			tmp2.range(8*9+7, 8*9+0) = test_data[INPUT_SIZE*64*i + 64*j + 9];
			tmp2.range(8*10+7, 8*10+0) = test_data[INPUT_SIZE*64*i + 64*j + 10];
			tmp2.range(8*11+7, 8*11+0) = test_data[INPUT_SIZE*64*i + 64*j + 11];
			tmp2.range(8*12+7, 8*12+0) = test_data[INPUT_SIZE*64*i + 64*j + 12];
			tmp2.range(8*13+7, 8*13+0) = test_data[INPUT_SIZE*64*i + 64*j + 13];
			tmp2.range(8*14+7, 8*14+0) = test_data[INPUT_SIZE*64*i + 64*j + 14];
			tmp2.range(8*15+7, 8*15+0) = test_data[INPUT_SIZE*64*i + 64*j + 15];
			tmp2.range(8*16+7, 8*16+0) = test_data[INPUT_SIZE*64*i + 64*j + 16];
			tmp2.range(8*17+7, 8*17+0) = test_data[INPUT_SIZE*64*i + 64*j + 17];
			tmp2.range(8*18+7, 8*18+0) = test_data[INPUT_SIZE*64*i + 64*j + 18];
			tmp2.range(8*19+7, 8*19+0) = test_data[INPUT_SIZE*64*i + 64*j + 19];
			tmp2.range(8*20+7, 8*20+0) = test_data[INPUT_SIZE*64*i + 64*j + 20];
			tmp2.range(8*21+7, 8*21+0) = test_data[INPUT_SIZE*64*i + 64*j + 21];
			tmp2.range(8*22+7, 8*22+0) = test_data[INPUT_SIZE*64*i + 64*j + 22];
			tmp2.range(8*23+7, 8*23+0) = test_data[INPUT_SIZE*64*i + 64*j + 23];
			tmp2.range(8*24+7, 8*24+0) = test_data[INPUT_SIZE*64*i + 64*j + 24];
			tmp2.range(8*25+7, 8*25+0) = test_data[INPUT_SIZE*64*i + 64*j + 25];
			tmp2.range(8*26+7, 8*26+0) = test_data[INPUT_SIZE*64*i + 64*j + 26];
			tmp2.range(8*27+7, 8*27+0) = test_data[INPUT_SIZE*64*i + 64*j + 27];
			tmp2.range(8*28+7, 8*28+0) = test_data[INPUT_SIZE*64*i + 64*j + 28];
			tmp2.range(8*29+7, 8*29+0) = test_data[INPUT_SIZE*64*i + 64*j + 29];
			tmp2.range(8*30+7, 8*30+0) = test_data[INPUT_SIZE*64*i + 64*j + 30];
			tmp2.range(8*31+7, 8*31+0) = test_data[INPUT_SIZE*64*i + 64*j + 31];
			tmp2.range(8*32+7, 8*32+0) = test_data[INPUT_SIZE*64*i + 64*j + 32];
			tmp2.range(8*33+7, 8*33+0) = test_data[INPUT_SIZE*64*i + 64*j + 33];
			tmp2.range(8*34+7, 8*34+0) = test_data[INPUT_SIZE*64*i + 64*j + 34];
			tmp2.range(8*35+7, 8*35+0) = test_data[INPUT_SIZE*64*i + 64*j + 35];
			tmp2.range(8*36+7, 8*36+0) = test_data[INPUT_SIZE*64*i + 64*j + 36];
			tmp2.range(8*37+7, 8*37+0) = test_data[INPUT_SIZE*64*i + 64*j + 37];
			tmp2.range(8*38+7, 8*38+0) = test_data[INPUT_SIZE*64*i + 64*j + 38];
			tmp2.range(8*39+7, 8*39+0) = test_data[INPUT_SIZE*64*i + 64*j + 39];
			tmp2.range(8*40+7, 8*40+0) = test_data[INPUT_SIZE*64*i + 64*j + 40];
			tmp2.range(8*41+7, 8*41+0) = test_data[INPUT_SIZE*64*i + 64*j + 41];
			tmp2.range(8*42+7, 8*42+0) = test_data[INPUT_SIZE*64*i + 64*j + 42];
			tmp2.range(8*43+7, 8*43+0) = test_data[INPUT_SIZE*64*i + 64*j + 43];
			tmp2.range(8*44+7, 8*44+0) = test_data[INPUT_SIZE*64*i + 64*j + 44];
			tmp2.range(8*45+7, 8*45+0) = test_data[INPUT_SIZE*64*i + 64*j + 45];
			tmp2.range(8*46+7, 8*46+0) = test_data[INPUT_SIZE*64*i + 64*j + 46];
			tmp2.range(8*47+7, 8*47+0) = test_data[INPUT_SIZE*64*i + 64*j + 47];
			tmp2.range(8*48+7, 8*48+0) = test_data[INPUT_SIZE*64*i + 64*j + 48];
			tmp2.range(8*49+7, 8*49+0) = test_data[INPUT_SIZE*64*i + 64*j + 49];
			tmp2.range(8*50+7, 8*50+0) = test_data[INPUT_SIZE*64*i + 64*j + 50];
			tmp2.range(8*51+7, 8*51+0) = test_data[INPUT_SIZE*64*i + 64*j + 51];
			tmp2.range(8*52+7, 8*52+0) = test_data[INPUT_SIZE*64*i + 64*j + 52];
			tmp2.range(8*53+7, 8*53+0) = test_data[INPUT_SIZE*64*i + 64*j + 53];
			tmp2.range(8*54+7, 8*54+0) = test_data[INPUT_SIZE*64*i + 64*j + 54];
			tmp2.range(8*55+7, 8*55+0) = test_data[INPUT_SIZE*64*i + 64*j + 55];
			tmp2.range(8*56+7, 8*56+0) = test_data[INPUT_SIZE*64*i + 64*j + 56];
			tmp2.range(8*57+7, 8*57+0) = test_data[INPUT_SIZE*64*i + 64*j + 57];
			tmp2.range(8*58+7, 8*58+0) = test_data[INPUT_SIZE*64*i + 64*j + 58];
			tmp2.range(8*59+7, 8*59+0) = test_data[INPUT_SIZE*64*i + 64*j + 59];
			tmp2.range(8*60+7, 8*60+0) = test_data[INPUT_SIZE*64*i + 64*j + 60];
			tmp2.range(8*61+7, 8*61+0) = test_data[INPUT_SIZE*64*i + 64*j + 61];
			tmp2.range(8*62+7, 8*62+0) = test_data[INPUT_SIZE*64*i + 64*j + 62];
			tmp2.range(8*63+7, 8*63+0) = test_data[INPUT_SIZE*64*i + 64*j + 63];
				//			tmp2.range(8*k+7, 8*k+0) = test_data[INPUT_SIZE*64*i + 64*j + k];
		//                in2[i][j](8*k+7, 8*k+0) = test_data[INPUT_SIZE*64*i + 64*j + k]; // The first data is the lowest bits
	//		}
			Output_2.write(tmp2);
		}
    }

    // is_done configuration
	tmp1.range(63, 32) = 0x00001004; // page2
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
	tmp1.range(63, 32) = 0x00001804; // page3
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
	tmp1.range(63, 32) = 0x00002004; // page4
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//	tmp1.range(63, 32) = 0x00002804; // page5
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003004; // page6
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00003804; // page7
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00004004; // page8
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00004804; // page9
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005004; // page10
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00005804; // page11
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00006004; // page12
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00006804; // page13
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007004; // page14
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00007804; // page15
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00008004; // page16
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x00008804; // page17
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009004; // page18
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x00009804; // page19
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000A004; // page20
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
//    tmp1.range(63, 32) = 0x0000A804; // page21
//    tmp1.range(31,  0) = 0x90900fe0;
//    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000B004; // page22
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
    tmp1.range(63, 32) = 0x0000B804; // page23
    tmp1.range(31,  0) = 0x90900fe0;
    Output_1.write(tmp1);
}
