module fpadd (
        input [7:0] a,
        input [7:0] b,
        input clk,
        input clr,
        input start,
        output [7:0] s
    );
    
    wire en_gt, en_ld, en_addsub, en_norm, en_out;
    wire greater, norm_lr, add_sub, mant4, mant5, ld_AB, sign_gt, sign_lt;

    controller C(
        .clk(clk),
        .clr(clr),
        .start(start),
        .sign_gt(sign_gt),
        .sign_lt(sign_lt),
        .mant4(mant4),
        .mant5(mant5),
        .greater(greater),
        .en_gt(en_gt),
        .en_ld(en_ld),
        .en_addsub(en_addsub),
        .en_norm(en_norm),
        .en_out(en_out),
        .add_sub(add_sub),
        .norm_lr(norm_lr),
        .ld_AB(ld_AB)
    );

    
    datapath D(
        .A(a),
        .B(b),
        .en_gt(en_gt),
        .en_ld(en_ld),
        .en_addsub(en_addsub),
        .en_norm(en_norm),
        .en_out(en_out),
        .add_sub(add_sub),
        .norm_lr(norm_lr),
        .ld_AB(ld_AB),
        .greater(greater),
        .sign_gt(sign_gt), 
        .sign_lt(sign_lt),
        .mant4(mant4),
        .mant5(mant5),
        .s(s)
    );

endmodule