`timescale 1ns / 1ps
module mult (
   input [3:0] a,
   input [3:0] b,
   output [7:0] s
);

wire c_next[12:0];
wire temp_and[15:0];
wire temp_carry[15:0];
assign s[0] = a[0] & b[0];

assign temp_and[0] = a[1] & b[0];
assign temp_and[1] = a[0] & b[1];
halfAdder HA1 (.a(temp_and[0]), .b(temp_and[1]), .c_out(temp_carry[0]), .s(s[1]));


assign temp_and[2] = a[0] & b[2];
assign temp_and[3] = a[1] & b[1];
assign temp_and[4] = a[2] & b[0];
halfAdder HA2 (.a(temp_and[2]), .b(temp_and[3]), .c_out(temp_carry[1]), .s(c_next[0]));
fullAdder FA1 (.a(temp_and[4]), .b(c_next[0]), .c_in(temp_carry[0]), .c_out(temp_carry[2]), .s(s[2]));


assign temp_and[5] = a[0] & b[3];
assign temp_and[6] = a[1] & b[2];
assign temp_and[7] = a[2] & b[3];
assign temp_and[8] = a[3] & b[0];
halfAdder HA8 (.a(temp_and[5]), .b(temp_and[6]), .c_out(temp_carry[3]), .s(c_next[1]));
fullAdder FA2 (.a(temp_and[7]), .b(c_next[1]), .c_in(temp_carry[1]), .c_out(temp_carry[4]), .s(c_next[2]));
fullAdder FA3 (.a(temp_and[8]), .b(c_next[2]), .c_in(temp_carry[2]), .c_out(temp_carry[5]), .s(s[3]));


assign temp_and[9] = a[1] & b[3];
assign temp_and[10] = a[2] & b[2];
assign temp_and[11] = a[3] & b[1];
fullAdder FA4 (.a(temp_and[9]), .b(temp_and[10]), .c_in(temp_carry[3]), .c_out(temp_carry[6]), .s(c_next[3]));
fullAdder FA5 (.a(temp_and[11]), .b(c_next[3]), .c_in(temp_carry[4]), .c_out(temp_carry[7]), .s(c_next[4]));
halfAdder HA4 (.a(c_next[4]), .b(temp_carry[5]), .c_out(temp_carry[8]), .s(s[4]));


assign temp_and[12] = a[3] & b[2];
assign temp_and[13] = a[2] & b[3];
fullAdder FA7 (.a(temp_and[12]), .b(temp_and[13]), .c_in(temp_carry[6]), .c_out(temp_carry[9]), .s(c_next[5]));
fullAdder FA8 (.a(temp_carry[7]), .b(c_next[5]), .c_in(temp_carry[8]), .c_out(temp_carry[10]), .s(s[5]));

assign temp_and[14] = a[3] & b[3];
fullAdder FA9 (.a(temp_and[14]), .b(temp_carry[9]), .c_in(temp_carry[10]), .c_out(s[7]), .s(s[6]));


endmodule
