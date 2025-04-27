module datapath (
    input [11:0] a,
    input clk, 
    input clr, 
    input en_a,
    input en_del,
    input en_sqrt,
    input en_out, 
    input ld_add,
    output reg [3:0] sqrt.
    output reg greater
);

    reg [7:0] sq;
    reg [7:0] del;

    initial begin 
        sq = 8'b00000001; //sq = 1
        del = 8'b00000011;// del = 3
    end

    always @(posedge clk or posedge clr) begin
        //TODO: The datapath!
    end

    
    
endmodule