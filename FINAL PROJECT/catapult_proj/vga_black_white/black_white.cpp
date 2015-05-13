////////////////////////////////////////////////////////////////////////////////
//  _____                           _       _    _____      _ _
// |_   _|                         (_)     | |  / ____|    | | |
//   | |  _ __ ___  _ __   ___ _ __ _  __ _| | | |     ___ | | | ___  __ _  ___
//   | | | '_ ` _ \| '_ \ / _ \ '__| |/ _` | | | |    / _ \| | |/ _ \/ _` |/ _ \
//  _| |_| | | | | | |_) |  __/ |  | | (_| | | | |___| (_) | | |  __/ (_| |  __/
// |_____|_| |_| |_| .__/ \___|_|  |_|\__,_|_|  \_____\___/|_|_|\___|\__, |\___|
//                 | |                                                __/ |
//                 |_|                                               |___/
//  _                     _
// | |                   | |
// | |     ___  _ __   __| | ___  _ __
// | |    / _ \| '_ \ / _` |/ _ \| '_ \
// | |___| (_) | | | | (_| | (_) | | | |
// |______\___/|_| |_|\__,_|\___/|_| |_|
//
////////////////////////////////////////////////////////////////////////////////
//  File:           dot_product.cpp
//  Description:    dot product calculator
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////

#include "black_white.h"
#include "stdio.h"

#pragma design top
void black_white(ac_int<10, false> *input_r, ac_int<10, false> *input_g, ac_int<10, false> *input_b, ac_int<30, false> *output) {
  
  ac_int<12, false> result = input_r;
  result += input_g;
  result += input_b;
  
  result /= 3;
  
  ac_int<10, false> result_short = result;
  

  
  *output = ((((ac_int<PIXEL_WL, false>)result_short) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)result_short) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)result_short); 
}

// end of file
