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


#include <ac_fixed.h>
#include "erosion.h"
#include <iostream>

// shift_class: page 119 HLS Blue Book
#include "shift_class.h" 


/*INSTRUCTIONS:
	proper function declaration
	loop for going through whole image, if needed
	proper dimensions of the loop - divide by 5 each component
	shift register?*/



#pragma hls_design top

//modify size of array	
void detect_skin(ac_int<1*KERNEL_WIDTH,false> vin[NUM_PIXELS], ac_int<1*KERNEL_WIDTH,false> vout[NUM_PIXELS])
{
    bool apply;

    ac_int<13, false> Ytmp, Cbtmp, Crtmp, r[KERNEL_WIDTH], g[KERNEL_WIDTH], b[KERNEL_WIDTH];


// #if 1: use filter
// #if 0: copy input to output bypassing filter
#if 1

    // shifts pixels from KERNEL_WIDTH rows and keeps KERNEL_WIDTH columns (KERNEL_WIDTHxKERNEL_WIDTH pixels stored)
    static shift_class<ac_int<1*KERNEL_WIDTH,false>, KERNEL_WIDTH> regs;
    //NOTE: initialized to 0 and retains state between function calls

    int i, j;

    FRAME: for(int p = 0; p < NUM_PIXELS; p++) {
		// init
		apply=true;
	    
		// shift input data in the filter fifo
		regs << vin[p]; // advance the pointer address by the pixel number (testbench/simulation only)
		// accumulate
		ACC1: 

		for(i = 0; i < KERNEL_WIDTH; i++) {
			//(regs[i].slc<COLOUR_WL>(0)	0 - LSB to start, COLOUR_WL - width of the cut value, i specifies the column
			if(regs[i].slc<1>(0)!=1){
				apply=false;
				break;
			}

			if(regs[i].slc<1>(1)!=1){
				apply=false;
				break;
			}

			if(regs[i].slc<1>(2)!=1){
				apply=false;
				break;
			}
				
		}

		//have to output array
		//might be able to output only one value, like the blur
		if(apply){
			for(i=0; i<KERNEL_WIDTH; i++){
				vout[p+i]=111;	//check dereference is true
			}	
		}

		if(apply){
			for(i=0; i<KERNEL_WIDTH; i++){
				vout[p+i]=000;
			}	
		}
		
		vout[p] = ((((ac_int<PIXEL_WL, false>)red) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)green) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)blue);
	    
    }
}
     
     
     
     
     
     
#else    
// display input  (test only)
    FRAME: for(p = 0; p < NUM_PIXELS; p++) {
        // copy the value of each colour component from the input stream
        red = vin[p].slc<COLOUR_WL>(2*COLOUR_WL);
        green = vin[p].slc<COLOUR_WL>(COLOUR_WL);
        blue = vin[p].slc<COLOUR_WL>(0);

		// combine the 3 color components into 1 signal only
        vout[p] = ((((ac_int<PIXEL_WL, false>)red) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)green) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)blue);   
    }
}
#endif


// end of file
