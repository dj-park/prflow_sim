/*===============================================================*/
/*                                                               */
/*                          test.h                               */
/*                                                               */
/*                     Test data for BNN                         */
/*                                                               */
/*===============================================================*/
#include "typedefs.h"


//const ap_uint<8> expected_labels[9600] = {
//    #include "expected.dat"
//};

const ap_uint<8> test_data[20 * 32 * 32 * 3] = {
    #include "test_data_0.dat"
};
