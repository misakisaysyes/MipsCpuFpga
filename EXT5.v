`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:05:52
// Design Name: 
// Module Name: EXT5
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


module EXT5(
input sign,
input [4:0] data_in,
output [31:0] data_out
    );
    
    wire [17:0] high0=18'b000000000000000000;
    wire [17:0] high1=18'b111111111111111111;
       
    assign data_out[31:5]=sign?(data_in[4]?high1:high0):high0;
    assign data_out[4:0]=data_in;

endmodule

