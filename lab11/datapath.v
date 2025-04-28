module datapath (
    input [7:0] a,
    input clk, 
    input clr, 
    input en_a,
    input en_del,
    input en_sq,
    input en_out, 
    input ld_add,
    output reg [3:0] sqrt,
    output reg greater
);

    reg [7:0] sq;
    reg [7:0] del;

    initial begin 
        sq = 8'b00000001; //sq = 1
        del = 8'b00000011;// del = 3
    end

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            greater = 0;
            sq = 1;
            del = 3;
            sqrt = 0;
        end else begin
            if (en_a && sq > a) begin 
                greater = 1;

            end else if (!ld_add) begin
                if (en_del) del = 3;
                if (en_sq) sq = 1;
            end else if (ld_add) begin
           
                if (en_sq) sq = sq + del;
                if (en_del) del = del + 2;
            end



            if (en_out) begin
            
                sqrt = (del >> 1) - 1;
            end
        end



    end

    
    
endmodule