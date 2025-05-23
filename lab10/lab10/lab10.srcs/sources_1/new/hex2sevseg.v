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