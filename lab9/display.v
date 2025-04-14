module display(
    input clk,
    input reset,
    input [3:0] Dig0,
    input [3:0] Dig1,
    input [3:0] Dig2,
    input [3:0] Dig3,
    output [3:0] AN,
    output [6:0] CA
    );
    
    wire clkEn;
    wire [1:0] Select;
    reg [3:0] Hex;



//is this the part we need to change?
//4 to 1 MUX
    always @(Dig0, Dig1, Dig2, Dig3, Select) begin
        case (Select)
            2'b00: Hex = Dig0;
            2'b01: Hex = Dig1;
            2'b10: Hex = Dig2;
            2'b11: Hex = Dig3;
        endcase
    end
    clkEnable C1 (.clk(clk), .reset (reset), .clk_en (clkEn) ) ;
    anodeDriver AD1 (.clk(clk),.clk_en(clkEn), .reset(reset), .AN(AN), .S(Select)) ;
    hex2sevseg H1 (.x (Hex), .ca (CA) ) ;

    
endmodule

//END DISPLAY MODULE

