// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   nn1114@EEWS104A-002
//  Generated date: Fri Mar 06 14:58:20 2015
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    dot_product_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module dot_product_core_fsm (
  clk, en, arst_n, fsm_output
);
  input clk;
  input en;
  input arst_n;
  output [5:0] fsm_output;
  reg [5:0] fsm_output;


  // FSM State Type Declaration for dot_product_core_fsm_1
  parameter
    st_main = 3'd0,
    st_main_1 = 3'd1,
    st_main_2 = 3'd2,
    st_main_3 = 3'd3,
    st_main_4 = 3'd4,
    st_main_5 = 3'd5,
    state_x = 3'b000;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : dot_product_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 6'b1;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 6'b10;
        state_var_NS = st_main_2;
      end
      st_main_2 : begin
        fsm_output = 6'b100;
        state_var_NS = st_main_3;
      end
      st_main_3 : begin
        fsm_output = 6'b1000;
        state_var_NS = st_main_4;
      end
      st_main_4 : begin
        fsm_output = 6'b10000;
        state_var_NS = st_main_5;
      end
      st_main_5 : begin
        fsm_output = 6'b100000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 6'b000000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= st_main;
    end
    else if ( en ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    dot_product_core
// ------------------------------------------------------------------


module dot_product_core (
  clk, en, arst_n, input_a_rsc_mgc_in_wire_d, input_b_rsc_mgc_in_wire_d, output_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [7:0] input_a_rsc_mgc_in_wire_d;
  input [7:0] input_b_rsc_mgc_in_wire_d;
  output [7:0] output_rsc_mgc_out_stdreg_d;
  reg [7:0] output_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [5:0] fsm_output;
  reg [7:0] MAC_4_mul_itm;
  reg [7:0] MAC_acc_6_itm;
  reg [7:0] MAC_acc_itm;
  wire [7:0] z_out;
  wire [8:0] nl_z_out;
  wire [7:0] MAC_4_mul_itm_1;
  wire [15:0] nl_MAC_4_mul_itm_1;

  wire[7:0] mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  dot_product_core_fsm dot_product_core_fsm_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .fsm_output(fsm_output)
    );
  assign nl_MAC_4_mul_itm_1 = input_a_rsc_mgc_in_wire_d * input_b_rsc_mgc_in_wire_d;
  assign MAC_4_mul_itm_1 = nl_MAC_4_mul_itm_1[7:0];
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      output_rsc_mgc_out_stdreg_d <= 8'b0;
      MAC_4_mul_itm <= 8'b0;
      MAC_acc_6_itm <= 8'b0;
      MAC_acc_itm <= 8'b0;
    end
    else begin
      if ( en ) begin
        output_rsc_mgc_out_stdreg_d <= MUX_v_8_2_2({output_rsc_mgc_out_stdreg_d ,
            (MAC_acc_itm + z_out)}, fsm_output[4]);
        MAC_4_mul_itm <= MAC_4_mul_itm_1;
        MAC_acc_6_itm <= z_out;
        MAC_acc_itm <= MUX_v_8_2_2({MAC_acc_itm , z_out}, fsm_output[2]);
      end
    end
  end
  assign mux_2_nl = MUX_v_8_2_2({MAC_4_mul_itm , MAC_acc_6_itm}, fsm_output[2]);
  assign nl_z_out = (mux_2_nl) + MAC_4_mul_itm_1;
  assign z_out = nl_z_out[7:0];

  function [7:0] MUX_v_8_2_2;
    input [15:0] inputs;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[15:8];
      end
      1'b1 : begin
        result = inputs[7:0];
      end
      default : begin
        result = inputs[15:8];
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    dot_product
//  Generated from file(s):
//    2) $PROJECT_HOME/../student_files_2015/prj1/dot_product_source/dot_product.cpp
// ------------------------------------------------------------------


module dot_product (
  input_a_rsc_z, input_b_rsc_z, output_rsc_z, clk, en, arst_n
);
  input [7:0] input_a_rsc_z;
  input [7:0] input_b_rsc_z;
  output [7:0] output_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [7:0] input_a_rsc_mgc_in_wire_d;
  wire [7:0] input_b_rsc_mgc_in_wire_d;
  wire [7:0] output_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(8)) input_a_rsc_mgc_in_wire (
      .d(input_a_rsc_mgc_in_wire_d),
      .z(input_a_rsc_z)
    );
  mgc_in_wire #(.rscid(2),
  .width(8)) input_b_rsc_mgc_in_wire (
      .d(input_b_rsc_mgc_in_wire_d),
      .z(input_b_rsc_z)
    );
  mgc_out_stdreg #(.rscid(3),
  .width(8)) output_rsc_mgc_out_stdreg (
      .d(output_rsc_mgc_out_stdreg_d),
      .z(output_rsc_z)
    );
  dot_product_core dot_product_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .input_a_rsc_mgc_in_wire_d(input_a_rsc_mgc_in_wire_d),
      .input_b_rsc_mgc_in_wire_d(input_b_rsc_mgc_in_wire_d),
      .output_rsc_mgc_out_stdreg_d(output_rsc_mgc_out_stdreg_d)
    );
endmodule


