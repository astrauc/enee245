module display(
    input clk,
    input reset,
    input start,
    input [3:0] a,
    input [3:0] b,
    input [7:0] p,
    output [3:0] AN,
    output [6:0] CA
    );
    
    wire clkEn;
    wire [1:0] Select;
    reg [3:0] Hex;

//is this the part we need to change?
//4 to 1 MUX
    always @(a, b, p, Select) begin
        case (Select)
            2'b00: Hex = p[3:0];
            2'b01: Hex = p[7:4];
            2'b10: Hex = b[3:0];
            2'b11: Hex = a[7:4];
        endcase
    end

   //I think the clock input should be clock1, but not totally sure
    bigman B1 (.clk(clk), .clr(reset), .start(start), .a(a), .b(b), .p(p)) ;
    clkEnable C1 (.clk(clk), .reset (reset), .clk_en (clkEn) ) ;
    anodeDriver AD1 (.clk(clk),.clk_en(clkEn), .reset(reset), .AN(AN), .S(Select)) ;
    hex2sevseg H1 (.x (Hex), .ca (CA) ) ;

    
endmodule

//END DISPLAY MODULE