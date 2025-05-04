module datapath (
    input [7:0] A,
    input [7:0] B,
    input en_gt,
    input ld_en.
    input en_addsub,
    input en_norm,
    input en_out,
    input add_sub,
    input norm_lr,
    output greater,
    output sign_gt, 
    output sign_lt,
    output mant4,
    output mant5,
    output s,
);
    
reg sign_ans;
reg [4:0] mant_lt;
reg [4:0] mant_gt;
reg [4:0] mant_ans;
reg [3:0] exp_lt;
reg [3:0] exp_gt;
reg [3:0] exp_ans;
reg [6:0] loader;

always @(posedge clk or posedge clr) begin 
    if (clr) begin                                      // clear
        mant_lt = 0;
        mant_gt = 0;
        mant_ans = 0;
        exp_lt = 0;
        exp_gt = 0;
        exp_ans = 0;
        loader = 0;
    end else begin                                      // start
        if (en_gt && A[6:0] >= B[6:0]) greater = 1;
        else if (en_gt) greater = 0;

        else if (ld_en) begin                           // loading inputs
            if (ld_AB) begin // A[6:0] >= B[6:0]
                gt = A; 
                lt = B;
            end else begin // B[6:0] > A[6:0]
                gt = B;
                lt = A;
            end
            sign_gt = gt[7];
            exp_gt = gt[6:3]; 
            mant_gt = {2'b01, gt[2:0]};
            sign_lt = lt[7];
            exp_lt = lt[6:3]; 
            mant_lt = {2'b01, t[2:0]};
            exp_ans = exp_gt;
            sign_ans = sign_gt;
            mant_lt = mant_lt >> (exp_gt - exp_lt);
        end else if (en_addsub) begin                   // addition or suubtraction
            if (add_sub) begin //add
                mant_ans = mant_gt + mant_ls;           
            end else begin //subtract
                mant_ans = mant_gt - mant_ls;
            end
        end else if (en_norm) begin                     // normalizing
            if (norm_lr) begin
                mant_ans << 1;
                exp_ans = exp_ans - 1;
                mant4 = mant_ans [3];
                mant5 = mant_ans [4];
            end
            else begin
                mant_ans >> 1;
                exp_ans = exp_ans + 1;
                mant4 = mant_ans[3];
                mant5 = mant_ans[4];
        end else if (en_out) begin                      // setting outputs
            s = {sign_ans, exp_ans, mant_ans}
        end

    end
end
endmodule