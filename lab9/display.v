module display(
    input clk,
    input reset,
    input [2:0] coin,
    input [3:0] product,
    output [3:0] AN,
    output [6:0] CA
    );
    
    wire clkEn;
    wire clock1;
    wire change;
    wire [7:0] balance;
    reg [7:0] cost;
    wire [1:0] Select;
    reg [3:0] Hex;


   always @(product) begin
      case (product)
         4'b0000: cost = 0;
         4'b0001: cost = 15;
         4'b0010: cost = 20;
         4'b0100: cost = 25;
         4'b1000: cost = 30;
         default: cost = 0;
      endcase

   end
//is this the part we need to change?
//4 to 1 MUX
    always @(coin, product, change, Select) begin
        case (Select)
            2'b00: Hex = balance[3:0];
            2'b01: Hex = balance[7:4];
            2'b10: Hex = cost[3:0];
            2'b11: Hex = cost[7:4];
        endcase
    end

   //I think the clock input should be clock1, but not totally sure

    vendingMachine VM1 (.clock(clock1), .reset(reset), .coin(coin), .cost(cost), .balance(balance), .change(change));
    clock C2 (.clk(clk), .reset(reset), .clk_en(clock1));
    clkEnable C1 (.clk(clk), .reset (reset), .clk_en (clkEn) ) ;
    anodeDriver AD1 (.clk(clk),.clk_en(clkEn), .reset(reset), .AN(AN), .S(Select)) ;
    hex2sevseg H1 (.x (Hex), .ca (CA) ) ;

    
endmodule

//END DISPLAY MODULE

