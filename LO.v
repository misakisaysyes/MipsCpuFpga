`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:09:55
// Design Name: 
// Module Name: LO
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


module LO(
input lo_w,
input clk,
input [31:0]lo_in,
output [31:0]lo_out
    );
    
    reg [31:0]lo;
    always@(negedge clk)
    begin
        if(lo_w)
            lo<=lo_in;      
    end
    assign lo_out=lo;
    
endmodule

