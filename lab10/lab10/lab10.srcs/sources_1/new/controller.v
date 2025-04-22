`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:50:20 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input zero,
    input lsb_b,
    input start,
    output reg en_a,
    output reg en_b,
    output reg en_p,
    output reg ld_add_p,
    output reg ld_shift_a,
    output reg ld_shift_b
    );
    
    
    always @(*) begin 
   if (start) begin 
      ld_add_p = 0;
      ld_shift_a = 0;
      ld_shift_b = 0;
      en_a = 1;
      en_b = 1;
      en_p = 1;
   end else begin 
      if (zero) begin 
         en_a = 0;
         en_b = 0;
         en_p = 0;
      end else begin 
         ld_shift_a = 1;
         ld_shift_b = 1;
         if (lsb_b) begin 
            ld_add_p = 1;
         end else begin 
            ld_add_p = 0;
         end 
      end
   end 
 end
endmodule
