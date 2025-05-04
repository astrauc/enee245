`timescale 1ns / 1ps

module fpadd_tb(

    );
    
    reg clk = 0, clr = 0, start = 0;
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    fpadd uut (
        .clk(clk),
        .clr(clr),
        .start(start),
        .a(a),
        .b(b),
        .s(s)
    );
    
    always #1 clk = ~clk;
    
    initial begin 
    a = 8'b00111101;
    b = 8'b00110100;
    #5;
    start = 1;
    #20;
    start = 0;
    $display("a+b = %b%b%b%b%b%b%b%b",s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]);
    #50;
    clr = 1;
    #10;
    clr = 0;
    
    #20;
    a = 8'b00111101;
    b = 8'b00110100;
    #5;
    start = 1;
    #20;
    start = 0;
    $display("a+b = %b%b%b%b%b%b%b%b",s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]);
    #50;
    clr = 1;
    #10;
    clr = 0;
    #20;
    
    a = 8'b10011000;
    b = 8'b00010011;
    #5;
    start = 1;
    #20;
    start = 0;
    $display("a+b = %b%b%b%b%b%b%b%b",s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]);
    #50;
    clr = 1;
    #10;
    clr = 0;
    #10;
    
    a = 8'b00011010;
    b = 8'b00010011;
    #5;
    start = 1;
    #20;
    start = 0;
    $display("a+b = %b%b%b%b%b%b%b%b",s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]);
    #50;
    clr = 1;
    #10;
    clr = 0;
    #5;   
    
    a = 8'b10011000;
    b = 8'b00011011;
    #5;
    start = 1;
    #20;
    start = 0;
    $display("a+b = %b%b%b%b%b%b%b%b",s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]);
    #50;
    clr = 1;
    #10;
    clr = 0;
    #5; 
    end
    
    
endmodule
