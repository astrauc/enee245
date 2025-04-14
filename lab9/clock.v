module clock(
    input clk,
    input reset,
    output reg clk_en
    );
    
   
    integer count = 0;
// 1 Hz clk enable (counting to 100000000)
    always @(posedge clk or posedge reset)
    begin
    if (reset == 1) begin
        count <= 0; 
        clk_en <= 0;
    end else if (count == 99999999) begin
        count <= 0;
        clk_en <= 1;
    end else begin
        count <= count + 1;
        clk_en <= 0;
    end
    end
endmodule
