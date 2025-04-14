`timescale 1ns / 1ps
module comboArray (
	input [3:0] a,
	input [3:0] b,
	output [7:0] p
);

// there should be 29 wires
wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14;
wire cF1, cF2;
wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;
wire dummy;
//s0, s4, s8, s12 not used (?)

//there should be 16 cabs and 3fas
comboArrayBlock cab1(
	.x(a[0]),
	.y(b[0]),
	.c_in(1'b0),
	.sum_in(1'b0),
	.c_out(c0),
	.sum_out(p[0])
);

comboArrayBlock cab2(
	.x(a[1]),
	.y(b[0]),
	.c_in(1'b0),
	.sum_in(1'b0),
	.c_out(c1),
	.sum_out(s1)
);
comboArrayBlock cab3(
	.x(a[2]),
	.y(b[0]),
	.c_in(1'b0),
	.sum_in(1'b0),
	.c_out(c2),
	.sum_out(s2)
);

comboArrayBlock cab4(
	.x(a[3]),
	.y(b[0]),
	.c_in(1'b0),
	.sum_in(1'b0),
	.c_out(c3),
	.sum_out(s3)
);

comboArrayBlock cab5(
	.x(a[0]),
	.y(b[1]),
	.c_in(c0),
	.sum_in(s1),
	.c_out(c4),
	.sum_out(p[1])
);

comboArrayBlock cab6(
	.x(a[1]),
	.y(b[1]),
	.c_in(c1),
	.sum_in(s2),
	.c_out(c5),
	.sum_out(s5)
);

comboArrayBlock cab7(
	.x(a[2]),
	.y(b[1]),
	.c_in(c2),
	.sum_in(s3),
	.c_out(c6),
	.sum_out(s6)
);

comboArrayBlock cab8(
	.x(a[3]),
	.y(b[1]),
	.c_in(c3),
	.sum_in(1'b0),
	.c_out(s7),
	.sum_out(c7)
);

comboArrayBlock cab9(
	.x(a[0]),
	.y(b[2]),
	.c_in(c4),
	.sum_in(s5),
	.c_out(c8),
	.sum_out(p[2])
);

comboArrayBlock cab10(
	.x(a[1]),
	.y(b[2]),
	.c_in(c5),
	.sum_in(s6),
	.c_out(c9),
	.sum_out(s9)
);

comboArrayBlock cab11(
	.x(a[2]),
	.y(b[2]),
	.c_in(c6),
	.sum_in(s7),
	.c_out(c10),
	.sum_out(s10)
);

comboArrayBlock cab12(
	.x(a[3]),
	.y(b[2]),
	.c_in(c7),
	.sum_in(1'b0),
	.c_out(c11),
	.sum_out(s11)
);

comboArrayBlock cab13(
	.x(a[0]),
	.y(b[3]),
	.c_in(c8),
	.sum_in(s9),
	.c_out(c12),
	.sum_out(p[3])
);

comboArrayBlock cab14(
	.x(a[1]),
	.y(b[3]),
	.c_in(c9),
	.sum_in(s10),
	.c_out(c13),
	.sum_out(s13)
);

comboArrayBlock cab15(
	.x(a[2]),
	.y(b[3]),
	.c_in(c10),
	.sum_in(s11),
	.c_out(c14),
	.sum_out(s14)
);

comboArrayBlock cab16(
	.x(a[3]),
	.y(b[3]),
	.c_in(c11),
	.sum_in(1'b0),
	.c_out(dummy),
	.sum_out(s15)
);

fullAdder fa0(
	.c_in(1'b0),
	.a(c12),
	.b(s13),
	.s(p[4]),
	.c_out(cF1)
);
fullAdder fa1(
	.c_in(cF1),
	.a(c13),
	.b(s14),
	.s(p[5]),
	.c_out(cF2)
);
fullAdder fa3(
	.c_in(cF2),
	.a(c14),
	.b(s15),
	.s(p[6]),
	.c_out(p[7])
);

endmodule
