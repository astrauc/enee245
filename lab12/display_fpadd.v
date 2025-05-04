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
    wire [15:0] display; //number to display
    
    floatingPointAdder fp(/*inputs and outputs*/);
    
    fourDigitDisplay disp(
        .clk(clk),
        .reset(clr),
        .dig0(display[15:12]),
        .dig1(display[11:8]),
        .dig2(display[7:4]),
        .dig3(display[3:0]),
        .AN(AN),
        .CA(CA)
    );

    assign display = (show_sum) ? {8’b0,sum} : {A,B}; 

    
endmodule