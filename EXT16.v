`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:07:02
// Design Name: 
// Module Name: EXT16
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


module EXT16(
input sign,
input [15:0] data_in,
output [31:0] data_out
    );
    
    wire [15:0] high0=16'b0000000000000000;
    wire [15:0] high1=16'b1111111111111111;
    
    assign data_out[31:16]=sign?(data_in[15]?high1:high0):high0;
    assign data_out[15:0]=data_in;

endmodule
