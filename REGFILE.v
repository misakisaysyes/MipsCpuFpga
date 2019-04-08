`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:20:48
// Design Name: 
// Module Name: REGFILE
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


module RegFile(
input clk,
input rst,
input we,
input [4:0] raddr1,
input [4:0] raddr2,
input [4:0] waddr,
input [31:0] wdata,
output [31:0] rdata1,
output [31 :0] rdata2
    );
    
   reg [31:0] mem[31:0];
   integer i;
  
   always @(negedge clk,posedge rst)
   begin
        if(rst)
             for(i=0;i<32;i=i+1)
                  mem[i]<=32'b00000000000000000000000000000000; 
       else
            if(we&&waddr)
                 mem[waddr]<=wdata;
   end
    
   assign  rdata1=mem[raddr1];
   assign  rdata2=mem[raddr2];
  // assign  r28=mem[28][15:0];   

endmodule

