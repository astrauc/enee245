module display_sqrt (
   input clk,
   input clr,
   input start,
   input [7:0] a,
   output [6:0] CA,
   output [3:0] AN
);

   reg [3:0] sqrt;
   reg [11:0] sqrt_bcd;
   reg [11:0] a_bcd;
   reg [15:0] disp;

   bin2bcd B (.bin(a), .bcd(a_bcd));
   bin2bcd B2(.bin({4'b0000, sqrt}), .bcd(sqrt_bcd));
   isqrt I (
      .a(a), .clk(clk), .clr(clr), .start(start), .sqrt(sqrt)
   );
   display D1 (.clk(clk), .reset(clr), 
   .dig0(disp[15:12]), .dig1(disp[11:8]), .dig2(disp[7:4]), .dig3(disp[3:0]), 
   .AN(AN), .CA(CA)
   );

   bin2bcd Ba (.bin(a), .bcd(a_bcd));
   bin2bcd Bsqrt (.bin({4'b0000, sqrt}), .bcd(sqrt_bcd));

   

   
endmodule