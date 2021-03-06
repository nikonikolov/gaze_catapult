// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   lb3314@EEWS104A-019
//  Generated date: Tue Mar 24 16:06:17 2015
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


  // Interconnect Declarations
  reg [9:0] regs_regs_1_sg3_sva;
  reg [9:0] regs_regs_1_sg1_sva;
  reg [9:0] regs_regs_1_sg5_sva;
  reg [9:0] ACC1_asn_itm;
  reg [9:0] ACC1_asn_2_itm;
  reg [9:0] ACC1_asn_3_itm;
  reg [7:0] reg_vout_rsc_mgc_out_stdreg_d_tmp;
  reg reg_vout_rsc_mgc_out_stdreg_d_tmp_1;
  reg reg_vout_rsc_mgc_out_stdreg_d_tmp_2;
  reg [3:0] reg_vout_rsc_mgc_out_stdreg_d_tmp_4;
  reg [7:0] reg_vout_rsc_mgc_out_stdreg_d_tmp_7;
  reg reg_vout_rsc_mgc_out_stdreg_d_tmp_8;
  reg reg_vout_rsc_mgc_out_stdreg_d_tmp_9;
  wire [10:0] ACC1_acc_psp;
  wire [11:0] nl_ACC1_acc_psp;
  wire [11:0] ACC1_acc_12_sdt;
  wire [12:0] nl_ACC1_acc_12_sdt;
  wire [11:0] ACC1_acc_8_sdt;
  wire [12:0] nl_ACC1_acc_8_sdt;


  // Interconnect Declarations for Component Instantiations 
  assign vout_rsc_mgc_out_stdreg_d = {reg_vout_rsc_mgc_out_stdreg_d_tmp , reg_vout_rsc_mgc_out_stdreg_d_tmp_1
      , reg_vout_rsc_mgc_out_stdreg_d_tmp_2 , (reg_vout_rsc_mgc_out_stdreg_d_tmp_7[7:4])
      , reg_vout_rsc_mgc_out_stdreg_d_tmp_4 , reg_vout_rsc_mgc_out_stdreg_d_tmp_1
      , reg_vout_rsc_mgc_out_stdreg_d_tmp_2 , reg_vout_rsc_mgc_out_stdreg_d_tmp_7
      , reg_vout_rsc_mgc_out_stdreg_d_tmp_8 , reg_vout_rsc_mgc_out_stdreg_d_tmp_9};
  assign nl_ACC1_acc_psp = (ACC1_acc_12_sdt[11:1]) + 11'b10000000001;
  assign ACC1_acc_psp = nl_ACC1_acc_psp[10:0];
  assign nl_ACC1_acc_12_sdt = conv_u2u_11_12(conv_u2u_10_11(~ (vin_rsc_mgc_in_wire_d[59:50]))
      + conv_u2u_10_11(ACC1_asn_3_itm)) + conv_u2u_11_12(ACC1_acc_8_sdt[11:1]);
  assign ACC1_acc_12_sdt = nl_ACC1_acc_12_sdt[11:0];
  assign nl_ACC1_acc_8_sdt = conv_u2u_11_12(conv_u2u_10_11(~ (vin_rsc_mgc_in_wire_d[29:20]))
      + conv_u2u_10_11(~ (vin_rsc_mgc_in_wire_d[89:80]))) + conv_u2u_11_12(conv_u2u_10_11(ACC1_asn_itm)
      + conv_u2u_10_11(ACC1_asn_2_itm));
  assign ACC1_acc_8_sdt = nl_ACC1_acc_8_sdt[11:0];
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      ACC1_asn_3_itm <= 10'b0;
      ACC1_asn_itm <= 10'b0;
      ACC1_asn_2_itm <= 10'b0;
      regs_regs_1_sg3_sva <= 10'b0;
      regs_regs_1_sg5_sva <= 10'b0;
      regs_regs_1_sg1_sva <= 10'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp <= 8'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_1 <= 1'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_2 <= 1'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_4 <= 4'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_7 <= 8'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_8 <= 1'b0;
      reg_vout_rsc_mgc_out_stdreg_d_tmp_9 <= 1'b0;
    end
    else begin
      if ( en ) begin
        ACC1_asn_3_itm <= regs_regs_1_sg3_sva;
        ACC1_asn_itm <= regs_regs_1_sg1_sva;
        ACC1_asn_2_itm <= regs_regs_1_sg5_sva;
        regs_regs_1_sg3_sva <= vin_rsc_mgc_in_wire_d[59:50];
        regs_regs_1_sg5_sva <= vin_rsc_mgc_in_wire_d[89:80];
        regs_regs_1_sg1_sva <= vin_rsc_mgc_in_wire_d[29:20];
        reg_vout_rsc_mgc_out_stdreg_d_tmp <= (ACC1_acc_psp[7:0]) | ({4'b0 , (signext_4_1(ACC1_acc_psp[10]))});
        reg_vout_rsc_mgc_out_stdreg_d_tmp_1 <= (ACC1_acc_12_sdt[0]) | (ACC1_acc_psp[9]);
        reg_vout_rsc_mgc_out_stdreg_d_tmp_2 <= (ACC1_acc_8_sdt[0]) | (ACC1_acc_psp[8]);
        reg_vout_rsc_mgc_out_stdreg_d_tmp_4 <= (ACC1_acc_psp[3:0]) | (signext_4_1(ACC1_acc_psp[10]));
        reg_vout_rsc_mgc_out_stdreg_d_tmp_7 <= ACC1_acc_psp[7:0];
        reg_vout_rsc_mgc_out_stdreg_d_tmp_8 <= ACC1_acc_12_sdt[0];
        reg_vout_rsc_mgc_out_stdreg_d_tmp_9 <= ACC1_acc_8_sdt[0];
      end
    end
  end

  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
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



