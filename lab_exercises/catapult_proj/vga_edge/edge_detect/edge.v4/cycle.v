// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   lb3314@EEWS104A-019
//  Generated date: Tue Mar 24 17:03:15 2015
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    edge_core
// ------------------------------------------------------------------


module edge_core (
  clk, en, arst_n, vin_rsc_mgc_in_wire_d, vout_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [89:0] vin_rsc_mgc_in_wire_d;
  output [29:0] vout_rsc_mgc_out_stdreg_d;
  reg [29:0] vout_rsc_mgc_out_stdreg_d;



  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : core
    // Interconnect Declarations
    reg [8:0] regs_regs_1_sg3_sva;
    reg [9:0] regs_regs_1_sg1_sva;
    reg [9:0] regs_regs_1_sg5_sva;
    reg [69:0] regs_regs_0_sg1_sva_1;
    reg [9:0] red_4_sva;
    reg [9:0] ACC1_asn_itm;
    reg [9:0] ACC1_asn_2_itm;
    reg [8:0] ACC1_asn_3_itm;
    reg [9:0] regs_regs_0_sg1_sva_sg4;
    reg [8:0] regs_regs_0_sg1_sva_sg2;
    reg [9:0] regs_regs_0_sg1_sva_2;
    reg [9:0] slc_slc;

    begin : core_rlpExit
      forever begin : core_rlp
        // C-Step 0 of Loop 'core_rlp'
        regs_regs_1_sg3_sva = 9'b0;
        regs_regs_1_sg1_sva = 10'b0;
        regs_regs_1_sg5_sva = 10'b0;
        regs_regs_0_sg1_sva_sg2 = 9'b0;
        regs_regs_0_sg1_sva_2 = 10'b0;
        regs_regs_0_sg1_sva_sg4 = 10'b0;
        begin : mainExit
          forever begin : main
            // C-Step 0 of Loop 'main'
            ACC1_asn_itm = regs_regs_1_sg1_sva;
            ACC1_asn_2_itm = regs_regs_1_sg5_sva;
            ACC1_asn_3_itm = regs_regs_1_sg3_sva;
            regs_regs_1_sg5_sva = regs_regs_0_sg1_sva_sg4;
            regs_regs_1_sg3_sva = regs_regs_0_sg1_sva_sg2;
            regs_regs_1_sg1_sva = regs_regs_0_sg1_sva_2;
            begin : waitLoop0Exit
              forever begin : waitLoop0
                @(posedge clk or negedge ( arst_n ));
                if ( ~ arst_n )
                  disable core_rlpExit;
                if ( en )
                  disable waitLoop0Exit;
              end
            end
            // C-Step 1 of Loop 'main'
            regs_regs_0_sg1_sva_1 = vin_rsc_mgc_in_wire_d[89:20];
            slc_slc = readslicef_11_10_1((({ACC1_asn_itm , 1'b1}) + ({ACC1_asn_2_itm
                , 1'b1})));
            red_4_sva = ({((slc_slc[9:1]) + (~ (regs_regs_0_sg1_sva_1[38:30])) +
                ACC1_asn_3_itm + 9'b1) , (readslicef_2_1_1((({(slc_slc[0]) , 1'b1})
                + 2'b11)))}) + (readslicef_11_10_1((({(~ (regs_regs_0_sg1_sva_1[9:0]))
                , 1'b1}) + ({(~ (regs_regs_0_sg1_sva_1[69:60])) , 1'b1}))));
            vout_rsc_mgc_out_stdreg_d <= {red_4_sva , red_4_sva , red_4_sva};
            regs_regs_0_sg1_sva_sg2 = regs_regs_0_sg1_sva_1[38:30];
            regs_regs_0_sg1_sva_2 = regs_regs_0_sg1_sva_1[9:0];
            regs_regs_0_sg1_sva_sg4 = regs_regs_0_sg1_sva_1[69:60];
          end
        end
      end
    end
    slc_slc = 10'b0;
    regs_regs_0_sg1_sva_2 = 10'b0;
    regs_regs_0_sg1_sva_sg2 = 9'b0;
    regs_regs_0_sg1_sva_sg4 = 10'b0;
    ACC1_asn_3_itm = 9'b0;
    ACC1_asn_2_itm = 10'b0;
    ACC1_asn_itm = 10'b0;
    red_4_sva = 10'b0;
    regs_regs_0_sg1_sva_1 = 70'b0;
    regs_regs_1_sg5_sva = 10'b0;
    regs_regs_1_sg1_sva = 10'b0;
    regs_regs_1_sg3_sva = 9'b0;
    vout_rsc_mgc_out_stdreg_d <= 30'b0;
  end


  function [9:0] readslicef_11_10_1;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_11_10_1 = tmp[9:0];
  end
  endfunction


  function [0:0] readslicef_2_1_1;
    input [1:0] vector;
    reg [1:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_2_1_1 = tmp[0:0];
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    edge_0
//  Generated from file(s):
//    4) $PROJECT_HOME/edge.c
// ------------------------------------------------------------------


module edge_0 (
  vin_rsc_z, vout_rsc_z, clk, en, arst_n
);
  input [89:0] vin_rsc_z;
  output [29:0] vout_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [89:0] vin_rsc_mgc_in_wire_d;
  wire [29:0] vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(90)) vin_rsc_mgc_in_wire (
      .d(vin_rsc_mgc_in_wire_d),
      .z(vin_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(30)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  edge_core edge_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vin_rsc_mgc_in_wire_d(vin_rsc_mgc_in_wire_d),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d)
    );
endmodule


