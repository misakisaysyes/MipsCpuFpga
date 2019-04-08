`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:08:56
// Design Name: 
// Module Name: HI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HI(
input hi_w,
input clk,
input [31:0]hi_in,
output [31:0]hi_out
    );
    
    reg [31:0]hi;
    always@(negedge clk)
    begin
        if(hi_w)
            hi<=hi_in;      
    end
    assign hi_out=hi;
   
endmodule
