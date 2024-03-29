void data32to512(
        hls::stream< bit32 > & Input_1,
        hls::stream< bit512 > & Output_1
        )
{
#pragma HLS INTERFACE axis register_mode=both register port=Input_1
#pragma HLS INTERFACE axis register_mode=both register port=Output_1

    bit512 out_tmp;
    for(int i=0; i<16; i++){
#pragma HLS PIPELINE II=1
        out_tmp(i*32+31, i*32) = Input_1.read();
    }
    Output_1.write(out_tmp);
}
