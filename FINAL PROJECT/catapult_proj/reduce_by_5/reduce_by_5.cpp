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
#include "reduce_by_5.h"
#include <iostream>

// shift_class: page 119 HLS Blue Book
#include "shift_class.h" 

#pragma hls_design top

void reduce_by_5(ac_int<PIXEL_WL*KERNEL_WIDTH,false> vin[NUM_PIXELS], ac_int<1, false> *clk_reg, ac_int<1,false> vout[NUM_PIXELS])
{
    static ac_int<5, false> count;
    count=0;
    static shift_class<ac_int<PIXEL_WL*KERNEL_WIDTH,false>, 1> regs;
    static ac_int<1, false> result[160];
    int i;
    static bool out;
    //out=false;

    FRAME: for(int p = 0; p < NUM_PIXELS; p++) {
        
       // (*clk_reg)=0;
		
		regs << vin[p]; // advance the pointer address by the pixel number (testbench/simulation only)
        //accumulate count
		
		ACC1: for(i = 0; i < KERNEL_WIDTH; i++) {
			if(regs.slc<PIXEL_WL>(i*PIXEL_WL)!=0) count++;
		}
	
		//reset count, clock register and output
		if(p%25==24){
		  if(count>19) result[(p%160)/5]=1;
		  else result[(p%160)/5]=1;
		  //clk_reg=1;
		  count=0;
		}
        
        if(p>0 && p%25==0) clk_reg=1;
        else clk_reg=0;
               
        vout[p]=result[(p%160)/5];
    
    }
}   


// end of file
