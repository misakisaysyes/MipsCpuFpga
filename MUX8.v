`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:17:49
// Design Name: 
// Module Name: MUX8
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


module MUX8(
input [31:0] data_in1,
input [31:0] data_in2,
input [31:0] data_in3,
input [31:0] data_in4,
input [31:0] data_in5,
input [31:0] data_in6,
input [31:0] data_in7,
input [31:0] data_in8,
input c1,
input c2,
input c3,
output [31:0] data_out
    );
    
   assign data_out=c1?(c2?(c3?data_in7:data_in8):(c3?data_in5:data_in6)):(c2?(c3?data_in3:data_in4):(c3?data_in1:data_in2));
    
endmodule

