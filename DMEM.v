`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:02:52
// Design Name: 
// Module Name: DMEM
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


module DMEM(
input clk,
input wena,
input [31:0] addr,
input [31:0] data_in,
output  [31:0] data_out
    );
    reg [31:0] mem [1023:0];
    
    always@ (posedge clk)
    if(wena)
        mem[addr-32'h10010000]<=data_in;
    
    assign data_out=mem[addr-32'h10010000];

endmodule
