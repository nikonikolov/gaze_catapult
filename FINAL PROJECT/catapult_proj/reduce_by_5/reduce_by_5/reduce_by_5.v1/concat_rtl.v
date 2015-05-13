
//------> ./rtl_mgc_ioport.v 
//------------------------------------------------------------------
//                M G C _ I O P O R T _ C O M P S
//------------------------------------------------------------------

//------------------------------------------------------------------
//                       M O D U L E S
//------------------------------------------------------------------

//------------------------------------------------------------------
//-- INPUT ENTITIES
//------------------------------------------------------------------

module mgc_in_wire (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;

  wire               vd;
  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;

endmodule
//------------------------------------------------------------------

module mgc_chan_in (ld, vd, d, lz, vz, z, size, req_size, sizez, sizelz);

  parameter integer rscid = 1;
  parameter integer width = 8;
  parameter integer sz_width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;
  output [sz_width-1:0] size;
  input              req_size;
  input  [sz_width-1:0] sizez;
  output             sizelz;


  wire               vd;
  wire   [width-1:0] d;
  wire               lz;
  wire   [sz_width-1:0] size;
  wire               sizelz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;
  assign size = sizez;
  assign sizelz = req_size;

endmodule


//------------------------------------------------------------------
//-- OUTPUT ENTITIES
//------------------------------------------------------------------

module mgc_out_stdreg (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  input  [width-1:0] d;
  output             lz;
  input              vz;
  output [width-1:0] z;

  wire               vd;
  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;
  assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_out_prereg_en (ld, d, lz, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    wire               lz;
    wire   [width-1:0] z;

    assign z = d;
    assign lz = ld;

endmodule

//------------------------------------------------------------------
//-- INOUT ENTITIES
//------------------------------------------------------------------

module mgc_inout_stdreg_en (ldin, din, ldout, dout, lzin, lzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    output             lzin;
    output             lzout;
    inout  [width-1:0] z;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign z = ldout ? dout : {width{1'bz}};

endmodule

//------------------------------------------------------------------
module hid_tribuf( I_SIG, ENABLE, O_SIG);
  parameter integer width = 8;

  input [width-1:0] I_SIG;
  input ENABLE;
  inout [width-1:0] O_SIG;

  assign O_SIG = (ENABLE) ? I_SIG : { width{1'bz}};

endmodule
//------------------------------------------------------------------

module mgc_inout_stdreg_wait (ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;
    wire   ldout_and_vzout;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign vdout = vzout ;
    assign ldout_and_vzout = ldout && vzout ;

    hid_tribuf #(width) tb( .I_SIG(dout),
                            .ENABLE(ldout_and_vzout),
                            .O_SIG(z) );

endmodule

//------------------------------------------------------------------

module mgc_inout_buf_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    hid_tribuf #(width) tb( .I_SIG(z_buf),
                            .ENABLE((lzout_buf && (!ldin) && vzout) ),
                            .O_SIG(z)  );

    mgc_out_buf_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFF
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );


endmodule

module mgc_inout_fifo_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer ph_log2 = 3;     // log2(fifo_sz)
    parameter integer pwropt  = 0;     // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               comb;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    assign comb = (lzout_buf && (!ldin) && vzout);

    hid_tribuf #(width) tb2( .I_SIG(z_buf), .ENABLE(comb), .O_SIG(z)  );

    mgc_out_fifo_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
    )
    FIFO
    (
        .clk   (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );

endmodule

//------------------------------------------------------------------
//-- I/O SYNCHRONIZATION ENTITIES
//------------------------------------------------------------------

module mgc_io_sync (ld, lz);

    input  ld;
    output lz;

    assign lz = ld;

endmodule

module mgc_bsync_rdy (rd, rz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 0;

    input  rd;
    output rz;

    wire   rz;

    assign rz = rd;

endmodule

module mgc_bsync_vld (vd, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 0;
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule

module mgc_bsync_rv (rd, vd, rz, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 1;

    input  rd;
    output vd;
    output rz;
    input  vz;

    wire   vd;
    wire   rz;

    assign rz = rd;
    assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_sync (ldin, vdin, ldout, vdout);

  input  ldin;
  output vdin;
  input  ldout;
  output vdout;

  wire   vdin;
  wire   vdout;

  assign vdin = ldout;
  assign vdout = ldin;

endmodule

///////////////////////////////////////////////////////////////////////////////
// dummy function used to preserve funccalls for modulario
// it looks like a memory read to the caller
///////////////////////////////////////////////////////////////////////////////
module funccall_inout (d, ad, bd, z, az, bz);

  parameter integer ram_id = 1;
  parameter integer width = 8;
  parameter integer addr_width = 8;

  output [width-1:0]       d;
  input  [addr_width-1:0]  ad;
  input                    bd;
  input  [width-1:0]       z;
  output [addr_width-1:0]  az;
  output                   bz;

  wire   [width-1:0]       d;
  wire   [addr_width-1:0]  az;
  wire                     bz;

  assign d  = z;
  assign az = ad;
  assign bz = bd;

endmodule


///////////////////////////////////////////////////////////////////////////////
// inlinable modular io not otherwise found in mgc_ioport
///////////////////////////////////////////////////////////////////////////////

module modulario_en_in (vd, d, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output             vd;
  output [width-1:0] d;
  input              vz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               vd;

  assign d = z;
  assign vd = vz;

endmodule

//------> ./rtl_mgc_ioport_v2001.v 
//------------------------------------------------------------------

module mgc_out_reg_pos (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(posedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(posedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg_neg (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(negedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(negedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg (clk, en, arst, srst, ld, d, lz, z); // Not Supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;


    generate
    if (ph_clk == 1'b0)
    begin: NEG_EDGE

        mgc_out_reg_neg
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_neg_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    else
    begin: POS_EDGE

        mgc_out_reg_pos
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_pos_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    endgenerate

endmodule




//------------------------------------------------------------------

module mgc_out_buf_wait (clk, en, arst, srst, ld, vd, d, vz, lz, z); // Not supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    output             vd;
    input  [width-1:0] d;
    output             lz;
    input              vz;
    output [width-1:0] z;

    wire               filled;
    wire               filled_next;
    wire   [width-1:0] abuf;
    wire               lbuf;


    assign filled_next = (filled & (~vz)) | (filled & ld) | (ld & (~vz));

    assign lbuf = ld & ~(filled ^ vz);

    assign vd = vz | ~filled;

    assign lz = ld | filled;

    assign z = (filled) ? abuf : d;

    wire dummy;
    wire dummy_bufreg_lz;

    // Output registers:
    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (1'b1),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    STATREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (filled_next),
        .d       (1'b0),       // input d is unused
        .lz      (filled),
        .z       (dummy)            // output z is unused
    );

    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (lbuf),
        .d       (d),
        .lz      (dummy_bufreg_lz),
        .z       (abuf)
    );

endmodule

//------------------------------------------------------------------

module mgc_out_fifo_wait (clk, en, arst, srst, ld, vd, d, lz, vz,  z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1; // clock enable polarity
    parameter         ph_arst = 1'b1; // async reset polarity
    parameter         ph_srst = 1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt


    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;

    wire    [31:0]      size;


      // Output registers:
 mgc_out_fifo_wait_core#(
        .rscid   (rscid),
        .width   (width),
        .sz_width (32),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
        ) CORE (
        .clk (clk),
        .en (en),
        .arst (arst),
        .srst (srst),
        .ld (ld),
        .vd (vd),
        .d (d),
        .lz (lz),
        .vz (vz),
        .z (z),
        .size (size)
        );

endmodule



module mgc_out_fifo_wait_core (clk, en, arst, srst, ld, vd, d, lz, vz,  z, size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // size of port for elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt

   localparam integer  fifo_b = width * fifo_sz;

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;
    output    [sz_width-1:0]      size;

    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat_pre;
    wire     [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] en_l;
    reg      [(((fifo_sz > 0) ? fifo_sz : 1)-1)/8:0] en_l_s;

    reg       [width-1:0] buff_nxt;

    reg                   stat_nxt;
    reg                   stat_before;
    reg                   stat_after;
    reg                   en_l_var;

    integer               i;
    genvar                eni;

    wire [32:0]           size_t;
    reg [31:0]            count;
    reg [31:0]            count_t;
    reg [32:0]            n_elem;
// pragma translate_off
    reg [31:0]            peak;
// pragma translate_on

    wire [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] dummy_statreg_lz;
    wire [( (fifo_b > 0) ? fifo_b : 1)-1:0] dummy_bufreg_lz;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign vd = vz | ~stat[0];
      assign lz = ld | stat[fifo_sz-1];
      assign size_t = (count - (vz && stat[fifo_sz-1])) + ld;
      assign size = size_t[sz_width-1:0];
      assign z = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : d;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          if (i != 0)
            stat_before = stat[i-1];
          else
            stat_before = 1'b0;

          if (i != (fifo_sz-1))
            stat_after = stat[i+1];
          else
            stat_after = 1'b1;

          stat_nxt = stat_after &
                    (stat_before | (stat[i] & (~vz)) | (stat[i] & ld) | (ld & (~vz)));

          stat_pre[i] = stat_nxt;
          en_l_var = 1'b1;
          if (!stat_nxt)
            begin
              buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end
          else if (vz && stat_before)
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
          else if (ld && !((vz && stat_before) || ((!vz) && stat[i])))
            buff_nxt = d;
          else
            begin
              if (pwropt == 0)
                buff_nxt[0+:width] = buff[width*i+:width];
              else
                buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if ((stat_after == 1'b1) && (stat[i] == 1'b0))
            n_elem = ($unsigned(fifo_sz) - 1) - i;
        end

        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b1;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b0;

        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if ((i%'d2) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]|stat_pre[i-1]);
            else
              en_l_s[(i/8)-1] = en | ~(stat[i]|stat_pre[i-1]);
          end
        end

        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = { {(32-ph_log2){1'b0}}, fifo_sz};
        else
          count_t = n_elem[31:0];
        count = count_t;
// pragma translate_off
        if ( peak < count )
          peak = count;
// pragma translate_on
      end

      if (pwropt == 0)
      begin: NOCGFIFO
        // Output registers:
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        STATREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
        );
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_b),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        BUFREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre),
            .lz      (dummy_bufreg_lz[0]),
            .z       (buff)
        );
      end
      else
      begin: CGFIFO
        // Output registers:
        if ( pwropt > 1)
        begin: CGSTATFIFO2
          for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
          begin: pwroptGEN1
            mgc_out_reg
            #(
              .rscid   (rscid),
              .width   (1),
              .ph_clk  (ph_clk),
              .ph_en   (ph_en),
              .ph_arst (ph_arst),
              .ph_srst (ph_srst)
            )
            STATREG
            (
              .clk     (clk),
              .en      (en_l_s[eni/8]),
              .arst    (arst),
              .srst    (srst),
              .ld      (1'b1),
              .d       (stat_pre[eni]),
              .lz      (dummy_statreg_lz[eni]),
              .z       (stat[eni])
            );
          end
        end
        else
        begin: CGSTATFIFO
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          STATREG
          (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
          );
        end
        for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
        begin: pwroptGEN2
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (width),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          BUFREG
          (
            .clk     (clk),
            .en      (en_l[eni]),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre[width*eni+:width]),
            .lz      (dummy_bufreg_lz[eni]),
            .z       (buff[width*eni+:width])
          );
        end
      end
    end
    else
    begin: FEED_THRU
      assign vd = vz;
      assign lz = ld;
      assign z = d;
      assign size = ld && !vz;
    end
    endgenerate

endmodule

//------------------------------------------------------------------
//-- PIPE ENTITIES
//------------------------------------------------------------------
/*
 *
 *             _______________________________________________
 * WRITER    |                                               |          READER
 *           |           MGC_PIPE                            |
 *           |           __________________________          |
 *        --<| vdout  --<| vd ---------------  vz<|-----ldin<|---
 *           |           |      FIFO              |          |
 *        ---|>ldout  ---|>ld ---------------- lz |> ---vdin |>--
 *        ---|>dout -----|>d  ---------------- dz |> ----din |>--
 *           |           |________________________|          |
 *           |_______________________________________________|
 */
// two clock pipe
module mgc_pipe (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, size, req_size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter integer log2_sz = 3; // log2(fifo_sz)
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer pwropt  = 0; // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output [sz_width-1:0]      size;
    input              req_size;


    mgc_out_fifo_wait_core
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz),
        .pwropt   (pwropt)
    )
    FIFO
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (vdin),
        .vz      (ldin),
        .z       (din),
        .size    (size)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   nn1114@EEWS304-032
//  Generated date: Wed May 13 20:17:07 2015
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    reduce_by_5_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module reduce_by_5_core_fsm (
  clk, en, arst_n, fsm_output, st_FRAME_15_tr0
);
  input clk;
  input en;
  input arst_n;
  output [16:0] fsm_output;
  reg [16:0] fsm_output;
  input st_FRAME_15_tr0;


  // FSM State Type Declaration for reduce_by_5_core_fsm_1
  parameter
    st_main = 5'd0,
    st_FRAME = 5'd1,
    st_FRAME_1 = 5'd2,
    st_FRAME_2 = 5'd3,
    st_FRAME_3 = 5'd4,
    st_FRAME_4 = 5'd5,
    st_FRAME_5 = 5'd6,
    st_FRAME_6 = 5'd7,
    st_FRAME_7 = 5'd8,
    st_FRAME_8 = 5'd9,
    st_FRAME_9 = 5'd10,
    st_FRAME_10 = 5'd11,
    st_FRAME_11 = 5'd12,
    st_FRAME_12 = 5'd13,
    st_FRAME_13 = 5'd14,
    st_FRAME_14 = 5'd15,
    st_FRAME_15 = 5'd16,
    state_x = 5'b00000;

  reg [4:0] state_var;
  reg [4:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : reduce_by_5_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 17'b1;
        state_var_NS = st_FRAME;
      end
      st_FRAME : begin
        fsm_output = 17'b10;
        state_var_NS = st_FRAME_1;
      end
      st_FRAME_1 : begin
        fsm_output = 17'b100;
        state_var_NS = st_FRAME_2;
      end
      st_FRAME_2 : begin
        fsm_output = 17'b1000;
        state_var_NS = st_FRAME_3;
      end
      st_FRAME_3 : begin
        fsm_output = 17'b10000;
        state_var_NS = st_FRAME_4;
      end
      st_FRAME_4 : begin
        fsm_output = 17'b100000;
        state_var_NS = st_FRAME_5;
      end
      st_FRAME_5 : begin
        fsm_output = 17'b1000000;
        state_var_NS = st_FRAME_6;
      end
      st_FRAME_6 : begin
        fsm_output = 17'b10000000;
        state_var_NS = st_FRAME_7;
      end
      st_FRAME_7 : begin
        fsm_output = 17'b100000000;
        state_var_NS = st_FRAME_8;
      end
      st_FRAME_8 : begin
        fsm_output = 17'b1000000000;
        state_var_NS = st_FRAME_9;
      end
      st_FRAME_9 : begin
        fsm_output = 17'b10000000000;
        state_var_NS = st_FRAME_10;
      end
      st_FRAME_10 : begin
        fsm_output = 17'b100000000000;
        state_var_NS = st_FRAME_11;
      end
      st_FRAME_11 : begin
        fsm_output = 17'b1000000000000;
        state_var_NS = st_FRAME_12;
      end
      st_FRAME_12 : begin
        fsm_output = 17'b10000000000000;
        state_var_NS = st_FRAME_13;
      end
      st_FRAME_13 : begin
        fsm_output = 17'b100000000000000;
        state_var_NS = st_FRAME_14;
      end
      st_FRAME_14 : begin
        fsm_output = 17'b1000000000000000;
        state_var_NS = st_FRAME_15;
      end
      st_FRAME_15 : begin
        fsm_output = 17'b10000000000000000;
        if ( st_FRAME_15_tr0 ) begin
          state_var_NS = st_main;
        end
        else begin
          state_var_NS = st_FRAME;
        end
      end
      default : begin
        fsm_output = 17'b00000000000000000;
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
//  Design Unit:    reduce_by_5_core
// ------------------------------------------------------------------


module reduce_by_5_core (
  clk, en, arst_n, vin_rsc_mgc_in_wire_d, clk_reg_rsc_mgc_out_stdreg_d, vout_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [149:0] vin_rsc_mgc_in_wire_d;
  output clk_reg_rsc_mgc_out_stdreg_d;
  reg clk_reg_rsc_mgc_out_stdreg_d;
  output vout_rsc_mgc_out_stdreg_d;
  reg vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [16:0] fsm_output;
  wire [5:0] FRAME_acc_2_tmp;
  wire [6:0] nl_FRAME_acc_2_tmp;
  wire or_dcpl_24;
  wire or_dcpl_27;
  reg [4:0] count_sva;
  reg out_sva;
  reg [18:0] FRAME_p_1_sva;
  reg [4:0] count_sva_dfm;
  reg [4:0] count_sva_dfm_1;
  reg [4:0] count_sva_dfm_2;
  reg [4:0] count_sva_dfm_3;
  reg unequal_tmp_5;
  reg [18:0] FRAME_p_1_sva_1;
  reg [149:0] ACC1_if_io_read_vin_rsc_d_ftmp;
  reg [149:0] ACC1_if_io_read_vin_rsc_d_1_ftmp;
  reg [149:0] ACC1_if_io_read_vin_rsc_d_2_ftmp;
  reg [149:0] ACC1_if_io_read_vin_rsc_d_3_ftmp;
  reg [149:0] ACC1_if_io_read_vin_rsc_d_4_ftmp;
  reg [8:0] ACC1_if_acc_itm;
  reg [8:0] ACC1_if_acc_32_itm;
  reg [8:0] ACC1_if_acc_43_itm;
  reg [8:0] ACC1_if_acc_54_itm;
  reg [8:0] ACC1_if_acc_65_itm;
  wire [9:0] nl_ACC1_if_acc_65_itm;
  reg [6:0] ACC1_if_mul_28_itm;
  reg [6:0] ACC1_if_acc_67_itm;
  reg FRAME_if_1_and_itm;
  reg FRAME_slc_itm;
  reg [4:0] FRAME_and_itm;
  reg [6:0] ACC1_if_acc_16_psp;
  reg [6:0] ACC1_if_acc_27_psp;
  reg [6:0] ACC1_if_acc_38_psp;
  reg [6:0] ACC1_if_acc_49_psp;
  wire [29:0] ACC1_if_slc_4_svs;
  wire [29:0] ACC1_if_slc_3_svs;
  wire [29:0] ACC1_if_slc_2_svs;
  wire [29:0] ACC1_if_slc_1_svs;
  wire [29:0] ACC1_if_slc_svs;
  reg [4:0] reg_ACC1_4_if_acc_2_idiv_sva_tmp_14;
  reg [4:0] reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14;
  reg [4:0] reg_ACC1_2_if_acc_2_idiv_sva_tmp_14;
  reg [4:0] reg_ACC1_1_if_mul_cse_sva_tmp_14;
  reg [1:0] reg_ACC1_5_if_conc_idiv_sg1_sva_tmp_17;
  reg [1:0] reg_acc_imod_9_sva_tmp_1;
  wire [4:0] z_out;
  wire [5:0] nl_z_out;
  wire [7:0] z_out_1;
  wire [8:0] nl_z_out_1;
  wire [8:0] z_out_2;
  wire [9:0] nl_z_out_2;
  wire [6:0] z_out_3;
  wire [13:0] nl_z_out_3;
  wire [6:0] z_out_4;
  wire [7:0] nl_z_out_4;
  wire [7:0] z_out_5;
  wire [8:0] nl_z_out_5;
  wire [8:0] z_out_6;
  wire [9:0] nl_z_out_6;
  wire [24:0] ACC1_4_if_acc_2_idiv_sva_mx0w0;
  wire [25:0] nl_ACC1_4_if_acc_2_idiv_sva_mx0w0;
  wire [23:0] ACC1_3_if_conc_idiv_sg1_sva_mx0w0;
  wire [24:0] nl_ACC1_3_if_conc_idiv_sg1_sva_mx0w0;
  wire [24:0] ACC1_2_if_acc_2_idiv_sva_mx0w0;
  wire [25:0] nl_ACC1_2_if_acc_2_idiv_sva_mx0w0;
  wire [24:0] ACC1_1_if_mul_cse_sva_mx0w0;
  wire [49:0] nl_ACC1_1_if_mul_cse_sva_mx0w0;
  wire [22:0] ACC1_5_if_conc_idiv_sg1_sva;
  wire [23:0] nl_ACC1_5_if_conc_idiv_sg1_sva;
  wire [18:0] FRAME_p_1_sva_2;
  wire [19:0] nl_FRAME_p_1_sva_2;
  wire [5:0] acc_imod_1_sva;
  wire [6:0] nl_acc_imod_1_sva;
  wire [6:0] acc_psp_sva;
  wire [8:0] nl_acc_psp_sva;
  wire [3:0] FRAME_if_acc_11_sdt;
  wire [4:0] nl_FRAME_if_acc_11_sdt;
  wire [4:0] count_sva_dfm_4_mx0;
  wire nor_1_tmp;
  wire nor_2_tmp;
  wire or_48_tmp;
  wire nor_3_tmp;
  reg [6:0] reg_ACC1_if_acc_60_psp_cse;
  reg [6:0] reg_ACC1_if_mul_3_itm_cse;
  reg [1:0] reg_acc_imod_sva_1_cse;
  wire or_2_cse;
  wire or_3_cse;
  wire or_9_cse;

  wire[0:0] mux_nl;
  wire[2:0] mux_36_nl;
  wire[5:0] mux1h_25_nl;
  wire[0:0] mux_39_nl;
  wire[0:0] mux_42_nl;
  wire[0:0] mux1h_28_nl;
  wire[7:0] mux_40_nl;
  wire[7:0] mux1h_18_nl;
  wire[1:0] mux1h_19_nl;
  wire[1:0] mux_37_nl;
  wire[4:0] mux1h_20_nl;
  wire[4:0] mux_38_nl;
  wire[6:0] mux1h_21_nl;
  wire[6:0] mux_41_nl;
  wire[8:0] mux1h_23_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_reduce_by_5_core_fsm_inst_st_FRAME_15_tr0;
  assign nl_reduce_by_5_core_fsm_inst_st_FRAME_15_tr0 = ~ FRAME_slc_itm;
  reduce_by_5_core_fsm reduce_by_5_core_fsm_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .fsm_output(fsm_output),
      .st_FRAME_15_tr0(nl_reduce_by_5_core_fsm_inst_st_FRAME_15_tr0)
    );
  assign nor_1_tmp = ~((ACC1_if_slc_svs[29]) | (ACC1_if_slc_svs[28]) | (ACC1_if_slc_svs[27])
      | (ACC1_if_slc_svs[26]) | (ACC1_if_slc_svs[25]) | (ACC1_if_slc_svs[24]) | (ACC1_if_slc_svs[23])
      | (ACC1_if_slc_svs[22]) | (ACC1_if_slc_svs[21]) | (ACC1_if_slc_svs[20]) | (ACC1_if_slc_svs[19])
      | (ACC1_if_slc_svs[18]) | (ACC1_if_slc_svs[17]) | (ACC1_if_slc_svs[16]) | (ACC1_if_slc_svs[15])
      | (ACC1_if_slc_svs[14]) | (ACC1_if_slc_svs[13]) | (ACC1_if_slc_svs[12]) | (ACC1_if_slc_svs[11])
      | (ACC1_if_slc_svs[10]) | (ACC1_if_slc_svs[9]) | (ACC1_if_slc_svs[8]) | (ACC1_if_slc_svs[7])
      | (ACC1_if_slc_svs[6]) | (ACC1_if_slc_svs[5]) | (ACC1_if_slc_svs[4]) | (ACC1_if_slc_svs[3])
      | (ACC1_if_slc_svs[2]) | (ACC1_if_slc_svs[1]) | (ACC1_if_slc_svs[0]));
  assign nor_2_tmp = ~((ACC1_if_slc_1_svs[29]) | (ACC1_if_slc_1_svs[28]) | (ACC1_if_slc_1_svs[27])
      | (ACC1_if_slc_1_svs[26]) | (ACC1_if_slc_1_svs[25]) | (ACC1_if_slc_1_svs[24])
      | (ACC1_if_slc_1_svs[23]) | (ACC1_if_slc_1_svs[22]) | (ACC1_if_slc_1_svs[21])
      | (ACC1_if_slc_1_svs[20]) | (ACC1_if_slc_1_svs[19]) | (ACC1_if_slc_1_svs[18])
      | (ACC1_if_slc_1_svs[17]) | (ACC1_if_slc_1_svs[16]) | (ACC1_if_slc_1_svs[15])
      | (ACC1_if_slc_1_svs[14]) | (ACC1_if_slc_1_svs[13]) | (ACC1_if_slc_1_svs[12])
      | (ACC1_if_slc_1_svs[11]) | (ACC1_if_slc_1_svs[10]) | (ACC1_if_slc_1_svs[9])
      | (ACC1_if_slc_1_svs[8]) | (ACC1_if_slc_1_svs[7]) | (ACC1_if_slc_1_svs[6])
      | (ACC1_if_slc_1_svs[5]) | (ACC1_if_slc_1_svs[4]) | (ACC1_if_slc_1_svs[3])
      | (ACC1_if_slc_1_svs[2]) | (ACC1_if_slc_1_svs[1]) | (ACC1_if_slc_1_svs[0]));
  assign or_48_tmp = (fsm_output[13]) | (fsm_output[12]);
  assign nor_3_tmp = ~((ACC1_if_slc_2_svs[29]) | (ACC1_if_slc_2_svs[28]) | (ACC1_if_slc_2_svs[27])
      | (ACC1_if_slc_2_svs[26]) | (ACC1_if_slc_2_svs[25]) | (ACC1_if_slc_2_svs[24])
      | (ACC1_if_slc_2_svs[23]) | (ACC1_if_slc_2_svs[22]) | (ACC1_if_slc_2_svs[21])
      | (ACC1_if_slc_2_svs[20]) | (ACC1_if_slc_2_svs[19]) | (ACC1_if_slc_2_svs[18])
      | (ACC1_if_slc_2_svs[17]) | (ACC1_if_slc_2_svs[16]) | (ACC1_if_slc_2_svs[15])
      | (ACC1_if_slc_2_svs[14]) | (ACC1_if_slc_2_svs[13]) | (ACC1_if_slc_2_svs[12])
      | (ACC1_if_slc_2_svs[11]) | (ACC1_if_slc_2_svs[10]) | (ACC1_if_slc_2_svs[9])
      | (ACC1_if_slc_2_svs[8]) | (ACC1_if_slc_2_svs[7]) | (ACC1_if_slc_2_svs[6])
      | (ACC1_if_slc_2_svs[5]) | (ACC1_if_slc_2_svs[4]) | (ACC1_if_slc_2_svs[3])
      | (ACC1_if_slc_2_svs[2]) | (ACC1_if_slc_2_svs[1]) | (ACC1_if_slc_2_svs[0]));
  assign nl_FRAME_acc_2_tmp = conv_u2s_5_6(signext_5_4({(acc_imod_1_sva[5]) , 2'b0
      , (acc_imod_1_sva[5])})) + acc_imod_1_sva;
  assign FRAME_acc_2_tmp = nl_FRAME_acc_2_tmp[5:0];
  assign nl_ACC1_4_if_acc_2_idiv_sva_mx0w0 = ACC1_1_if_mul_cse_sva_mx0w0 + 25'b101101;
  assign ACC1_4_if_acc_2_idiv_sva_mx0w0 = nl_ACC1_4_if_acc_2_idiv_sva_mx0w0[24:0];
  assign nl_ACC1_3_if_conc_idiv_sg1_sva_mx0w0 = (ACC1_1_if_mul_cse_sva_mx0w0[24:1])
      + 24'b1111;
  assign ACC1_3_if_conc_idiv_sg1_sva_mx0w0 = nl_ACC1_3_if_conc_idiv_sg1_sva_mx0w0[23:0];
  assign nl_ACC1_2_if_acc_2_idiv_sva_mx0w0 = ACC1_1_if_mul_cse_sva_mx0w0 + 25'b1111;
  assign ACC1_2_if_acc_2_idiv_sva_mx0w0 = nl_ACC1_2_if_acc_2_idiv_sva_mx0w0[24:0];
  assign nl_ACC1_1_if_mul_cse_sva_mx0w0 = conv_u2u_19_25(FRAME_p_1_sva) * 25'b1001011;
  assign ACC1_1_if_mul_cse_sva_mx0w0 = nl_ACC1_1_if_mul_cse_sva_mx0w0[24:0];
  assign nl_ACC1_5_if_conc_idiv_sg1_sva = (ACC1_1_if_mul_cse_sva_mx0w0[24:2]) + 23'b1111;
  assign ACC1_5_if_conc_idiv_sg1_sva = nl_ACC1_5_if_conc_idiv_sg1_sva[22:0];
  assign nl_FRAME_p_1_sva_2 = FRAME_p_1_sva + 19'b1;
  assign FRAME_p_1_sva_2 = nl_FRAME_p_1_sva_2[18:0];
  assign nl_acc_imod_1_sva = ({(conv_s2u_4_5({(acc_psp_sva[6:5]) , 2'b1}) + conv_u2u_3_5(FRAME_if_acc_11_sdt[3:1]))
      , (FRAME_if_acc_11_sdt[0])}) + conv_s2s_5_6({1'b1 , (acc_psp_sva[3:0])});
  assign acc_imod_1_sva = nl_acc_imod_1_sva[5:0];
  assign nl_acc_psp_sva = (z_out_4 + conv_u2u_6_7({5'b11010 , (FRAME_p_1_sva[15])}))
      + (conv_u2u_6_7(conv_u2u_5_6(conv_u2u_4_5(~ (FRAME_p_1_sva[13:10])) + conv_u2u_4_5({(FRAME_p_1_sva[9:7])
      , (FRAME_p_1_sva[14])})) + conv_u2u_5_6(z_out)) + conv_u2u_6_7(conv_u2u_5_6({1'b1
      , (~ (FRAME_p_1_sva[18:17])) , 2'b11}) + conv_u2u_4_6(FRAME_p_1_sva[3:0])));
  assign acc_psp_sva = nl_acc_psp_sva[6:0];
  assign nl_FRAME_if_acc_11_sdt = ({(~ (acc_psp_sva[4])) , 2'b11 , (~ (acc_psp_sva[4]))})
      + conv_s2u_2_4(~ (acc_psp_sva[6:5]));
  assign FRAME_if_acc_11_sdt = nl_FRAME_if_acc_11_sdt[3:0];
  assign ACC1_if_slc_svs = MUX_v_30_64_2({(ACC1_if_io_read_vin_rsc_d_ftmp[29:0])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[31:2]) , (ACC1_if_io_read_vin_rsc_d_ftmp[33:4])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[35:6]) , (ACC1_if_io_read_vin_rsc_d_ftmp[37:8])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[39:10]) , (ACC1_if_io_read_vin_rsc_d_ftmp[41:12])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[43:14]) , (ACC1_if_io_read_vin_rsc_d_ftmp[45:16])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[47:18]) , (ACC1_if_io_read_vin_rsc_d_ftmp[49:20])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[51:22]) , (ACC1_if_io_read_vin_rsc_d_ftmp[53:24])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[55:26]) , (ACC1_if_io_read_vin_rsc_d_ftmp[57:28])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[59:30]) , (ACC1_if_io_read_vin_rsc_d_ftmp[61:32])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[63:34]) , (ACC1_if_io_read_vin_rsc_d_ftmp[65:36])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[67:38]) , (ACC1_if_io_read_vin_rsc_d_ftmp[69:40])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[71:42]) , (ACC1_if_io_read_vin_rsc_d_ftmp[73:44])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[75:46]) , (ACC1_if_io_read_vin_rsc_d_ftmp[77:48])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[79:50]) , (ACC1_if_io_read_vin_rsc_d_ftmp[81:52])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[83:54]) , (ACC1_if_io_read_vin_rsc_d_ftmp[85:56])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[87:58]) , (ACC1_if_io_read_vin_rsc_d_ftmp[89:60])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[91:62]) , (ACC1_if_io_read_vin_rsc_d_ftmp[93:64])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[95:66]) , (ACC1_if_io_read_vin_rsc_d_ftmp[97:68])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[99:70]) , (ACC1_if_io_read_vin_rsc_d_ftmp[101:72])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[103:74]) , (ACC1_if_io_read_vin_rsc_d_ftmp[105:76])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[107:78]) , (ACC1_if_io_read_vin_rsc_d_ftmp[109:80])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[111:82]) , (ACC1_if_io_read_vin_rsc_d_ftmp[113:84])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[115:86]) , (ACC1_if_io_read_vin_rsc_d_ftmp[117:88])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[119:90]) , (ACC1_if_io_read_vin_rsc_d_ftmp[121:92])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[123:94]) , (ACC1_if_io_read_vin_rsc_d_ftmp[125:96])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[127:98]) , (ACC1_if_io_read_vin_rsc_d_ftmp[129:100])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[131:102]) , (ACC1_if_io_read_vin_rsc_d_ftmp[133:104])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[135:106]) , (ACC1_if_io_read_vin_rsc_d_ftmp[137:108])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[139:110]) , (ACC1_if_io_read_vin_rsc_d_ftmp[141:112])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[143:114]) , (ACC1_if_io_read_vin_rsc_d_ftmp[145:116])
      , (ACC1_if_io_read_vin_rsc_d_ftmp[147:118]) , (ACC1_if_io_read_vin_rsc_d_ftmp[149:120])
      , 30'b0 , 30'b0 , 30'b0}, z_out_1[5:0]);
  assign ACC1_if_slc_1_svs = MUX_v_30_64_2({(ACC1_if_io_read_vin_rsc_d_1_ftmp[29:0])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[31:2]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[33:4])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[35:6]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[37:8])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[39:10]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[41:12])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[43:14]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[45:16])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[47:18]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[49:20])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[51:22]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[53:24])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[55:26]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[57:28])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[59:30]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[61:32])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[63:34]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[65:36])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[67:38]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[69:40])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[71:42]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[73:44])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[75:46]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[77:48])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[79:50]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[81:52])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[83:54]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[85:56])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[87:58]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[89:60])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[91:62]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[93:64])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[95:66]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[97:68])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[99:70]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[101:72])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[103:74]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[105:76])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[107:78]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[109:80])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[111:82]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[113:84])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[115:86]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[117:88])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[119:90]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[121:92])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[123:94]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[125:96])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[127:98]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[129:100])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[131:102]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[133:104])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[135:106]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[137:108])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[139:110]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[141:112])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[143:114]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[145:116])
      , (ACC1_if_io_read_vin_rsc_d_1_ftmp[147:118]) , (ACC1_if_io_read_vin_rsc_d_1_ftmp[149:120])
      , 30'b0 , 30'b0 , 30'b0}, z_out_1[5:0]);
  assign ACC1_if_slc_2_svs = MUX_v_30_64_2({(ACC1_if_io_read_vin_rsc_d_2_ftmp[29:0])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[31:2]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[33:4])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[35:6]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[37:8])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[39:10]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[41:12])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[43:14]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[45:16])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[47:18]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[49:20])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[51:22]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[53:24])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[55:26]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[57:28])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[59:30]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[61:32])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[63:34]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[65:36])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[67:38]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[69:40])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[71:42]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[73:44])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[75:46]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[77:48])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[79:50]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[81:52])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[83:54]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[85:56])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[87:58]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[89:60])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[91:62]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[93:64])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[95:66]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[97:68])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[99:70]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[101:72])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[103:74]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[105:76])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[107:78]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[109:80])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[111:82]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[113:84])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[115:86]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[117:88])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[119:90]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[121:92])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[123:94]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[125:96])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[127:98]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[129:100])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[131:102]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[133:104])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[135:106]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[137:108])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[139:110]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[141:112])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[143:114]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[145:116])
      , (ACC1_if_io_read_vin_rsc_d_2_ftmp[147:118]) , (ACC1_if_io_read_vin_rsc_d_2_ftmp[149:120])
      , 30'b0 , 30'b0 , 30'b0}, z_out_1[5:0]);
  assign ACC1_if_slc_3_svs = MUX_v_30_64_2({(ACC1_if_io_read_vin_rsc_d_3_ftmp[29:0])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[31:2]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[33:4])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[35:6]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[37:8])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[39:10]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[41:12])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[43:14]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[45:16])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[47:18]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[49:20])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[51:22]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[53:24])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[55:26]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[57:28])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[59:30]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[61:32])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[63:34]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[65:36])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[67:38]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[69:40])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[71:42]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[73:44])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[75:46]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[77:48])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[79:50]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[81:52])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[83:54]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[85:56])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[87:58]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[89:60])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[91:62]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[93:64])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[95:66]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[97:68])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[99:70]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[101:72])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[103:74]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[105:76])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[107:78]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[109:80])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[111:82]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[113:84])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[115:86]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[117:88])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[119:90]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[121:92])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[123:94]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[125:96])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[127:98]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[129:100])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[131:102]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[133:104])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[135:106]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[137:108])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[139:110]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[141:112])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[143:114]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[145:116])
      , (ACC1_if_io_read_vin_rsc_d_3_ftmp[147:118]) , (ACC1_if_io_read_vin_rsc_d_3_ftmp[149:120])
      , 30'b0 , 30'b0 , 30'b0}, z_out_1[5:0]);
  assign count_sva_dfm_4_mx0 = MUX_v_5_2_2({(z_out_4[4:0]) , count_sva_dfm_3}, ~((ACC1_if_slc_4_svs[29])
      | (ACC1_if_slc_4_svs[28]) | (ACC1_if_slc_4_svs[27]) | (ACC1_if_slc_4_svs[26])
      | (ACC1_if_slc_4_svs[25]) | (ACC1_if_slc_4_svs[24]) | (ACC1_if_slc_4_svs[23])
      | (ACC1_if_slc_4_svs[22]) | (ACC1_if_slc_4_svs[21]) | (ACC1_if_slc_4_svs[20])
      | (ACC1_if_slc_4_svs[19]) | (ACC1_if_slc_4_svs[18]) | (ACC1_if_slc_4_svs[17])
      | (ACC1_if_slc_4_svs[16]) | (ACC1_if_slc_4_svs[15]) | (ACC1_if_slc_4_svs[14])
      | (ACC1_if_slc_4_svs[13]) | (ACC1_if_slc_4_svs[12]) | (ACC1_if_slc_4_svs[11])
      | (ACC1_if_slc_4_svs[10]) | (ACC1_if_slc_4_svs[9]) | (ACC1_if_slc_4_svs[8])
      | (ACC1_if_slc_4_svs[7]) | (ACC1_if_slc_4_svs[6]) | (ACC1_if_slc_4_svs[5])
      | (ACC1_if_slc_4_svs[4]) | (ACC1_if_slc_4_svs[3]) | (ACC1_if_slc_4_svs[2])
      | (ACC1_if_slc_4_svs[1]) | (ACC1_if_slc_4_svs[0])));
  assign ACC1_if_slc_4_svs = MUX_v_30_64_2({(ACC1_if_io_read_vin_rsc_d_4_ftmp[29:0])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[31:2]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[33:4])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[35:6]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[37:8])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[39:10]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[41:12])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[43:14]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[45:16])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[47:18]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[49:20])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[51:22]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[53:24])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[55:26]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[57:28])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[59:30]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[61:32])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[63:34]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[65:36])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[67:38]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[69:40])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[71:42]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[73:44])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[75:46]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[77:48])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[79:50]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[81:52])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[83:54]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[85:56])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[87:58]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[89:60])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[91:62]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[93:64])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[95:66]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[97:68])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[99:70]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[101:72])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[103:74]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[105:76])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[107:78]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[109:80])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[111:82]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[113:84])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[115:86]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[117:88])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[119:90]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[121:92])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[123:94]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[125:96])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[127:98]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[129:100])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[131:102]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[133:104])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[135:106]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[137:108])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[139:110]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[141:112])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[143:114]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[145:116])
      , (ACC1_if_io_read_vin_rsc_d_4_ftmp[147:118]) , (ACC1_if_io_read_vin_rsc_d_4_ftmp[149:120])
      , 30'b0 , 30'b0 , 30'b0}, z_out_1[5:0]);
  assign or_dcpl_24 = (fsm_output[10]) | (fsm_output[9]);
  assign or_dcpl_27 = (fsm_output[7]) | (fsm_output[6]);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      FRAME_p_1_sva <= 19'b0;
      count_sva <= 5'b0;
      out_sva <= 1'b0;
      vout_rsc_mgc_out_stdreg_d <= 1'b0;
      clk_reg_rsc_mgc_out_stdreg_d <= 1'b0;
      FRAME_slc_itm <= 1'b0;
      unequal_tmp_5 <= 1'b0;
      ACC1_if_acc_54_itm <= 9'b0;
      ACC1_if_acc_49_psp <= 7'b0;
      ACC1_if_acc_43_itm <= 9'b0;
      ACC1_if_acc_38_psp <= 7'b0;
      ACC1_if_acc_32_itm <= 9'b0;
      ACC1_if_acc_27_psp <= 7'b0;
      FRAME_if_1_and_itm <= 1'b0;
      ACC1_if_io_read_vin_rsc_d_ftmp <= 150'b0;
      ACC1_if_acc_itm <= 9'b0;
      ACC1_if_acc_16_psp <= 7'b0;
      ACC1_if_acc_65_itm <= 9'b0;
      ACC1_if_mul_28_itm <= 7'b0;
      reg_ACC1_if_acc_60_psp_cse <= 7'b0;
      FRAME_p_1_sva_1 <= 19'b0;
      ACC1_if_acc_67_itm <= 7'b0;
      ACC1_if_io_read_vin_rsc_d_1_ftmp <= 150'b0;
      ACC1_if_io_read_vin_rsc_d_2_ftmp <= 150'b0;
      reg_ACC1_if_mul_3_itm_cse <= 7'b0;
      ACC1_if_io_read_vin_rsc_d_3_ftmp <= 150'b0;
      count_sva_dfm <= 5'b0;
      ACC1_if_io_read_vin_rsc_d_4_ftmp <= 150'b0;
      count_sva_dfm_1 <= 5'b0;
      count_sva_dfm_2 <= 5'b0;
      count_sva_dfm_3 <= 5'b0;
      FRAME_and_itm <= 5'b0;
      reg_ACC1_4_if_acc_2_idiv_sva_tmp_14 <= 5'b0;
      reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14 <= 5'b0;
      reg_ACC1_2_if_acc_2_idiv_sva_tmp_14 <= 5'b0;
      reg_ACC1_1_if_mul_cse_sva_tmp_14 <= 5'b0;
      reg_ACC1_5_if_conc_idiv_sg1_sva_tmp_17 <= 2'b0;
      reg_acc_imod_9_sva_tmp_1 <= 2'b0;
      reg_acc_imod_sva_1_cse <= 2'b0;
    end
    else begin
      if ( en ) begin
        FRAME_p_1_sva <= FRAME_p_1_sva_1 & (signext_19_1(fsm_output[16]));
        count_sva <= (MUX_v_5_2_2({count_sva , FRAME_and_itm}, fsm_output[16])) &
            (signext_5_1(~ (fsm_output[0])));
        out_sva <= (MUX_s_1_2_2({out_sva , vout_rsc_mgc_out_stdreg_d}, fsm_output[16]))
            & (~ (fsm_output[0]));
        vout_rsc_mgc_out_stdreg_d <= MUX1HOT_s_1_3_2({out_sva , (z_out[3]) , vout_rsc_mgc_out_stdreg_d},
            {((fsm_output[15]) & unequal_tmp_5) , ((fsm_output[15]) & (~ unequal_tmp_5))
            , (~ (fsm_output[15]))});
        clk_reg_rsc_mgc_out_stdreg_d <= MUX_s_1_2_2({clk_reg_rsc_mgc_out_stdreg_d
            , FRAME_if_1_and_itm}, fsm_output[5]);
        FRAME_slc_itm <= MUX_s_1_2_2({FRAME_slc_itm , (readslicef_15_1_14((conv_u2s_14_15(FRAME_p_1_sva_2[18:5])
            + 15'b100110010111011)))}, fsm_output[1]);
        unequal_tmp_5 <= MUX_s_1_2_2({unequal_tmp_5 , (~((FRAME_acc_2_tmp[4]) & (FRAME_acc_2_tmp[3])
            & (~((FRAME_acc_2_tmp[5]) | (FRAME_acc_2_tmp[2]) | (FRAME_acc_2_tmp[1])
            | (FRAME_acc_2_tmp[0])))))}, fsm_output[1]);
        ACC1_if_acc_54_itm <= MUX_v_9_2_2({ACC1_if_acc_54_itm , z_out_2}, fsm_output[1]);
        ACC1_if_acc_49_psp <= MUX_v_7_2_2({ACC1_if_acc_49_psp , (conv_s2s_6_7({(ACC1_4_if_acc_2_idiv_sva_mx0w0[12])
            , 3'b0 , (signext_2_1(ACC1_4_if_acc_2_idiv_sva_mx0w0[12]))}) + conv_u2s_6_7(ACC1_4_if_acc_2_idiv_sva_mx0w0[5:0]))},
            fsm_output[1]);
        ACC1_if_acc_43_itm <= MUX_v_9_2_2({ACC1_if_acc_43_itm , (conv_u2s_8_9(conv_u2u_7_8(conv_u2u_6_7({(~
            (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[16:14])) , 2'b11 , (~ (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[7]))})
            + conv_u2u_6_7({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[13:12]) , 1'b0 , (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[16:14])}))
            + conv_u2u_7_8(conv_u2u_6_7({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[7]) ,
            (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[23:19])}) + conv_u2u_5_7({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[17])
            , 1'b0 , (readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[17])
            , 1'b1})) + conv_u2u_3_4({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[13:12])
            , 1'b1}))))}))) + conv_s2s_8_9({1'b1 , (~ (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[18]))
            , (conv_u2u_5_6({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[10]) , 1'b0 , (signext_3_1(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[10]))})
            + conv_u2u_5_6(signext_5_4({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[18]) ,
            1'b0 , (signext_2_1(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[18]))})))}))},
            fsm_output[1]);
        ACC1_if_acc_38_psp <= MUX_v_7_2_2({ACC1_if_acc_38_psp , (conv_s2s_6_7({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[11])
            , 3'b0 , (signext_2_1(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[11]))}) + conv_u2s_6_7({(ACC1_3_if_conc_idiv_sg1_sva_mx0w0[4:0])
            , (ACC1_1_if_mul_cse_sva_mx0w0[0])}))}, fsm_output[1]);
        ACC1_if_acc_32_itm <= MUX_v_9_2_2({ACC1_if_acc_32_itm , (conv_u2s_8_9(conv_u2u_7_8(conv_u2u_6_7({(~
            (ACC1_2_if_acc_2_idiv_sva_mx0w0[17:15])) , 2'b11 , (~ (ACC1_2_if_acc_2_idiv_sva_mx0w0[8]))})
            + conv_u2u_6_7({(ACC1_2_if_acc_2_idiv_sva_mx0w0[14:13]) , 1'b0 , (ACC1_2_if_acc_2_idiv_sva_mx0w0[17:15])}))
            + conv_u2u_7_8(conv_u2u_6_7({(ACC1_2_if_acc_2_idiv_sva_mx0w0[8]) , (ACC1_2_if_acc_2_idiv_sva_mx0w0[24:20])})
            + conv_u2u_5_7({(ACC1_2_if_acc_2_idiv_sva_mx0w0[18]) , 1'b0 , (readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(ACC1_2_if_acc_2_idiv_sva_mx0w0[18])
            , 1'b1})) + conv_u2u_3_4({(ACC1_2_if_acc_2_idiv_sva_mx0w0[14:13]) , 1'b1}))))})))
            + conv_s2s_8_9({1'b1 , (~ (ACC1_2_if_acc_2_idiv_sva_mx0w0[19])) , (conv_u2u_5_6({(ACC1_2_if_acc_2_idiv_sva_mx0w0[11])
            , 1'b0 , (signext_3_1(ACC1_2_if_acc_2_idiv_sva_mx0w0[11]))}) + conv_u2u_5_6(signext_5_4({(ACC1_2_if_acc_2_idiv_sva_mx0w0[19])
            , 1'b0 , (signext_2_1(ACC1_2_if_acc_2_idiv_sva_mx0w0[19]))})))}))}, fsm_output[1]);
        ACC1_if_acc_27_psp <= MUX_v_7_2_2({ACC1_if_acc_27_psp , (conv_s2s_6_7({(ACC1_2_if_acc_2_idiv_sva_mx0w0[12])
            , 3'b0 , (signext_2_1(ACC1_2_if_acc_2_idiv_sva_mx0w0[12]))}) + conv_u2s_6_7(ACC1_2_if_acc_2_idiv_sva_mx0w0[5:0]))},
            fsm_output[1]);
        FRAME_if_1_and_itm <= MUX_s_1_2_2({FRAME_if_1_and_itm , ((readslicef_20_1_19((({1'b1
            , (~ FRAME_p_1_sva)}) + 20'b1))) & (~((FRAME_acc_2_tmp[5]) | (FRAME_acc_2_tmp[4])
            | (FRAME_acc_2_tmp[3]) | (FRAME_acc_2_tmp[2]) | (FRAME_acc_2_tmp[1])
            | (FRAME_acc_2_tmp[0]))))}, fsm_output[1]);
        ACC1_if_io_read_vin_rsc_d_ftmp <= MUX_v_150_2_2({ACC1_if_io_read_vin_rsc_d_ftmp
            , vin_rsc_mgc_in_wire_d}, fsm_output[1]);
        ACC1_if_acc_itm <= MUX_v_9_2_2({ACC1_if_acc_itm , (conv_u2s_8_9(conv_u2u_7_8(conv_u2u_6_7({(~
            (ACC1_1_if_mul_cse_sva_mx0w0[17:15])) , 2'b11 , (~ (ACC1_1_if_mul_cse_sva_mx0w0[8]))})
            + conv_u2u_6_7({(ACC1_1_if_mul_cse_sva_mx0w0[14:13]) , 1'b0 , (ACC1_1_if_mul_cse_sva_mx0w0[17:15])}))
            + conv_u2u_7_8(conv_u2u_6_7({(ACC1_1_if_mul_cse_sva_mx0w0[8]) , (ACC1_1_if_mul_cse_sva_mx0w0[24:20])})
            + conv_u2u_5_7({(ACC1_1_if_mul_cse_sva_mx0w0[18]) , 1'b0 , (readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(ACC1_1_if_mul_cse_sva_mx0w0[18])
            , 1'b1})) + conv_u2u_3_4({(ACC1_1_if_mul_cse_sva_mx0w0[14:13]) , 1'b1}))))})))
            + conv_s2s_8_9({1'b1 , (~ (ACC1_1_if_mul_cse_sva_mx0w0[19])) , (conv_u2u_5_6({(ACC1_1_if_mul_cse_sva_mx0w0[11])
            , 1'b0 , (signext_3_1(ACC1_1_if_mul_cse_sva_mx0w0[11]))}) + conv_u2u_5_6(signext_5_4({(ACC1_1_if_mul_cse_sva_mx0w0[19])
            , 1'b0 , (signext_2_1(ACC1_1_if_mul_cse_sva_mx0w0[19]))})))}))}, fsm_output[1]);
        ACC1_if_acc_16_psp <= MUX_v_7_2_2({ACC1_if_acc_16_psp , (conv_s2s_6_7({(ACC1_1_if_mul_cse_sva_mx0w0[12])
            , 3'b0 , (signext_2_1(ACC1_1_if_mul_cse_sva_mx0w0[12]))}) + conv_u2s_6_7(ACC1_1_if_mul_cse_sva_mx0w0[5:0]))},
            fsm_output[1]);
        ACC1_if_acc_65_itm <= nl_ACC1_if_acc_65_itm[8:0];
        ACC1_if_mul_28_itm <= z_out_3;
        reg_ACC1_if_acc_60_psp_cse <= z_out_1[6:0];
        FRAME_p_1_sva_1 <= MUX_v_19_2_2({FRAME_p_1_sva_2 , FRAME_p_1_sva_1}, or_dcpl_27
            | (fsm_output[2]) | (fsm_output[3]) | or_dcpl_24 | (fsm_output[13]) |
            (fsm_output[12]) | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[8])
            | (fsm_output[11]) | (fsm_output[14]) | (fsm_output[15]));
        ACC1_if_acc_67_itm <= MUX_v_7_2_2({ACC1_if_acc_67_itm , (z_out_1[6:0])},
            fsm_output[2]);
        ACC1_if_io_read_vin_rsc_d_1_ftmp <= MUX_v_150_2_2({ACC1_if_io_read_vin_rsc_d_1_ftmp
            , vin_rsc_mgc_in_wire_d}, fsm_output[2]);
        ACC1_if_io_read_vin_rsc_d_2_ftmp <= MUX_v_150_2_2({ACC1_if_io_read_vin_rsc_d_2_ftmp
            , vin_rsc_mgc_in_wire_d}, fsm_output[3]);
        reg_ACC1_if_mul_3_itm_cse <= z_out_3;
        ACC1_if_io_read_vin_rsc_d_3_ftmp <= MUX_v_150_2_2({ACC1_if_io_read_vin_rsc_d_3_ftmp
            , vin_rsc_mgc_in_wire_d}, fsm_output[4]);
        count_sva_dfm <= MUX1HOT_v_5_3_2({(z_out_4[4:0]) , count_sva , count_sva_dfm},
            {(~(nor_1_tmp | or_dcpl_27)) , (nor_1_tmp & (~ or_dcpl_27)) , or_dcpl_27});
        ACC1_if_io_read_vin_rsc_d_4_ftmp <= MUX_v_150_2_2({ACC1_if_io_read_vin_rsc_d_4_ftmp
            , vin_rsc_mgc_in_wire_d}, fsm_output[5]);
        count_sva_dfm_1 <= MUX1HOT_v_5_3_2({(z_out_4[4:0]) , count_sva_dfm , count_sva_dfm_1},
            {(~(nor_2_tmp | or_dcpl_24)) , (nor_2_tmp & (~ or_dcpl_24)) , or_dcpl_24});
        count_sva_dfm_2 <= MUX1HOT_v_5_3_2({(z_out_4[4:0]) , count_sva_dfm_1 , count_sva_dfm_2},
            {(~(nor_3_tmp | or_48_tmp)) , (nor_3_tmp & (~ or_48_tmp)) , or_48_tmp});
        count_sva_dfm_3 <= MUX_v_5_2_2({(z_out_4[4:0]) , count_sva_dfm_2}, ~((ACC1_if_slc_3_svs[29])
            | (ACC1_if_slc_3_svs[28]) | (ACC1_if_slc_3_svs[27]) | (ACC1_if_slc_3_svs[26])
            | (ACC1_if_slc_3_svs[25]) | (ACC1_if_slc_3_svs[24]) | (ACC1_if_slc_3_svs[23])
            | (ACC1_if_slc_3_svs[22]) | (ACC1_if_slc_3_svs[21]) | (ACC1_if_slc_3_svs[20])
            | (ACC1_if_slc_3_svs[19]) | (ACC1_if_slc_3_svs[18]) | (ACC1_if_slc_3_svs[17])
            | (ACC1_if_slc_3_svs[16]) | (ACC1_if_slc_3_svs[15]) | (ACC1_if_slc_3_svs[14])
            | (ACC1_if_slc_3_svs[13]) | (ACC1_if_slc_3_svs[12]) | (ACC1_if_slc_3_svs[11])
            | (ACC1_if_slc_3_svs[10]) | (ACC1_if_slc_3_svs[9]) | (ACC1_if_slc_3_svs[8])
            | (ACC1_if_slc_3_svs[7]) | (ACC1_if_slc_3_svs[6]) | (ACC1_if_slc_3_svs[5])
            | (ACC1_if_slc_3_svs[4]) | (ACC1_if_slc_3_svs[3]) | (ACC1_if_slc_3_svs[2])
            | (ACC1_if_slc_3_svs[1]) | (ACC1_if_slc_3_svs[0])));
        FRAME_and_itm <= count_sva_dfm_4_mx0 & ({{4{unequal_tmp_5}}, unequal_tmp_5});
        reg_ACC1_4_if_acc_2_idiv_sva_tmp_14 <= MUX_v_5_2_2({reg_ACC1_4_if_acc_2_idiv_sva_tmp_14
            , (ACC1_4_if_acc_2_idiv_sva_mx0w0[10:6])}, fsm_output[1]);
        reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14 <= MUX_v_5_2_2({reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14
            , (ACC1_3_if_conc_idiv_sg1_sva_mx0w0[9:5])}, fsm_output[1]);
        reg_ACC1_2_if_acc_2_idiv_sva_tmp_14 <= MUX_v_5_2_2({reg_ACC1_2_if_acc_2_idiv_sva_tmp_14
            , (ACC1_2_if_acc_2_idiv_sva_mx0w0[10:6])}, fsm_output[1]);
        reg_ACC1_1_if_mul_cse_sva_tmp_14 <= MUX_v_5_2_2({reg_ACC1_1_if_mul_cse_sva_tmp_14
            , (ACC1_1_if_mul_cse_sva_mx0w0[10:6])}, fsm_output[1]);
        reg_ACC1_5_if_conc_idiv_sg1_sva_tmp_17 <= ACC1_5_if_conc_idiv_sg1_sva[5:4];
        reg_acc_imod_9_sva_tmp_1 <= MUX_v_2_2_2({reg_acc_imod_9_sva_tmp_1 , (z_out_6[7:6])},
            fsm_output[2]);
        reg_acc_imod_sva_1_cse <= z_out_6[7:6];
      end
    end
  end
  assign nl_ACC1_if_acc_65_itm  = conv_u2s_8_9(conv_u2u_7_8(conv_u2u_6_7({(~ (ACC1_5_if_conc_idiv_sg1_sva[15:13]))
      , 2'b11 , (~ (ACC1_5_if_conc_idiv_sg1_sva[6]))}) + conv_u2u_6_7({(ACC1_5_if_conc_idiv_sg1_sva[12:11])
      , 1'b0 , (ACC1_5_if_conc_idiv_sg1_sva[15:13])})) + conv_u2u_7_8(conv_u2u_6_7({(ACC1_5_if_conc_idiv_sg1_sva[6])
      , (ACC1_5_if_conc_idiv_sg1_sva[22:18])}) + conv_u2u_5_7({(ACC1_5_if_conc_idiv_sg1_sva[16])
      , 1'b0 , (readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(ACC1_5_if_conc_idiv_sg1_sva[16])
      , 1'b1})) + conv_u2u_3_4({(ACC1_5_if_conc_idiv_sg1_sva[12:11]) , 1'b1}))))})))
      + conv_s2s_8_9({1'b1 , (~ (ACC1_5_if_conc_idiv_sg1_sva[17])) , (conv_u2u_5_6({(ACC1_5_if_conc_idiv_sg1_sva[9])
      , 1'b0 , (signext_3_1(ACC1_5_if_conc_idiv_sg1_sva[9]))}) + conv_u2u_5_6(signext_5_4({(ACC1_5_if_conc_idiv_sg1_sva[17])
      , 1'b0 , (signext_2_1(ACC1_5_if_conc_idiv_sg1_sva[17]))})))});
  assign mux_nl = MUX_s_1_2_2({(~ (count_sva_dfm_4_mx0[2])) , (~ (FRAME_p_1_sva[4]))},
      fsm_output[1]);
  assign mux_36_nl = MUX_v_3_2_2({3'b101 , (FRAME_p_1_sva[9:7])}, fsm_output[1]);
  assign nl_z_out = conv_u2u_4_5({(~((FRAME_p_1_sva[4]) & (fsm_output[1]))) , ((~
      (count_sva_dfm_4_mx0[4:3])) | (signext_2_1(fsm_output[1]))) , (mux_nl)}) +
      conv_u2u_4_5({((FRAME_p_1_sva[5]) & (fsm_output[1])) , (mux_36_nl)});
  assign z_out = nl_z_out[4:0];
  assign or_2_cse = (fsm_output[2]) | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[10])
      | (fsm_output[13]);
  assign or_3_cse = (fsm_output[5]) | (fsm_output[8]) | (fsm_output[11]) | (fsm_output[14])
      | (fsm_output[15]);
  assign mux1h_25_nl = MUX1HOT_v_6_3_2({({(ACC1_5_if_conc_idiv_sg1_sva[3:0]) , (ACC1_1_if_mul_cse_sva_mx0w0[1:0])})
      , (z_out_6[5:0]) , (z_out_5[5:0])}, {(fsm_output[1]) , or_2_cse , or_3_cse});
  assign mux_39_nl = MUX_s_1_2_2({(ACC1_5_if_conc_idiv_sg1_sva[10]) , (z_out_6[8])},
      or_2_cse);
  assign mux_42_nl = MUX_s_1_2_2({(ACC1_5_if_conc_idiv_sg1_sva[10]) , (z_out_5[6])},
      or_3_cse);
  assign mux1h_28_nl = MUX1HOT_s_1_3_2({(ACC1_5_if_conc_idiv_sg1_sva[10]) , (z_out_6[8])
      , (z_out_5[6])}, {(fsm_output[1]) , or_2_cse , or_3_cse});
  assign nl_z_out_1 = conv_u2u_6_8(mux1h_25_nl) + conv_s2u_6_8({((mux_39_nl) & (~((fsm_output[5])
      | (fsm_output[8]) | (fsm_output[11]) | (fsm_output[14]) | (fsm_output[15]))))
      , 1'b0 , ((z_out_5[6]) & (~((fsm_output[1]) | (fsm_output[2]) | (fsm_output[4])
      | (fsm_output[7]) | (fsm_output[10]) | (fsm_output[13])))) , 1'b0 , ((mux_42_nl)
      & (~((fsm_output[2]) | (fsm_output[4]) | (fsm_output[7]) | (fsm_output[10])
      | (fsm_output[13])))) , (mux1h_28_nl)});
  assign z_out_1 = nl_z_out_1[7:0];
  assign mux_40_nl = MUX_v_8_2_2({(conv_u2u_7_8(conv_u2u_6_7({(~ (ACC1_4_if_acc_2_idiv_sva_mx0w0[17:15]))
      , 2'b11 , (~ (ACC1_4_if_acc_2_idiv_sva_mx0w0[8]))}) + conv_u2u_6_7({(ACC1_4_if_acc_2_idiv_sva_mx0w0[14:13])
      , 1'b0 , (ACC1_4_if_acc_2_idiv_sva_mx0w0[17:15])})) + conv_u2u_7_8(conv_u2u_6_7({(ACC1_4_if_acc_2_idiv_sva_mx0w0[8])
      , (ACC1_4_if_acc_2_idiv_sva_mx0w0[24:20])}) + conv_u2u_5_7({(ACC1_4_if_acc_2_idiv_sva_mx0w0[18])
      , 1'b0 , (readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(ACC1_4_if_acc_2_idiv_sva_mx0w0[18])
      , 1'b1})) + conv_u2u_3_4({(ACC1_4_if_acc_2_idiv_sva_mx0w0[14:13]) , 1'b1}))))})))
      , z_out_5}, or_2_cse);
  assign mux1h_18_nl = MUX1HOT_v_8_6_2({({1'b1 , (~ (ACC1_4_if_acc_2_idiv_sva_mx0w0[19]))
      , (conv_u2u_5_6({(ACC1_4_if_acc_2_idiv_sva_mx0w0[11]) , 1'b0 , (signext_3_1(ACC1_4_if_acc_2_idiv_sva_mx0w0[11]))})
      + conv_u2u_5_6(signext_5_4({(ACC1_4_if_acc_2_idiv_sva_mx0w0[19]) , 1'b0 , (signext_2_1(ACC1_4_if_acc_2_idiv_sva_mx0w0[19]))})))})
      , ({{1{reg_ACC1_if_acc_60_psp_cse[6]}}, reg_ACC1_if_acc_60_psp_cse}) , ({{1{ACC1_if_acc_16_psp[6]}},
      ACC1_if_acc_16_psp}) , ({{1{ACC1_if_acc_27_psp[6]}}, ACC1_if_acc_27_psp}) ,
      ({{1{ACC1_if_acc_38_psp[6]}}, ACC1_if_acc_38_psp}) , ({{1{ACC1_if_acc_49_psp[6]}},
      ACC1_if_acc_49_psp})}, {(fsm_output[1]) , (fsm_output[2]) , (fsm_output[4])
      , (fsm_output[7]) , (fsm_output[10]) , (fsm_output[13])});
  assign nl_z_out_2 = conv_u2u_8_9(mux_40_nl) + conv_s2u_8_9(mux1h_18_nl);
  assign z_out_2 = nl_z_out_2[8:0];
  assign or_9_cse = (fsm_output[5]) | (fsm_output[8]) | (fsm_output[11]) | (fsm_output[14]);
  assign mux1h_19_nl = MUX1HOT_v_2_12_2({(ACC1_5_if_conc_idiv_sg1_sva[8:7]) , (reg_ACC1_1_if_mul_cse_sva_tmp_14[1:0])
      , (reg_ACC1_2_if_acc_2_idiv_sva_tmp_14[1:0]) , (reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14[1:0])
      , (reg_ACC1_4_if_acc_2_idiv_sva_tmp_14[1:0]) , reg_ACC1_5_if_conc_idiv_sg1_sva_tmp_17
      , (reg_ACC1_1_if_mul_cse_sva_tmp_14[4:3]) , reg_acc_imod_sva_1_cse , (reg_ACC1_2_if_acc_2_idiv_sva_tmp_14[4:3])
      , (reg_ACC1_3_if_conc_idiv_sg1_sva_tmp_14[4:3]) , (reg_ACC1_4_if_acc_2_idiv_sva_tmp_14[4:3])
      , reg_acc_imod_9_sva_tmp_1}, {(fsm_output[1]) , (fsm_output[3]) , (fsm_output[6])
      , (fsm_output[9]) , (fsm_output[12]) , (fsm_output[2]) , (fsm_output[4]) ,
      or_9_cse , (fsm_output[7]) , (fsm_output[10]) , (fsm_output[13]) , (fsm_output[15])});
  assign mux_37_nl = MUX_v_2_2_2({2'b1 , 2'b10}, (fsm_output[3]) | (fsm_output[6])
      | (fsm_output[9]) | (fsm_output[12]) | (fsm_output[2]) | (fsm_output[5]) |
      (fsm_output[8]) | (fsm_output[11]) | (fsm_output[14]) | (fsm_output[15]));
  assign nl_z_out_3 = conv_u2s_2_7(mux1h_19_nl) * conv_s2s_5_7({2'b10 , (mux_37_nl)
      , 1'b1});
  assign z_out_3 = nl_z_out_3[6:0];
  assign mux1h_20_nl = MUX1HOT_v_5_6_2({count_sva , count_sva_dfm , count_sva_dfm_1
      , count_sva_dfm_2 , (conv_u2u_4_5({(FRAME_p_1_sva[14]) , 1'b0 , (FRAME_p_1_sva[18:17])})
      + conv_u2u_4_5({(~ (FRAME_p_1_sva[15])) , 2'b11 , (~ (FRAME_p_1_sva[5]))}))
      , count_sva_dfm_3}, {(fsm_output[5]) , (fsm_output[8]) , (fsm_output[11]) ,
      (fsm_output[14]) , (fsm_output[1]) , (fsm_output[15])});
  assign mux_38_nl = MUX_v_5_2_2({5'b1 , conv_s2u_10_5(conv_s2s_2_5(conv_s2s_1_2(FRAME_p_1_sva[16])
      + conv_u2s_1_2(FRAME_p_1_sva[6])) * 5'b10101)}, fsm_output[1]);
  assign nl_z_out_4 = conv_u2u_5_7(mux1h_20_nl) + conv_s2u_5_7(mux_38_nl);
  assign z_out_4 = nl_z_out_4[6:0];
  assign mux1h_21_nl = MUX1HOT_v_7_4_2({z_out_3 , reg_ACC1_if_mul_3_itm_cse , reg_ACC1_if_acc_60_psp_cse
      , ACC1_if_acc_67_itm}, {(fsm_output[2]) , ((fsm_output[4]) | (fsm_output[7])
      | (fsm_output[10]) | (fsm_output[13])) , or_9_cse , (fsm_output[15])});
  assign mux_41_nl = MUX_v_7_2_2({ACC1_if_mul_28_itm , z_out_3}, (fsm_output[4])
      | (fsm_output[5]) | (fsm_output[7]) | (fsm_output[8]) | (fsm_output[10]) |
      (fsm_output[11]) | (fsm_output[13]) | (fsm_output[14]) | (fsm_output[15]));
  assign nl_z_out_5 = conv_s2u_7_8(mux1h_21_nl) + conv_s2u_7_8(mux_41_nl);
  assign z_out_5 = nl_z_out_5[7:0];
  assign mux1h_23_nl = MUX1HOT_v_9_5_2({ACC1_if_acc_65_itm , ACC1_if_acc_itm , ACC1_if_acc_32_itm
      , ACC1_if_acc_43_itm , ACC1_if_acc_54_itm}, {(fsm_output[2]) , (fsm_output[4])
      , (fsm_output[7]) , (fsm_output[10]) , (fsm_output[13])});
  assign nl_z_out_6 = (mux1h_23_nl) + conv_s2u_8_9(z_out_2[7:0]);
  assign z_out_6 = nl_z_out_6[8:0];

  function [4:0] signext_5_4;
    input [3:0] vector;
  begin
    signext_5_4= {{1{vector[3]}}, vector};
  end
  endfunction


  function [29:0] MUX_v_30_64_2;
    input [1919:0] inputs;
    input [5:0] sel;
    reg [29:0] result;
  begin
    case (sel)
      6'b000000 : begin
        result = inputs[1919:1890];
      end
      6'b000001 : begin
        result = inputs[1889:1860];
      end
      6'b000010 : begin
        result = inputs[1859:1830];
      end
      6'b000011 : begin
        result = inputs[1829:1800];
      end
      6'b000100 : begin
        result = inputs[1799:1770];
      end
      6'b000101 : begin
        result = inputs[1769:1740];
      end
      6'b000110 : begin
        result = inputs[1739:1710];
      end
      6'b000111 : begin
        result = inputs[1709:1680];
      end
      6'b001000 : begin
        result = inputs[1679:1650];
      end
      6'b001001 : begin
        result = inputs[1649:1620];
      end
      6'b001010 : begin
        result = inputs[1619:1590];
      end
      6'b001011 : begin
        result = inputs[1589:1560];
      end
      6'b001100 : begin
        result = inputs[1559:1530];
      end
      6'b001101 : begin
        result = inputs[1529:1500];
      end
      6'b001110 : begin
        result = inputs[1499:1470];
      end
      6'b001111 : begin
        result = inputs[1469:1440];
      end
      6'b010000 : begin
        result = inputs[1439:1410];
      end
      6'b010001 : begin
        result = inputs[1409:1380];
      end
      6'b010010 : begin
        result = inputs[1379:1350];
      end
      6'b010011 : begin
        result = inputs[1349:1320];
      end
      6'b010100 : begin
        result = inputs[1319:1290];
      end
      6'b010101 : begin
        result = inputs[1289:1260];
      end
      6'b010110 : begin
        result = inputs[1259:1230];
      end
      6'b010111 : begin
        result = inputs[1229:1200];
      end
      6'b011000 : begin
        result = inputs[1199:1170];
      end
      6'b011001 : begin
        result = inputs[1169:1140];
      end
      6'b011010 : begin
        result = inputs[1139:1110];
      end
      6'b011011 : begin
        result = inputs[1109:1080];
      end
      6'b011100 : begin
        result = inputs[1079:1050];
      end
      6'b011101 : begin
        result = inputs[1049:1020];
      end
      6'b011110 : begin
        result = inputs[1019:990];
      end
      6'b011111 : begin
        result = inputs[989:960];
      end
      6'b100000 : begin
        result = inputs[959:930];
      end
      6'b100001 : begin
        result = inputs[929:900];
      end
      6'b100010 : begin
        result = inputs[899:870];
      end
      6'b100011 : begin
        result = inputs[869:840];
      end
      6'b100100 : begin
        result = inputs[839:810];
      end
      6'b100101 : begin
        result = inputs[809:780];
      end
      6'b100110 : begin
        result = inputs[779:750];
      end
      6'b100111 : begin
        result = inputs[749:720];
      end
      6'b101000 : begin
        result = inputs[719:690];
      end
      6'b101001 : begin
        result = inputs[689:660];
      end
      6'b101010 : begin
        result = inputs[659:630];
      end
      6'b101011 : begin
        result = inputs[629:600];
      end
      6'b101100 : begin
        result = inputs[599:570];
      end
      6'b101101 : begin
        result = inputs[569:540];
      end
      6'b101110 : begin
        result = inputs[539:510];
      end
      6'b101111 : begin
        result = inputs[509:480];
      end
      6'b110000 : begin
        result = inputs[479:450];
      end
      6'b110001 : begin
        result = inputs[449:420];
      end
      6'b110010 : begin
        result = inputs[419:390];
      end
      6'b110011 : begin
        result = inputs[389:360];
      end
      6'b110100 : begin
        result = inputs[359:330];
      end
      6'b110101 : begin
        result = inputs[329:300];
      end
      6'b110110 : begin
        result = inputs[299:270];
      end
      6'b110111 : begin
        result = inputs[269:240];
      end
      6'b111000 : begin
        result = inputs[239:210];
      end
      6'b111001 : begin
        result = inputs[209:180];
      end
      6'b111010 : begin
        result = inputs[179:150];
      end
      6'b111011 : begin
        result = inputs[149:120];
      end
      6'b111100 : begin
        result = inputs[119:90];
      end
      6'b111101 : begin
        result = inputs[89:60];
      end
      6'b111110 : begin
        result = inputs[59:30];
      end
      6'b111111 : begin
        result = inputs[29:0];
      end
      default : begin
        result = inputs[1919:1890];
      end
    endcase
    MUX_v_30_64_2 = result;
  end
  endfunction


  function [4:0] MUX_v_5_2_2;
    input [9:0] inputs;
    input [0:0] sel;
    reg [4:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[9:5];
      end
      1'b1 : begin
        result = inputs[4:0];
      end
      default : begin
        result = inputs[9:5];
      end
    endcase
    MUX_v_5_2_2 = result;
  end
  endfunction


  function [18:0] signext_19_1;
    input [0:0] vector;
  begin
    signext_19_1= {{18{vector[0]}}, vector};
  end
  endfunction


  function [4:0] signext_5_1;
    input [0:0] vector;
  begin
    signext_5_1= {{4{vector[0]}}, vector};
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [0:0] MUX1HOT_s_1_3_2;
    input [2:0] inputs;
    input [2:0] sel;
    reg [0:0] result;
    integer i;
  begin
    result = inputs[0+:1] & {1{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*1+:1] & {1{sel[i]}});
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function [0:0] readslicef_15_1_14;
    input [14:0] vector;
    reg [14:0] tmp;
  begin
    tmp = vector >> 14;
    readslicef_15_1_14 = tmp[0:0];
  end
  endfunction


  function [8:0] MUX_v_9_2_2;
    input [17:0] inputs;
    input [0:0] sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[17:9];
      end
      1'b1 : begin
        result = inputs[8:0];
      end
      default : begin
        result = inputs[17:9];
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function [6:0] MUX_v_7_2_2;
    input [13:0] inputs;
    input [0:0] sel;
    reg [6:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[13:7];
      end
      1'b1 : begin
        result = inputs[6:0];
      end
      default : begin
        result = inputs[13:7];
      end
    endcase
    MUX_v_7_2_2 = result;
  end
  endfunction


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function [2:0] readslicef_4_3_1;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_4_3_1 = tmp[2:0];
  end
  endfunction


  function [2:0] signext_3_2;
    input [1:0] vector;
  begin
    signext_3_2= {{1{vector[1]}}, vector};
  end
  endfunction


  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
  end
  endfunction


  function [0:0] readslicef_20_1_19;
    input [19:0] vector;
    reg [19:0] tmp;
  begin
    tmp = vector >> 19;
    readslicef_20_1_19 = tmp[0:0];
  end
  endfunction


  function [149:0] MUX_v_150_2_2;
    input [299:0] inputs;
    input [0:0] sel;
    reg [149:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[299:150];
      end
      1'b1 : begin
        result = inputs[149:0];
      end
      default : begin
        result = inputs[299:150];
      end
    endcase
    MUX_v_150_2_2 = result;
  end
  endfunction


  function [18:0] MUX_v_19_2_2;
    input [37:0] inputs;
    input [0:0] sel;
    reg [18:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[37:19];
      end
      1'b1 : begin
        result = inputs[18:0];
      end
      default : begin
        result = inputs[37:19];
      end
    endcase
    MUX_v_19_2_2 = result;
  end
  endfunction


  function [4:0] MUX1HOT_v_5_3_2;
    input [14:0] inputs;
    input [2:0] sel;
    reg [4:0] result;
    integer i;
  begin
    result = inputs[0+:5] & {5{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*5+:5] & {5{sel[i]}});
    MUX1HOT_v_5_3_2 = result;
  end
  endfunction


  function [1:0] MUX_v_2_2_2;
    input [3:0] inputs;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[3:2];
      end
      1'b1 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[3:2];
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function [2:0] MUX_v_3_2_2;
    input [5:0] inputs;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[5:3];
      end
      1'b1 : begin
        result = inputs[2:0];
      end
      default : begin
        result = inputs[5:3];
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function [5:0] MUX1HOT_v_6_3_2;
    input [17:0] inputs;
    input [2:0] sel;
    reg [5:0] result;
    integer i;
  begin
    result = inputs[0+:6] & {6{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*6+:6] & {6{sel[i]}});
    MUX1HOT_v_6_3_2 = result;
  end
  endfunction


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


  function [7:0] MUX1HOT_v_8_6_2;
    input [47:0] inputs;
    input [5:0] sel;
    reg [7:0] result;
    integer i;
  begin
    result = inputs[0+:8] & {8{sel[0]}};
    for( i = 1; i < 6; i = i + 1 )
      result = result | (inputs[i*8+:8] & {8{sel[i]}});
    MUX1HOT_v_8_6_2 = result;
  end
  endfunction


  function [1:0] MUX1HOT_v_2_12_2;
    input [23:0] inputs;
    input [11:0] sel;
    reg [1:0] result;
    integer i;
  begin
    result = inputs[0+:2] & {2{sel[0]}};
    for( i = 1; i < 12; i = i + 1 )
      result = result | (inputs[i*2+:2] & {2{sel[i]}});
    MUX1HOT_v_2_12_2 = result;
  end
  endfunction


  function [4:0] MUX1HOT_v_5_6_2;
    input [29:0] inputs;
    input [5:0] sel;
    reg [4:0] result;
    integer i;
  begin
    result = inputs[0+:5] & {5{sel[0]}};
    for( i = 1; i < 6; i = i + 1 )
      result = result | (inputs[i*5+:5] & {5{sel[i]}});
    MUX1HOT_v_5_6_2 = result;
  end
  endfunction


  function [6:0] MUX1HOT_v_7_4_2;
    input [27:0] inputs;
    input [3:0] sel;
    reg [6:0] result;
    integer i;
  begin
    result = inputs[0+:7] & {7{sel[0]}};
    for( i = 1; i < 4; i = i + 1 )
      result = result | (inputs[i*7+:7] & {7{sel[i]}});
    MUX1HOT_v_7_4_2 = result;
  end
  endfunction


  function [8:0] MUX1HOT_v_9_5_2;
    input [44:0] inputs;
    input [4:0] sel;
    reg [8:0] result;
    integer i;
  begin
    result = inputs[0+:9] & {9{sel[0]}};
    for( i = 1; i < 5; i = i + 1 )
      result = result | (inputs[i*9+:9] & {9{sel[i]}});
    MUX1HOT_v_9_5_2 = result;
  end
  endfunction


  function signed [5:0] conv_u2s_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_6 = {1'b0, vector};
  end
  endfunction


  function  [24:0] conv_u2u_19_25 ;
    input [18:0]  vector ;
  begin
    conv_u2u_19_25 = {{6{1'b0}}, vector};
  end
  endfunction


  function  [4:0] conv_s2u_4_5 ;
    input signed [3:0]  vector ;
  begin
    conv_s2u_4_5 = {vector[3], vector};
  end
  endfunction


  function  [4:0] conv_u2u_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [5:0] conv_s2s_5_6 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_6 = {vector[4], vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [3:0] conv_s2u_2_4 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_4 = {{2{vector[1]}}, vector};
  end
  endfunction


  function signed [14:0] conv_u2s_14_15 ;
    input [13:0]  vector ;
  begin
    conv_u2s_14_15 = {1'b0, vector};
  end
  endfunction


  function signed [6:0] conv_s2s_6_7 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_7 = {vector[5], vector};
  end
  endfunction


  function signed [6:0] conv_u2s_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2s_6_7 = {1'b0, vector};
  end
  endfunction


  function signed [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function  [6:0] conv_u2u_5_7 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_7 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function signed [8:0] conv_s2s_8_9 ;
    input signed [7:0]  vector ;
  begin
    conv_s2s_8_9 = {vector[7], vector};
  end
  endfunction


  function  [7:0] conv_u2u_6_8 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_8 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [7:0] conv_s2u_6_8 ;
    input signed [5:0]  vector ;
  begin
    conv_s2u_6_8 = {{2{vector[5]}}, vector};
  end
  endfunction


  function  [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_s2u_8_9 ;
    input signed [7:0]  vector ;
  begin
    conv_s2u_8_9 = {vector[7], vector};
  end
  endfunction


  function signed [6:0] conv_u2s_2_7 ;
    input [1:0]  vector ;
  begin
    conv_u2s_2_7 = {{5{1'b0}}, vector};
  end
  endfunction


  function signed [6:0] conv_s2s_5_7 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_7 = {{2{vector[4]}}, vector};
  end
  endfunction


  function  [4:0] conv_s2u_10_5 ;
    input signed [9:0]  vector ;
  begin
    conv_s2u_10_5 = vector[4:0];
  end
  endfunction


  function signed [4:0] conv_s2s_2_5 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_5 = {{3{vector[1]}}, vector};
  end
  endfunction


  function signed [1:0] conv_s2s_1_2 ;
    input signed [0:0]  vector ;
  begin
    conv_s2s_1_2 = {vector[0], vector};
  end
  endfunction


  function signed [1:0] conv_u2s_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2s_1_2 = {1'b0, vector};
  end
  endfunction


  function  [6:0] conv_s2u_5_7 ;
    input signed [4:0]  vector ;
  begin
    conv_s2u_5_7 = {{2{vector[4]}}, vector};
  end
  endfunction


  function  [7:0] conv_s2u_7_8 ;
    input signed [6:0]  vector ;
  begin
    conv_s2u_7_8 = {vector[6], vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    reduce_by_5
//  Generated from file(s):
//    2) $PROJECT_HOME/reduce_by_5.cpp
// ------------------------------------------------------------------


module reduce_by_5 (
  vin_rsc_z, clk_reg_rsc_z, vout_rsc_z, clk, en, arst_n
);
  input [149:0] vin_rsc_z;
  output clk_reg_rsc_z;
  output vout_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [149:0] vin_rsc_mgc_in_wire_d;
  wire clk_reg_rsc_mgc_out_stdreg_d;
  wire vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(150)) vin_rsc_mgc_in_wire (
      .d(vin_rsc_mgc_in_wire_d),
      .z(vin_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(1)) clk_reg_rsc_mgc_out_stdreg (
      .d(clk_reg_rsc_mgc_out_stdreg_d),
      .z(clk_reg_rsc_z)
    );
  mgc_out_stdreg #(.rscid(3),
  .width(1)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  reduce_by_5_core reduce_by_5_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vin_rsc_mgc_in_wire_d(vin_rsc_mgc_in_wire_d),
      .clk_reg_rsc_mgc_out_stdreg_d(clk_reg_rsc_mgc_out_stdreg_d),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d)
    );
endmodule


