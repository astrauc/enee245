// this is the equivalent to bigman from lab10
module isqrt (
    input [7:0] a,
    input [3:0] sqrt
);

    wire en_a, en_del, en_sq, en_out, ld_add, greater;

    initial begin
        en_a = 0;
        en_del = 0;
        en_sq = 0;
        en_out = 0;
        ld_add = 0;
        greater = 0;
    end

    // TODO: put the datapath and controller in 
    
endmodule