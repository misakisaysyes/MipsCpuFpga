`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:04:48
// Design Name: 
// Module Name: EXT_CUT
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


module EXT_CUT(
input [31:0]data_in,
input [2:0]E_C,
input SIGN_E,
output [31:0]data_out
    );
    
   assign data_out=(E_C==3'b010)?{((SIGN_E&&data_in[7])?24'b111111111111111111111111:24'b000000000000000000000000),data_in[7:0]}:((E_C==3'b001)?{((SIGN_E&&data_in[15])?16'b1111111111111111:16'b0000000000000000),data_in[15:0]}:((E_C==3'b011)?{((SIGN_E&&data_in[7])?24'b111111111111111111111111:24'b000000000000000000000000),data_in[7:0]}:((E_C==3'b100)?{((SIGN_E&&data_in[15])?16'b1111111111111111:16'b0000000000000000),data_in[15:0]}:data_in)));
  
    /*always@(*)
    begin
        case(E_C)
        3'b010:data_out<={(SIGN_E&&data_in[7])?24'b111111111111111111111111:24'b000000000000000000000000,data_in[7:0]};
        3'b001:data_out[31:4]<={(SIGN_E&&data_in[3])?28'b1111111111111111111111111111:28'b0000000000000000000000000000,data_in[3:0]};
        3'b011:data_out<={24'b000000000000000000000000,data_in[7:0]};
        3'b100:data_out<={28'b0000000000000000000000000000,data_in[4:0]};
        default:data_out<=data_in;
        endcase
    end*/
    
endmodule

