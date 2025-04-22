module bigman (
   input clk,
   input clr,  
   input start,
   input [3:0] a,
   input [3:0] b,
   output [7:0] p
);

   wire en_a, en_b, en_p, ld_add_p, ld_shift_a, ld_shift_b;
   wire zero, lsb_b;

   datapath D (
      .clk(clk),
      .clr(clr),
      .en_a(en_a),
      .en_b(en_b),
      .en_p(en_p),
      .ld_add_p(ld_add_p),
      .ld_shift_a(ld_shift_a),
      .ld_shift_b(ld_shift_b),
      .a(a),
      .b(b),
      .p(p),
      .zero(zero),
      .lsb_b(lsb_b)
   );

   controller C (
  
     .en_a(en_a),
      .en_b(en_b),
      .en_p(en_p),
      .ld_add_p(ld_add_p),
      .ld_shift_a(ld_shift_a),
      .ld_shift_b(ld_shift_b),
      .start(start),
      .zero(zero),
      .lsb_b(lsb_b) 
   );
   
endmodule