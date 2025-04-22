`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 04:14:50 PM
// Design Name: 
// Module Name: bigman_tb
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


module bigman_tb(

    );
    reg clk = 0, clr, start;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;
    integer i, j;
    bigman uut (
        .clk(clk),
        .clr(clr),
        .start(start),
        .a(a),
        .b(b),
        .p(p)
    
    );
    
    always #5 clk = ~clk;
    
    initial begin 
        clr = 0;
        
        a = 15;
            b =15;
            start = 1; 
            #5; start = 0;
            #45;
            $display("A *B = P: %d * %d = %d", a, b, p);
            clr = 1;
            #5; clr = 0;
            #5;
        for (i = 2; i < 8; i = i + 3) begin
            for (j = 3; j < 8; j = j + 2) begin
            a = i;
            b = j;
            start = 1; 
            #5; start = 0;
            #45;
            $display("A *B = P: %d * %d = %d", a, b, p);
            clr = 1;
            #5; clr = 0;
            #5;
           
            end
        
        end
    
    end
endmodule
