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
//  File:           fin_center.h
//  Description:    vga blur - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives pixel matches and calculates their center
////////////////////////////////////////////////////////////////////////////////


#ifndef _FIND_CENTER
#define _FIND_CENTER

#include <ac_int.h>
#include <ac_fixed.h>
#include <iostream>

// total number of pixels from screen frame/image read in testbench

#define  COORD_WL          10
#define  FLOAT              2
#define  CMAX              19

void calc_center(ac_int<(COORD_WL+COORD_WL),false> *xyin, ac_int<(COORD_WL+COORD_WL),false> *xy_center, ac_int<(COORD_WL+COORD_WL),false> *xy_prev,   //xy coordinates
                bool *is_match, bool *in_the_box, bool *calculated, bool *calc_prev,                                                                  //bool vars
                ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avx_out, ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avy_out,                                     //average out
                ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avx_in, ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avy_in,                                       //average in
                ac_fixed<CMAX, false> *count_in, ac_fixed<CMAX, false> *count_out);                                                                   //count

#endif
