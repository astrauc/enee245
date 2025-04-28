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
