`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:12:50
// Design Name: 
// Module Name: IMEM
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


module IMEM(
input reset,
input [31:0] addr,
output [31:0] data_out
    );
    
    wire [31:0] mem [1023:0];
   
    assign data_out=reset?mem[0]:mem[addr];
    
    initial 
    begin
        $readmemh("54/44.47_mflo.mtlo.hex.txt",imem.mem);
    end 

endmodule

