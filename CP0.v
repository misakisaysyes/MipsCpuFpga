`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 09:57:39
// Design Name: 
// Module Name: CP0
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


module CP0(
input clk,
input mfc0,
input mtc0,
input [31:0]pc,
input [4:0]addr,
input [31:0]data,
input exception,
input eret,
input [4:0]ex_type,
output [31:0]cp0_o
    );
    
    reg [31:0]mem[31:0];
   // wire [31:0]sta_left;
    //wire [31:0]sta_right;
    wire wcau;
    wire wsta;
    wire wepc;
    
    wire [31:0]mux_staclr_o;
    wire [31:0]mux_sta_o;
    wire [31:0]mux_cau_o;
    wire [31:0]mux_epc_o;
   
   
   
    MUX2 mux_staclr(.data_in1({mem[12][26:0],5'b00000}),.data_in2(mem[12]),.c1(exception&&!eret),.data_out(mux_staclr_o));
    MUX2 mux_sta(.data_in2(mux_staclr_o),.data_in1(data),.c1(mtc0),.data_out(mux_sta_o));
    MUX2 mux_cau(.data_in2({25'b0000000000000000000000000,ex_type,2'b00}),.data_in1(data),.c1(mtc0),.data_out(mux_cau_o));
    MUX2 mux_epc(.data_in2(pc+32'h00400000),.data_in1(data),.c1(mtc0),.data_out(mux_epc_o));
    
    assign wsta=(exception);
    assign wcau=(exception&&!eret);
    assign wepc=(exception&&!eret);  
     
    always@(negedge clk)
    begin
    if(mtc0)
    begin
        mem[addr]<=data;
    end
    else
    begin
    if(wsta)
        mem[12]<=mux_sta_o;
    if(wcau)
        mem[13]<=mux_cau_o;
    if(wepc)
        mem[14]<=mux_epc_o;
    end
    end
       
    assign cp0_o=mfc0?mem[addr]:(exception?(eret?{12'h000,mem[14][19:0]}:4):32'h00000000); 
    
endmodule
