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

module clkEnable(
    input clk,
    input reset,
    output reg clk_en
    );
    
   
    integer count = 0;
// 1 kHa olk enable (counting to 100000)
    always @(posedge clk or posedge reset)
    begin
    if (reset == 1) begin
        count <= 0; 
        clk_en <= 0;
    end else if (count == 99999) begin
        count <= 0;
        clk_en <= 1;
    end else begin
        count <= count + 1;
        clk_en <= 0;
    end
    end
endmodule

module anodeDriver(
    input clk,
    input clk_en,
    input reset,
    output reg [3:0] AN,
    output reg [1:0] S
    );
    
   
    always @ (posedge clk or posedge reset) begin
    if (reset == 1)
        S <= 0;
    else if (clk_en == 1)
        S <= S+1;
    end
    
    
    always @(S) begin
        case (S)
            2'b00: AN <= 4'b1110; 
            2'b01: AN <= 4'b1101;
            2'b10: AN <= 4'b1011;
            2'b11: AN <= 4'b0111;
        endcase
    end
endmodule

module hex2sevseg(
    input [3:0]x,
    output reg [6:0]ca
    );
    
    always @(x) begin
        case(x)
            4'h0: ca <= 7'b0000001;
            4'h1: ca <= 7'b1001111;
            4'h2: ca <= 7'b0010010;
            4'h3: ca <= 7'b0000110;
            4'h4: ca <= 7'b1001100;
            4'h5: ca <= 7'b0100100;
            4'h6: ca <= 7'b0100000;
            4'h7: ca <= 7'b0001111;
            4'h8: ca <= 7'b0000000;
            4'h9: ca <= 7'b0000100;
            4'hA: ca <= 7'b0001000;
            4'hB: ca <= 7'b1100000;
            4'hC: ca <= 7'b0110001;
            4'hD: ca <= 7'b1000010;
            4'hE: ca <= 7'b0110000;
            4'hF: ca <= 7'b0111000;
            
        endcase
    end
endmodule