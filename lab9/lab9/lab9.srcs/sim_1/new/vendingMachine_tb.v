`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 03:13:43 PM
// Design Name: 
// Module Name: vendingMachine_tb
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


module vendingMachine_tb();

    reg clock = 0, reset = 0;
    reg [2:0] coin;
    reg [7:0] product;
    wire [7:0] balance;
    wire change;
    
    
    vendingMachine uut(
        .clock(clock),
        .reset(reset),
        .coin(coin),
        .product(product),
        .balance(balance),
        .change(change)
    );
    
    always #1 clock = ~clock;
       
    initial begin
        #10
        coin = 3'b100;
        product = 4'b0000;
        #20;
        coin = 3'b010;
        product = 4'b0000;
        #20;
        coin = 3'b0001;
        product = 4'b1000;
        #20;
        product = 4'b0000;
        coin = 3'b000;
        #10
        product = 4'b0000;
        #50;
        coin = 3'b001;
        #10; coin = 3'b000;
        #10; coin = 3'b001;
        #10; coin = 3'b000;
        #10; coin = 3'b001;
        #10; coin = 3'b000;
            
        #10; product = 4'b0001;
        #20; product = 4'b0000;
        
    end
endmodule
