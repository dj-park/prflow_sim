#include <iostream>
#include "hls_stream.h"

using namespace std;

struct __cosim_T_8__ {char data[8];};
extern "C" void fpga_fifo_push_8(__cosim_T_8__* val, hls::stream<__cosim_T_8__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_8(__cosim_T_8__* val, hls::stream<__cosim_T_8__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_8(hls::stream<__cosim_T_8__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_8(hls::stream<__cosim_T_8__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_64__ {char data[64];};
extern "C" void fpga_fifo_push_64(__cosim_T_64__* val, hls::stream<__cosim_T_64__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_64(__cosim_T_64__* val, hls::stream<__cosim_T_64__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_64(hls::stream<__cosim_T_64__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_64(hls::stream<__cosim_T_64__>* fifo) {
  return fifo->exist();
}
