module lookAhead (
   input [3:0] a,
   input [3:0] b,
   output [3:0] s
);

wire [3:0] c_in;
wire [3:0] G;
wire [3:0] P;
halfAdder HA1 (.a(a[0]), .b(b[0]), .c_out(P[0]), .s(G[0]));
halfAdder HA2 (.a(a[1]), .b(b[1]), .c_out(P[1]), .s(G[1]));
halfAdder HA3 (.a(a[2]), .b(b[2]), .c_out(P[2]), .s(G[2]));
halfAdder HA4 (.a(a[3]), .b(b[3]), .c_out(P[3]), .s(G[3]));

assign c_in[1] = G[0] | ( c_in[0] & P[0] ); 
assign c_in[2] = G[1] | ( c_in[0] & P[0] & P[1]) | (G[0] & P[1]); 
assign c_in[3] = G[2] | ( c_in[0] & P[0] & P[1] & P[2] ) | (G[0] & P[1] & P[2]) | (G[1] & P[2]); 

assign s[3:0] = c_in[3:0] ^ P[3:0];
   
endmodule 

//module lookAhead_tb();
//   reg [3:0] a;
//   reg [3:0] b;
//   wire [3:0] s;

//   lookahead uut(
//      .a(a),
//      .b(a),
//      .s(s)
//   );

//   initial begin
//      a = 4'b0101; b = 4'b1010;
//      #10; 
////      $display("A = %b%b%b%b, B = %b%b%b%b, Sum = %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], s[3], s[2] s[1], s[0]);
//      a = 4'b1101; b = 4'b1010;
//      #10; 
////      $display("A = %b%b%b%b, B = %b%b%b%b, Sum = %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], s[3], s[2] s[1], s[0]);
//      a = 4'b0001; b = 4'b1011;
//      #10;
////       $display("A = %b%b%b%b, B = %b%b%b%b, Sum = %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], s[3], s[2] s[1], s[0]);
//      a = 4'b0110; b = 4'b1111;
//      #10; 
////      $display("A = %b%b%b%b, B = %b%b%b%b, Sum = %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], s[3], s[2] s[1], s[0]);

//   end
//endmodule