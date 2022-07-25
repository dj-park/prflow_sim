#include "./typedefs.h"

void config_parser(
		hls::stream< bit64 > & input1,
		hls::stream< bit512 > & input2,
		hls::stream< bit64 > & output1,
		hls::stream< bit32 > & output2,
		hls::stream< bit64 > & output3

		)
{
#pragma HLS INTERFACE axis register_mode=both register port=input1
#pragma HLS INTERFACE axis register_mode=both register port=input2
#pragma HLS INTERFACE axis register_mode=both register port=output1
#pragma HLS INTERFACE axis register_mode=both register port=output2
#pragma HLS INTERFACE axis register_mode=both register port=output3

	bit64 v1_buffer[256];
	unsigned int config_num;
	unsigned int data_num;

	config_num = input1.read();
	data_num = input1.read();


	// read the configuration packets
	for(int i=0; i<config_num; i++){
#pragma HLS PIPELINE II=1
		v1_buffer[i] = input1.read();
	}

	// send the configuration packets to the BFT
	for(int i=0; i<config_num; i++){
#pragma HLS PIPELINE II=1
		output1.write(v1_buffer[i]);
	}

	// send the configuration packets back to the host
	output3.write(config_num);
	output3.write(data_num);
	for(int i=0; i<config_num; i++){
#pragma HLS PIPELINE II=1
		output3.write(i);
	}

	// transfer the data to the kernel
	for(int i=0; i<data_num; i++){
		bit512 in_tmp;
		in_tmp = input2.read();
		for(int j=0; j<16; j++){
#pragma HLS PIPELINE II=1
			output2.write(in_tmp(32*j+31, 32*j));
		}
	}
}
