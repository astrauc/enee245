
module datapath(
   input clk,
   input clr,
   input en_a,
   input en_b,
   input en_p,
   input ld_shift_a,
   input ld_shift_b,
   input ld_add_p,
   input [3:0] a,
   input [3:0] b,
   output [7:0] p,
   output reg zero,
   output reg lsb_b
);
   
   reg [7:0] A = 0;
   reg [7:0] P = 0;
   reg [7:0] buffer = 0;
   reg [3:0] B = 0;

   always @(posedge clk or posedge clr) begin
   if (clr) begin
         P = 0;
      end else if (en_p) begin
        
         if (ld_add_p) begin
            buffer = A;
         end else begin
            buffer = 0;
         end
         
         P = P + buffer;
        
      end else begin 
        buffer = 0;
      end
      
      if (clr) begin
         A = 0;
      end else if (en_a) begin 
         if (ld_shift_a) begin
            A = A << 1;
         end else begin
            A = {4'b0000, a};
         end
      end else begin 
        A = {4'b0000, a};
      end

      
      
   end

   always @(posedge clk or posedge clr) begin 
      if (clr) begin
         B = 0;
      end else if (en_b) begin 
         if (ld_shift_b) begin 
            B = B >> 1;
         end else begin 
            B = b;
         end
      end else begin
        B = b;
      end

      if (B == 0) begin
         zero = 1;
      end else begin 
         zero = 0;
      end

      lsb_b = B[0];
        
   end

assign p = P;

endmodule