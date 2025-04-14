`timescale 1ns / 1ps

module booth (
   input [3:0] a,
   input [3:0] b,
   output reg [9:0] p
);

reg [9:0] P;
reg [4:0] A;
reg [5:0] B;
reg [2:0] enc;
reg [5:0] add;

always @(a, b) begin
    A = {1'b0, a[3], a[2], a[1], a[0]};
    B = {1'b0, b[3], b[2], b[1], b[0], 1'b0};
end

always @(A, B) begin
   P = 10'b0000000000;
   enc = B[2:0];
   case (enc)
        3'b000: add = 6'b000000;
        3'b001: add = {1'b0, A};
        3'b010: add = A;
        3'b011: add = A <<< 1;
        3'b100: add = ~(A <<< 1) + 1;
        3'b101: add = ~A + 1;
        3'b110: add = ~A + 1;
        3'b111: add = 6'b000000;
        default: add = 6'b000000; // Optional default case
    endcase
   P = P + {add[5], add[4], add[3], add[2], add[1], add[0], 4'b0000};
   B = B >> 2;

   P = P >>> 2;
   enc = B[2:0];
   case (enc)
        3'b000: add = 6'b000000;
        3'b001: add = {1'b0, A};
        3'b010: add = A;
        3'b011: add = A <<< 1;
        3'b100: add = ~(A <<< 1) + 1;
        3'b101: add = ~A + 1;
        3'b110: add = ~A + 1;
        3'b111: add = 6'b000000;
        default: add = 6'b000000; // Optional default case
    endcase

   P = P + {add[5], add[4], add[3], add[2], add[1], add[0], 4'b0000};
   B = B >> 2;

   P = P >>> 2;
   enc = B[2:0];
   case (enc)
        3'b000: add = 6'b000000;
        3'b001: add = {1'b0, A};
        3'b010: add = {1'b0, A};
        3'b011: add = A << 1;
        3'b100: begin
                 add = (~(A << 1)) + 1;
                 add = {1'b0, add[4:0]};
                end
        3'b101: add = (~A) + 1;
        3'b110: add = (~A) + 1;
        3'b111: add = 6'b000000;
        default: add = 6'b000000; // Optional default case
    endcase
   
   P = P + {add[5], add[4], add[3], add[2], add[1], add[0], 4'b0000};
   B = B >> 2;
   
   p[3:0] = P[3:0];
   if (b[1])
      p[7:4] = (P[7:4] - 4);
   else
      p[7:4] = P[7:4];
    
end

endmodule