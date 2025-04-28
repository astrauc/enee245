module controller (
    input greater,
    input start, 
    input clk,
    input clr, 
    output reg en_a,
    output reg en_del,
    output reg en_sq,
    output reg en_out, 
    output reg ld_add
);

parameter START = 2'b00, GO = 32'b01, ENDS = 2'b10;
//start state just inits.
//go will always keep adding and whatever
//ends will say time to divide by 2 subtract 1

reg [1:0] curr_state;
reg [1:0] next_state;

initial begin //set initial state
    curr_state = START;
    next_state = START;
end 

always @(start, clr, greater) begin //inputs
    if (clr) begin 
        
        next_state = START;
    end else if (greater) next_state = ENDS;
    else if (start) next_state = GO;
    
    
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
            en_a = 1;
            en_del = 1;
            en_sq = 1;
            en_out = 0;
            ld_add = 0; //ld instead of add
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