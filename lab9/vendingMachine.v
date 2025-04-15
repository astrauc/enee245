`timescale 1ns / 1ps
module vendingMachine (
   input clock,
   input reset,
   input [2:0] coin,
   input [3:0] product,
   output reg [7:0] balance, //Both outputs need to be regs because they will be assigned to in an always block
   output reg change //whether or not the balance leftover is change. 1 means change, 0 means regular balance

);

parameter Q = 3'b100, D = 3'b010, N = 3'b001;
parameter P1 = 4'b0001, P2 = 4'b0010, P3 = 4'b0100, P4 = 4'b1000;
parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 5'b0011, S4 = 4'b0100,
 S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
   S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, 
   S11 = 4'b1011, S12 = 4'b1100;

reg [3:0] curr_state = S0;
reg [3:0] next_state = S0;


// **Note** This is a mealy machine (i think because it has inputs)

// Next state logic block
// This computes:
// What state do we need to go to given the current state and the inputs
// Combinational logic block
always @(coin or product) begin
  
    if (coin == Q) begin
      case(curr_state)
         S0: next_state = S5;
         S1: next_state = S6;
         S2: next_state = S7;
         S3: next_state = S7;
         S4: next_state = S7;
         S5: next_state = S7;
         S6: next_state = S7;
         S7: next_state = S7;
         default: next_state = S0;
      endcase
      
   end else if (coin == D) begin
      case(curr_state)
         S0: next_state = S2;
         S1: next_state = S3;
         S2: next_state = S4;
         S3: next_state = S5;
         S4: next_state = S6;
         S5: next_state = S7;
         S6: next_state = S7;
         S7: next_state = S7;
         default: next_state = S0;
      endcase
   end else if (coin == N) begin//coin is N (nickel)
      case(curr_state)
         S0: next_state = S1;
         S1: next_state = S2;
         S2: next_state = S3;
         S3: next_state = S4;
         S4: next_state = S5;
         S5: next_state = S6;
         S6: next_state = S7;
         S7: next_state = S7;
         default: next_state = S0;
      endcase
   end else begin
    next_state = next_state;
   end
   
   if (product == P1) begin
      case(curr_state)
         S3: next_state = S8;
         S4: next_state = S9;
         S5: next_state = S10;
         S6: next_state = S11;
         S7: next_state = S12;
         default: next_state = curr_state;
      endcase
   end else if (product == P2) begin
      case(curr_state)
         S4: next_state = S8;
         S5: next_state = S9;
         S6: next_state = S10;
         S7: next_state = S11;
         default: next_state = curr_state;
      endcase
   end else if (product == P3) begin
      case(curr_state)
         S5: next_state = S8;
         S6: next_state = S9;
         S7: next_state = S10;
         default: next_state = curr_state;
      endcase
   end else if (product == P4) begin
      case(curr_state)
         S6: next_state = S8;
         S7: next_state = S9;
         default: next_state = curr_state;
      endcase
   end else begin //case where cost = 0
      next_state = next_state;
   end
   
end

// State memory block
// This computes: 
// Actually updates the state
// Sequential block
always @(posedge clock or posedge reset) begin
   if (reset == 1'b1) begin
      curr_state <= S0;
//      change <= 0;
   end else begin
      curr_state <= next_state;
      
   end
end

// Output state logic block
// This computes:
// Value of the outputs given the current state and the inputs 
always @(curr_state) begin
   case(curr_state)
      S0:begin 
            balance = 0;
            change = 0;
         end
      S1:begin 
            balance = 5;
            change = 0;
         end
      S2:begin 
            balance = 10;
            change = 0;
         end
      S3:begin 
            balance = 15;
            change = 0;
         end
      S4:begin 
            balance = 20;
            change = 0;
         end
      S5:begin 
            balance = 25;
            change = 0;
         end
      S6:begin 
            balance = 30;
            change = 0;
         end
      S7:begin 
            balance = 35;
            change = 0;
         end
      S8:begin 
            balance = 0;
            change = 1;
         end
      S9:begin 
            balance = 5;
            change = 1;
         end
      S10:begin 
            balance = 10;
            change = 1;
         end
      S11:begin 
            balance = 15;
            change = 1;
         end
      S12:begin 
            balance = 20;
            change = 1;
         end
      default: begin 
            balance = 0;
            change = 0;
         end
   endcase
   end
   
always @(change) begin
    if (change == 1) begin
        #5;
        balance = 0;
        change = 0;
        next_state = S0;
        end

end

endmodule