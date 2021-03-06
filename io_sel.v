`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/13 10:22:38
// Design Name: 
// Module Name: io_sel
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


module io_sel(
input [31:0] addr,
	 input cs,
	 output seg7_cs
    );

assign seg7_cs = (addr == 32'h10010000 && cs == 1) ? 1 : 0;

endmodule
