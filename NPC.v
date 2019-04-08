`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:19:49
// Design Name: 
// Module Name: NPC
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


module NPC(
input [31:0] addr_in,
input clk,
input reset,
output reg [31:0] addr_out
);
  
    always@(*)
    begin
    if(reset)
        addr_out<=0;
    else
        addr_out<=(addr_in==1023)?0:addr_in+4;
    end
  
endmodule

