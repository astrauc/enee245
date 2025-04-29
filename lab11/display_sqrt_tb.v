`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2025 06:04:06 PM
// Design Name: 
// Module Name: display_sqrt_tb
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


module display_sqrt_tb(

    );
    reg clk = 0, clr = 0, start = 0;
    reg [7:0] a;
    wire [6:0] CA;
    wire [3:0] AN;
    integer i;
    display_sqrt uut (
        .clk(clk),
        .clr(clr),
        .start(start),
        .a(a),
        .CA(CA),
        .AN(AN)
    );
    
    always #1 clk = ~clk;
    
    initial begin 
            clr = 1; #10; clr = 0; #10;
            a = 45; start = 1; #10; start = 0; #320;
            clr =1; #4; clr = 0; #4;
        
    end
endmodule
