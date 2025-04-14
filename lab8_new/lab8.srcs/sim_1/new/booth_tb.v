`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 06:27:41 PM
// Design Name: 
// Module Name: mult_tb
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


module booth_tb(

    );
    
 	reg [3:0] a;
	reg [3:0] b;
	wire [7:0] p;

booth uut(
.a(a),
.b(b),
.p(p)
);

initial begin
    $display("Beginning simulation for booth multiplier...");
      a = 4'b1010; b = 4'b0111;
      #10; 
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10;
      a = 4'b1101; b = 4'b0101;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10; 
      a = 4'b1010; b = 4'b1011;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10;
      a = 4'b0110; b = 4'b0100;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10; 

   end
endmodule 


