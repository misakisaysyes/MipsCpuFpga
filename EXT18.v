`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:07:53
// Design Name: 
// Module Name: EXT18
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


module EXT18(
input sign,
input [15:0] data_in,
output [31:0] data_out
    );
    
    wire [17:0] exg;
    assign exg[17:2]=data_in;
    assign exg[1]=0;
    assign exg[0]=0;
    
    wire [13:0] high0=14'b00000000000000;
    wire [13:0] high1=14'b11111111111111;
       
    assign data_out[31:18]=sign?(exg[17]?high1:high0):high0;
    assign data_out[17:0]=exg;

endmodule
