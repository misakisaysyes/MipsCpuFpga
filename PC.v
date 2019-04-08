`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:18:48
// Design Name: 
// Module Name: PC
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


module PC(
input clk,
input reset,
input [31:0]addr_in,
output reg [31:0] addr_out
    );
    
  always@(posedge clk)
    begin
    if(reset)
        addr_out<=0;
    else
        addr_out<=addr_in;
    end
   
endmodule
