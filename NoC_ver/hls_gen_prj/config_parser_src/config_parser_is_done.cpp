#include "./typedefs.h"

void config_parser(
		hls::stream< bit64 > & input1,
		hls::stream< bit512 > & input2,
		hls::stream< bool > & input3,
		hls::stream< bit64 > & output1,
		hls::stream< bit32 > & output2,
		hls::stream< bit32 > & output3,
		hls::stream< ap_uint<16> > & output4
)
{
#pragma HLS INTERFACE axis register_mode=both register port=input1
#pragma HLS INTERFACE axis register_mode=both register port=input2
#pragma HLS INTERFACE axis register_mode=both register port=input3
#pragma HLS INTERFACE axis register_mode=both register port=output1
#pragma HLS INTERFACE axis register_mode=both register port=output2
#pragma HLS INTERFACE axis register_mode=both register port=output3
#pragma HLS INTERFACE axis register_mode=both register port=output4

	bit64 v1_buffer[256];
	unsigned int config_num;
	unsigned int data_num;
	unsigned int num_ops;
	unsigned int output_size;
	ap_uint<16> num_total_cnt;

	config_num = input1.read();
	data_num = input1.read();
	num_ops = input1.read();
	output_size = input1.read();
	num_total_cnt = input1.read();

	// 1) Read the configuration packets
	for(int i=0; i<config_num; i++){
#pragma HLS PIPELINE II=1
		v1_buffer[i] = input1.read();
	}

	// 2) Send the configuration packets to the BFT
	for(int i=0; i<config_num; i++){
#pragma HLS PIPELINE II=1
		output1.write(v1_buffer[i]);
	}

	// 3) Send output_size, num_cnt_read to leaf_interface_1(DMA operator's)
	output3.write(output_size);
	output4.write(num_total_cnt);

	// 4) Transfer the data to the kernel
	for(int i=0; i<data_num; i++){
		bit512 in_tmp;
		in_tmp = input2.read();
		for(int j=0; j<16; j++){
#pragma HLS PIPELINE II=1
			output2.write(in_tmp(32*j+31, 32*j));
		}
	}

	// 5) Read the configuration packets for is_done mode (per operator)
	for(int i=0; i<num_ops; i++){
#pragma HLS PIPELINE II=1
		v1_buffer[i] = input1.read();
	}

//	bool is_done_detected = edge2pulse(is_done);
	bool is_done = input3.read();
	if(is_done){
		// 6) Send the configuration packets for is_done mode (per operator)
		for(int i=0; i<num_ops; i++){
#pragma HLS PIPELINE II=1
			output1.write(v1_buffer[i]);
		}
	}
}





//bool edge2pulse(bool signal){
//#pragma HLS INTERFACE ap_ctrl_none port=return
//	static ap_int<3> reg=0;
//	reg = reg << 1;
//	reg.bit(0)=signal;
//	if(!reg.bit(2) & reg.bit(1)) return true;
//	else return false;
//}
//
//
