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
#include "find_center.h"
#include <iostream>

// shift_class: page 119 HLS Blue Book
//#include "shift_class.h" 




#pragma hls_design top
void calc_center(ac_int<(COORD_WL+COORD_WL),false> *xyin, ac_int<(COORD_WL+COORD_WL),false> *xy_center, ac_int<(COORD_WL+COORD_WL),false> *xy_prev,   //xy coordinates
                bool *is_match, bool *in_the_box, bool *calculated, bool *calc_prev,                                                                  //bool vars
                ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avx_out, ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avy_out,                                     //average out
                ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avx_in, ac_fixed<(COORD_WL+FLOAT),FLOAT,false> *avy_in,                                       //average in
                ac_fixed<CMAX, false> *count_in, ac_fixed<CMAX, false> *count_out){                                                                   //count
   
   ac_int<(COORD_WL),false> xin, yin;
   
   
   // extract in X-Y coordinates
    xin = (*xyout).slc<COORD_WL>(0);
    yin = (*xyin).slc<COORD_WL>(10);
    ac_fixed<(COORD_WL+FLOAT),FLOAT,false> xtmp, ytmp;
    
    if(is_match){
        (*count_out)=(*count_in)+1;
        if((*count_out)==1){
            (*avx_out)=xin;
            (*avx_out)=yin;
        }
        
        else{
            (*avx_in)=((ac_fixed<(CMAX+1), 1, false>)(*avx_in))/(*count_out);
            (*avx_in)=((ac_fixed<(CMAX+1), 1, false>)(*avx_in))*(*count_in);
            xtmp=((ac_fixed<(COORD_WL+FLOAT),FLOAT,false>)(xin))/(*count_out);
            (*avx_out)=(*avx_in)+xtmp;
            
            
            (*avy_in)=((ac_fixed<(CMAX+1), 1, false>)(*avy_in))/(*count_out);
            (*avy_in)=((ac_fixed<(CMAX+1), 1, false>)(*avy_in))*(*count_in);
            ytmp=((ac_fixed<(COORD_WL+FLOAT),FLOAT,false>)(yin))/(*count_out);
            (*avy_out)=(*avy_in)+ytmp;
        }
        
    }
   
    (*calculated)=!(*in_the_box);
    
    if( (*calculated) && (!(*calculated_prev)) ){   //make sure you make right condition for the other case 
        ac_int<COORD_WL,false> xout, yout;
        xout=(ac_int<COORD_WL,false>)(*avx_out);
        yout=(ac_int<COORD_WL,false>)(*avy_out);
        (*xy_center) = ((((ac_int<COORD_WL, false>)xout) << COORD_WL) | (ac_int<COORD_WL, false>)yout);
        (*count)
        
    }   
   
   //convert ac_fixed to int using slc fn
   
    ac_int<16, false> red, green, blue, r[KERNEL_WIDTH], g[KERNEL_WIDTH], b[KERNEL_WIDTH];
    

// #if 1: use filter
// #if 0: copy input to output bypassing filter
#if 1

    // shifts pixels from KERNEL_WIDTH rows and keeps KERNEL_WIDTH columns (KERNEL_WIDTHxKERNEL_WIDTH pixels stored)
    static shift_class<ac_int<PIXEL_WL*KERNEL_WIDTH,false>, KERNEL_WIDTH> regs;
    int i;

    FRAME: for(int p = 0; p < NUM_PIXELS; p++) {
		// init
		red = 0; 
		green = 0; 
		blue = 0;
		RESET: for(i = 0; i < KERNEL_WIDTH; i++) {
			r[i] = 0;
			g[i] = 0;
			b[i] = 0;
		}
	    
		// shift input data in the filter fifo
		regs << vin[p]; // advance the pointer address by the pixel number (testbench/simulation only)
		// accumulate
		ACC1: for(i = 0; i < KERNEL_WIDTH; i++) {
			// current line
			r[0] += (regs[i].slc<COLOUR_WL>(2*COLOUR_WL));
			g[0] += (regs[i].slc<COLOUR_WL>(COLOUR_WL));
			b[0] += (regs[i].slc<COLOUR_WL>(0));
			// the line before ...
			r[1] += (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + PIXEL_WL));
			g[1] += (regs[i].slc<COLOUR_WL>(COLOUR_WL + PIXEL_WL));
			b[1] += (regs[i].slc<COLOUR_WL>(0 + PIXEL_WL));
			// the line before ...
			r[2] += (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + 2*PIXEL_WL));
			g[2] += (regs[i].slc<COLOUR_WL>(COLOUR_WL + 2*PIXEL_WL)) ;
			b[2] += (regs[i].slc<COLOUR_WL>(0 + 2*PIXEL_WL)) ;
			// the line before ... 
			r[3] += (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + 3*PIXEL_WL));
			g[3] += (regs[i].slc<COLOUR_WL>(COLOUR_WL + 3*PIXEL_WL)) ;
			b[3] += (regs[i].slc<COLOUR_WL>(0 + 3*PIXEL_WL)) ;
			// the line before ...
			r[4] += (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + 4*PIXEL_WL));
			g[4] += (regs[i].slc<COLOUR_WL>(COLOUR_WL + 4*PIXEL_WL)) ;
			b[4] += (regs[i].slc<COLOUR_WL>(0 + 4*PIXEL_WL)) ;
		}
		// add the accumualted value for all processed lines
		ACC2: for(i = 0; i < KERNEL_WIDTH; i++) {    
			red += r[i];
			green += g[i];
			blue += b[i];
		}
		// normalize result
		red /= KERNEL_NUMEL;
		green /= KERNEL_NUMEL;
		blue /= KERNEL_NUMEL;
	    
		// group the RGB components into a single signal
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
