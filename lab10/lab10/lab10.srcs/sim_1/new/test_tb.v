`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 04:33:07 PM
// Design Name: 
// Module Name: test_tb
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


module test_tb(

    );
    
  reg [3:0]  data1;
  reg [7:0]  data2;

  initial begin
    data1 = 5;
    data2 = 9;

    data2 = data1 + data2;
    $display("Data2 = %d", data2);
    $display ("Add + = %d", data1 + data2);
    $display ("Sub - = %d", data1 - data2);
    $display ("Mul * = %d", data1 * data2);
    $display ("Div / = %d", data1 / data2);
    $display ("Mod %% = %d", data1 % data2);
    $display ("Pow ** = %d", data2 ** 2);

  end
endmodule

