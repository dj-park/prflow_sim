    in1[0].range(63, 32) = 0x00000000;
    in1[0].range(31,  0) = 0x00000011;
    in1[1].range(63, 32) = 0x00000000;
    in1[1].range(31,  0) = INPUT_SIZE;
    in1[2].range(63, 32) = 0x00000000;
    in1[2].range(31,  0) = NUM_IS_DONE;
    in1[3].range(63, 32) = 0x00000000;
    in1[3].range(31,  0) = OUTPUT_SIZE;
    in1[4].range(63, 32) = 0x00000000;
    in1[4].range(31,  0) = NUM_TOTAL_CNT;

//output_data.Output_1->DMA.Input_1
    in1[5].range(63, 32) = 0x0000b000; 
    in1[5].range(31,  0) = 0x90900fe0;
    in1[6].range(63, 32) = 0x00000880; 
    in1[6].range(31,  0) = 0x2b480000;
//coloringFB_i1.Output_1->output_data.Input_1
    in1[7].range(63, 32) = 0x0000a000; 
    in1[7].range(31,  0) = 0x9b100fe0;
    in1[8].range(63, 32) = 0x0000b080; 
    in1[8].range(31,  0) = 0x2a480000;
//prj_rast1.Output_1->rast2_i1.Input_1
    in1[9].range(63, 32) = 0x00004000; 
    in1[9].range(31,  0) = 0x96100fe0;
    in1[10].range(63, 32) = 0x00006080; 
    in1[10].range(31,  0) = 0x24480000;
//DMA.Output_1->prj_rast1.Input_1
    in1[11].range(63, 32) = 0x00000800; 
    in1[11].range(31,  0) = 0x94100fe0;
    in1[12].range(63, 32) = 0x00004080; 
    in1[12].range(31,  0) = 0x20c80000;
//rast2_i1.Output_1->zculling_i1.Input_1
    in1[13].range(63, 32) = 0x00006000; 
    in1[13].range(31,  0) = 0x98100fe0;
    in1[14].range(63, 32) = 0x00008080; 
    in1[14].range(31,  0) = 0x26480000;
//zculling_i1.Output_1->coloringFB_i1.Input_1
    in1[15].range(63, 32) = 0x00008000; 
    in1[15].range(31,  0) = 0x9a100fe0;
    in1[16].range(63, 32) = 0x0000a080; 
    in1[16].range(31,  0) = 0x28480000;
    // start page20; 
    in1[17].range(63, 32) = 0x0000a002; 
    in1[17].range(31,  0) = 0x00000000;
    // start page22; 
    in1[18].range(63, 32) = 0x0000b002; 
    in1[18].range(31,  0) = 0x00000000;
    // start page8; 
    in1[19].range(63, 32) = 0x00004002; 
    in1[19].range(31,  0) = 0x00000000;
    // start page12; 
    in1[20].range(63, 32) = 0x00006002; 
    in1[20].range(31,  0) = 0x00000000;
    // start page16; 
    in1[21].range(63, 32) = 0x00008002; 
    in1[21].range(31,  0) = 0x00000000;