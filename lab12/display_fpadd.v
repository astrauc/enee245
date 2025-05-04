module display_fpadd (
    input clk, 
    input clr,
    input start, //button to start
    input show_sum, //button to show sum
    input [15:0] sw, //input values
    output [3:0] AN,
    output [6:0] CA
);

    wire [7:0] A = sw[15:8];
    wire [7:0] B = sw[7:0];
    wire [7:0] sum;
    wire [15:0] disp; //number to display
    
    floatingPointAdder fpadd(
        .a(A),
        .b(B),
        .clk(clk),
        .clr(clr),
        .start(start),
        .s(sum)
    );
    
    fourDigitDisplay display(
        .clk(clk),
        .reset(clr),
        .dig0(disp[15:12]),
        .dig1(disp[11:8]),
        .dig2(disp[7:4]),
        .dig3(disp[3:0]),
        .AN(AN),
        .CA(CA)
    );

    assign disp = (show_sum) ? {8’b0,sum} : {A,B}; 

    
endmodule