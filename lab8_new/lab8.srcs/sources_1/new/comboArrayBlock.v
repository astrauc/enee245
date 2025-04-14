`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 06:39:53 PM
// Design Name: 
// Module Name: comboArrayBlock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comboArrayBlock(
	input c_in,
	input x,
	input y,
	input sum_in,
	output c_out,
	output sum_out
);
wire xy;
assign xy = x&y;

fullAdder fa (
	.a(sum_in),
	.b(xy),
	.c_in(c_in),
	.c_out(c_out),
	.s(sum_out)
);

endmodule
