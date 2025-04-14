module rippleCarry (
   input [3:0] a,
   input [3:0] b,
   output [3:0] s
);

wire c0, c1, c2, c3, c4;
// wire c_in;
// assign c_in = 0;

fullAdder adder1 (
   .a(a[0]),
   .b(b[0]),
   .c_in(1'b0),
   .c_out(c0),
   .s(s[0])
);

fullAdder adder2 (
   .a(a[1]),
   .b(b[1]),
   .c_in(c0),
   .s(s[1]),
   .c_out(c1)
);

fullAdder adder3 (
   .a(a[2]),
   .b(b[2]),
   .c_in(c1),
   .s(s[2]),
   .c_out(c2)
);

fullAdder adder4 (
   .a(a[3]),
   .b(b[3]),
   .c_in(c2),
   .s(s[3]),
   .c_out(c3)
);

endmodule

