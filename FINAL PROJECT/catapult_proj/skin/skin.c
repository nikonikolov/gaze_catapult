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
//  File:           blur.cpp
//  Description:    video to vga blur filter - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a blured output
// based on the FIR design - page 230 of HLS Blue Book
////////////////////////////////////////////////////////////////////////////////
// Catapult Project options
// Constraint Editor:
//  Frequency: 27 MHz
//  Top design: vga_blur
//  clk>reset sync: disable; reset async: enable; enable: enable
// Architecture Constraints:
//  interface>vin: wordlength = 150, streaming = 150
//  interface>vout: wordlength = 30, streaming = 30
//  core>main: pipeline + distributed + merged
//  core>main>frame: merged
//  core>main>frame>shift, mac1, mac2: unroll + merged
////////////////////////////////////////////////////////////////////////////////


//#include <ac_fixed.h>
#include "skin.h"
#include <iostream>

// shift_class: page 119 HLS Blue Book
//#include "shift_class.h" 


/*INSTRUCTIONS:
	chnage input and output for final version
	proper function declaration
	do you need to keep track of x and y?
	*/



#pragma hls_design top
void detect_skin(ac_int<PIXEL_WL, false> * pixin, ac_int<PIXEL_WL,false> *pixout)
{
    ac_int<20, false> Y, Cb, Cr;
    ac_int<10, false> R, G, B;
    R=(*pixin).slc<COLOUR_WL>(2*COLOUR_WL);
    G=(*pixin).slc<COLOUR_WL>(COLOUR_WL);
    B=(*pixin).slc<COLOUR_WL>(0);
      
    //note that actual values will be these divided by 1000
    Y  =  299*R + 587*G + 114*B;
	Cb = -169*R - 332*G + 501*B + 512000;
	Cr =  500*R - 419*G -  81*B + 512000;

	//if(Cb>=415000 && Cb<=485000 && Cr>=585000 && Cr<=675000 )		//Adi's values
	//if(Cb>=77 && Cb<=127 && Cr>=133 && Cr<=173 && Y>80 )	//original values in 0 to 255
	if(Cb>=309000 && Cb<=510000 && Cr>=534000 && Cr<=695000 && Y>321000 ){
		(*pixout)=1073741823; //2^30 -1
	}
	else{
		(*pixout)=0;
	}   

}



// end of file
