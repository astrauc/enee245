// this is the equivalent to bigman from lab10
module isqrt (
    input [7:0] a,
    input clk,
    input clr,
    input start,
    output [3:0] sqrt
);

    wire en_a, en_del, en_sq, en_out, ld_add, greater;

//    initial begin
//        en_a = 0;
//        en_del = 0;
//        en_sq = 0;
//        en_out = 0;
//        ld_add = 0;
//        greater = 0;
//    end
    
    controller C (
        .greater(greater),
        .start(start),
        .clk(clk),
        .clr(clr),
        .en_a(en_a),
        .en_del(en_del),
        .en_out(en_out),
        .en_sq(en_sq),
        .ld_add(ld_add)
        );
    datapath D (
        .clk(clk),
        .clr(clr),
        .a(a),
        .en_a(en_a),
        .en_del(en_del),
        .en_out(en_out),
        .en_sq(en_sq),
        .ld_add(ld_add),
        .greater(greater),
        .sqrt(sqrt)
    );
    
endmodule