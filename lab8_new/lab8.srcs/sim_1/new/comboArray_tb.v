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


module comboArrray_tb(

    );
    
 	reg [3:0] a;
	reg [3:0] b;
	wire [7:0] p;

comboArray uut(
.a(a),
.b(b),
.p(p)
);

initial begin
    $display("Beginning simulation for combo Array multiplier...");
      a = 4'b0111; b = 4'b0010;
      #10; 
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10;
      a = 4'b1111; b = 4'b0101;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10; 
      a = 4'b0110; b = 4'b1011;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10;
      a = 4'b0100; b = 4'b0011;
      #10;
      $display("A =  %d, B = %d: %d * %d = %d", a, b, a, b, p);
      #10; 

   end
endmodule 


