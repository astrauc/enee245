
module fullAdder (
   input a,
   input b,
   input c_in,
   output s,
   output c_out   
);

wire s1, c1, c2;
halfAdder HA1 (.a(a), .b(b), .c_out(c1), .s(s1));
halfAdder HA2 (.a(s1), .b(c_in), .s(s), .c_out(c2));

assign c_out = c1 | c2;
   
endmodule