module controller (
    input greater,
    input start, 
    input clk,
    input clr, 
    output en_a,
    output en_del,
    output en_sqrt,
    output en_out, 
    output ld_add,
);

parameter START = 2'b00, GO = 32'b01, ENDS = 2'b10;

reg [1:0] curr_state;
reg [1:0] next_state;

initial begin
    curr_state = START;
    next_state = START;
end 

always @(start, clr, greater) begin 
    if (clr) begin 
        curr_state = START;
        next_state = START;
    end else if (greater) next_state = ENDS;
    else if (start) next_state = GO;
    
end 

always @(negedge clk or posedge clr) begin
   if (clr) begin
      curr_state <= START;
//      change <= 0;
   end else begin
      curr_state <= next_state;
      
   end
end

always @(curr_state) begin 
    case(curr_state)
        START: begin 
            en_a = 1;
            en_del = 1;
            en_sqrt = 1;
            en_out = 0;
            ld_add = 0;
        end
        GO: begin 
            en_a = 1;
            en_del = 1;
            en_sqrt = 1;
            en_out = 0;
            ld_add = 1;
        end 
        ENDS: begin
            en_a = 0;
            en_del = 0;
            en_sqrt = 0;
            en_out = 1;
            ld_add = 0;
        end
    endcase

end 


    
endmodule