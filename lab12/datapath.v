module datapath (
    input [7:0] A,
    input [7:0] B,
    input en_gt,
    input en_ld,
    input en_addsub,
    input en_norm,
    input en_out,
    input add_sub,
    input norm_lr,
    input ld_AB,
    output reg greater,
    output reg sign_gt, 
    output reg sign_lt,
    output reg mant4,
    output reg mant5,
    output reg s,
);
    
reg sign_ans;
reg [4:0] mant_lt;
reg [4:0] mant_gt;
reg [4:0] mant_ans;
reg [3:0] exp_lt;
reg [3:0] exp_gt;
reg [3:0] exp_ans;
reg [7:0] gt;
reg [7:0] lt;

always @(posedge clk or posedge clr) begin 
    if (clr) begin                                      // clear
        mant_lt = 0;
        mant_gt = 0;
        mant_ans = 0;
        exp_lt = 0;
        exp_gt = 0;
        exp_ans = 0;
        sign_ans = 0;
        sign_gt = 0;
        sign_lt = 0;
        s = 0;
    end else begin                                      // start
        if (en_gt && A[6:0] >= B[6:0]) greater = 1;
        else if (en_gt) greater = 0;

        else if (en_ld) begin                           // loading inputs
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
            mant_lt = {2'b01, lt[2:0]};
            exp_ans = exp_gt;
            sign_ans = sign_gt;
            mant_lt = mant_lt >> (exp_gt - exp_lt);
        end else if (en_addsub) begin                   // addition or suubtraction
            if (add_sub) begin //add
                mant_ans = mant_gt + mant_ls;           
            end else begin //subtract
                mant_ans = mant_gt - mant_ls;
            end
        end else if (en_norm) begin  
            //normalize
            if (mant_ans == 0) begin
                mant4 = 1;
                mant5 = 0;
                s = 0;
            end else if (exp_ans == 15) begin 
                s = 8'b11111111;
                mant4 = 1;
                mant5 = 0;
            end else if (norm_lr) begin
                mant_ans = mant_ans << 1;
                exp_ans = exp_ans - 1;
                mant4 = mant_ans[3];
                mant5 = mant_ans[4];
            end else begin
                if (mant_ans[0]) mant_ans = mant_ans + 1;
                mant_ans = mant_ans >> 1;
                exp_ans = exp_ans + 1;
                mant4 = mant_ans[3];
                mant5 = mant_ans[4];
            end 
        end else if (en_out) begin                      // setting outputs
            if (s != 8'b11111111) s = {sign_ans, exp_ans, mant_ans[2:0]};
        end
        

    end
end
endmodule