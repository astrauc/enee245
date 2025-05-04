module controller (
    input clk,
    input clr,
    input start, 
    input sign_gt,
    input sign_lt,
    input mant5,
    input mant4,
    input greater, //greater == 1 means A[6:0] is larger
    output reg en_ld,
    output reg en_gt,
    output reg en_addsub,
    output reg en_norm,
    output reg en_out,
    output reg add_sub,
    output reg norm_lr,
    output reg ld_AB
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
    end else begin 
    case(curr_state)
        START: begin 
            if (start && greater) next_state = INIT_A;
            else if (start) next_state = INIT_B;
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
        NORML: begin 
            if (mant5) next_state = NORMR;
            else if (mant5 == 0 && mant4 == 0) next_state = NORML;
            else next_state = DONE;
        end
        NORMR: begin 
            if (mant5) next_state = NORMR;
            else if (mant5 == 0 && mant4 == 0) next_state = NORML;
            else next_state = DONE;
        end
        DONE: begin 
            next_state = DONE;
        end
    endcase
    end
    
    
end 

always @(negedge clk or posedge clr) begin //at the negedge because datapath already has the posedge
   if (clr) begin
      curr_state <= START;
   end else begin
      curr_state <= next_state;
      
   end
end

always @(curr_state) begin 
    case(curr_state)
        START: begin 
            en_gt = 1;
            en_ld = 0;
            en_addsub = 0;
            en_norm = 0;
            en_out = 0;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 0;
        end
        INIT_A: begin 
            en_gt = 0;
            en_ld = 1;
            en_addsub = 0;
            en_norm = 0;
            en_out = 0;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 1;
        end 
        INIT_B: begin
            en_gt = 0;
            en_ld = 1;
            en_addsub = 0;
            en_norm = 0;
            en_out = 0;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 0; 
        end
        ADD: begin
            en_gt = 0;
            en_ld = 0;
            en_addsub = 1;
            en_norm = 0;
            en_out = 0;
            add_sub = 1;
            norm_lr = 0;
            ld_AB = 0;  
        end
        SUB: begin
            en_gt = 0;
            en_ld = 0;
            en_addsub = 1;
            en_norm = 0;
            en_out = 0;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 0; 
        end
        NORML: begin
            en_gt = 0;
            en_ld = 0;
            en_addsub = 0;
            en_norm = 1;
            en_out = 0;
            add_sub = 0;
            norm_lr = 1;
            ld_AB = 0;
        end
        NORMR: begin
            en_gt = 0;
            en_ld = 0;
            en_addsub = 0;
            en_norm = 1;
            en_out = 0;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 0;
        end
        DONE: begin
            en_gt = 0;
            en_ld = 0;
            en_addsub = 0;
            en_norm = 0;
            en_out = 1;
            add_sub = 0;
            norm_lr = 0;
            ld_AB = 0;
        end
    endcase

end 

    
endmodule