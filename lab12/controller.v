module controller (
    input clk,
    input clr,
    input start, 
    input sign_gt,
    input sign_lt,
    input mant5,
    input mant4,
    input greater
    output en_ld,
    output en_ans,
    output en_out,
    output add_sub,
    output norm_lr,
    output ld_AB
);

parameter START = 3'b000, INIT_A = 3'b001, INIT_B = 3'b010, ADD = 3'b011, SUB = 3'b100, NORML = 3'b101, NORMR = 3'b110, DONE = 3'b111;

reg [2:0] curr_state;
reg [2:0] next_state;

initial begin //set initial state
    curr_state = START;
    next_state = START;
end 

always @(start, clr, sign_gt, sign_lt, mant5, mant4, greater) begin //inputs
    if (clr) begin 
        next_state = START;
    end 
    case(curr_state):
        START: begin 
            if (start && greater) next_state = INIT_A;
            else if (start) next_state = INIT_B
        end
        INIT_A: begin
            if (sign_gt == sign_lt) next_state = ADD;
            else next_state = SUB;
        end
        INIT_B: begin
            if (sign_gt == sign_lt) next_state = ADD;
            else next_state = SUB;
        end
        ADD: begin
            if (mant5) next_state = NORMR;
            else if (mant5 == 0 && mant4 == 0) next_state = NORML;
            else next_state = DONE;
        end
        SUB: begin
            if (mant5) next_state = NORMR;
            else if (mant5 == 0 && mant4 == 0) next_state = NORML;
            else next_state = DONE;
        end
    endcase
    
    
end 

always @(negedge clk or posedge clr) begin //at the negedge because datapath already has the posedge
   if (clr) begin
      curr_state <= START;
   end else begin
      curr_state <= next_state;
      
   end
end

  output en_ld,
    output en_ans,
    output en_out,
    output add_sub,
    output norm_lr,
    output ld_AB


always @(curr_state) begin 
    case(curr_state)
        START: begin 
            en_ans = 0;
            en_out = 0;
            add_sub = 0;
            ld_AB = 0;
            
        end
        GO: begin 
            en_a = 1;
            en_del = 1;
            en_sq = 1;
            en_out = 0;
            ld_add = 1; //add instead of ld
        end 
        ENDS: begin
            en_a = 0; //no more updating
            en_del = 0;
            en_sq = 0;
            en_out = 1;
            ld_add = 0; //do not think it matters since the rest are disabled
        end
    endcase

end 

    
endmodule