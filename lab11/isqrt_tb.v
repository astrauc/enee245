`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2025 05:15:55 PM
// Design Name: 
// Module Name: isqrt_tb
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


module isqrt_tb(

    );
    reg clk = 0, clr = 0, start = 0;
    reg [7:0] a;
    wire [3:0] sqrt;
    integer i;
    isqrt uut (
        .clk(clk),
        .clr(clr),
        .start(start),
        .a(a),
        .sqrt(sqrt)
    );
    
    always #1 clk = ~clk;
    
    initial begin 
    a = 0;
        $display("Running isqrt simulation...");
        for (i = 1; i < 130; i = i + 8) begin 
            a = i; start = 1; #10; start = 0; #40;
            $display("the isqrt of %d is %d", a, sqrt);
            clr = 1; #2; clr = 0; #2;
        end
        a = 9; start = 1; #10; start = 0; #40;
            $display("the isqrt of %d is %d", a, sqrt);
            clr = 1; #2; clr = 0; #2;
            a = 8; start = 1; #10; start = 0; #40;
            $display("the isqrt of %d is %d", a, sqrt);
            clr = 1; #2; clr = 0; #2;
    end
    
    
endmodule


