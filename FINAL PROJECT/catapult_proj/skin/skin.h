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
//  File:           skin.h
//  Description:    vga blur - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a blured output
//299*R + 587*G + 114*B//////////////////////////////////////////////////////////////////////////////


#ifndef _SKIN
#define _SKIN

//#include <ac_int.h>
#include <ac_fixed.h>
#include <iostream>

// total number of pixels from screen frame/image read in testbench
//#define NUM_PIXELS (640*480)

//#define REGION      5
//#define KERNEL_NUMEL      (KERNEL_WIDTH * KERNEL_WIDTH)
#define COLOUR_WL         10
#define PIXEL_WL          (3 * COLOUR_WL)

#define  COORD_WL          10


void detect_skin(ac_int<PIXEL_WL, false> * pixin, ac_int<PIXEL_WL,false> *pixout);

#endif
