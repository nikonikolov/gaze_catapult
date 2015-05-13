// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   nn1114@EEWS104A-002
//  Generated date: Wed May 13 16:06:17 2015
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    value_to_pix_core
// ------------------------------------------------------------------


module value_to_pix_core (
  clk, en, arst_n, vin_rsc_mgc_in_wire_d, pixout_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input vin_rsc_mgc_in_wire_d;
  output [29:0] pixout_rsc_mgc_out_stdreg_d;
  reg [29:0] pixout_rsc_mgc_out_stdreg_d;



  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : core
    begin : mainExit
      forever begin : main
        // C-Step 0 of Loop 'main'
        begin : waitLoop0Exit
          forever begin : waitLoop0
            @(posedge clk or negedge ( arst_n ));
            if ( ~ arst_n )
              disable mainExit;
            if ( en )
              disable waitLoop0Exit;
          end
        end
        // C-Step 1 of Loop 'main'
        pixout_rsc_mgc_out_stdreg_d <= {{29{vin_rsc_mgc_in_wire_d}}, vin_rsc_mgc_in_wire_d};
      end
    end
    pixout_rsc_mgc_out_stdreg_d <= 30'b0;
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    value_to_pix
//  Generated from file(s):
//    3) $PROJECT_HOME/value_to_pix.c
// ------------------------------------------------------------------


module value_to_pix (
  vin_rsc_z, pixout_rsc_z, clk, en, arst_n
);
  input vin_rsc_z;
  output [29:0] pixout_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire vin_rsc_mgc_in_wire_d;
  wire [29:0] pixout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(1)) vin_rsc_mgc_in_wire (
      .d(vin_rsc_mgc_in_wire_d),
      .z(vin_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(30)) pixout_rsc_mgc_out_stdreg (
      .d(pixout_rsc_mgc_out_stdreg_d),
      .z(pixout_rsc_z)
    );
  value_to_pix_core value_to_pix_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vin_rsc_mgc_in_wire_d(vin_rsc_mgc_in_wire_d),
      .pixout_rsc_mgc_out_stdreg_d(pixout_rsc_mgc_out_stdreg_d)
    );
endmodule


