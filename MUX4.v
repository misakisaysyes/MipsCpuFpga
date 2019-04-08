`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:17:02
// Design Name: 
// Module Name: MUX4
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


module MUX4(
input [31:0] data_in1,
input [31:0] data_in2,
input [31:0] data_in3,
input [31:0] data_in4,
input c1,
input c2,
output [31:0] data_out
    );
    
    assign data_out=c1?(c2?data_in4:data_in3):(c2?data_in2:data_in1);

endmodule

