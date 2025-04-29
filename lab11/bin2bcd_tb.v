`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2025 05:05:26 PM
// Design Name: 
// Module Name: bin2bcd_tb
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


module bin2bcd_tb(

    );
    
    reg [7:0] bin;
   wire [11:0] bcd;
   integer i;
   bin2bcd uut(.bin(bin), .bcd(bcd));

   initial begin
      $display("running sim...");

      for (i = 0; i < 256; i = i + 15) begin 
         bin = i; #5;
         $display("Bin = %d, BCD = %d, %d, %d", bin, bcd[11:8], bcd[7:4], bcd[3:0]);
      end
   end
endmodule
