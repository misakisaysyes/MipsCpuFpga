`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 09:48:33
// Design Name: 
// Module Name: COUNT
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


module COUNT(
input [31:0]data_in,
output reg [31:0]data_out=0
    );
    
    integer i;
   
    always @(*)
    begin
        if(data_in[31]==1)
            data_out<=0;
        else if(data_in[31:30]==1)     
            data_out<=1;
        else if(data_in[31:29]==1)
            data_out<=2;
        else if(data_in[31:28]==1)
            data_out<=3;
        else if(data_in[31:27]==1)
            data_out<=4;
        else if(data_in[31:26]==1)
            data_out<=5;
        else if(data_in[31:25]==1)
            data_out<=6;
        else if(data_in[31:24]==1)
            data_out<=7;
        else if(data_in[31:23]==1)
            data_out<=8;
        else if(data_in[31:22]==1)
            data_out<=9;
        else if(data_in[31:21]==1)
            data_out<=10;
        else if(data_in[31:20]==1)
            data_out<=11;
        else if(data_in[31:19]==1)
            data_out<=12;
        else if(data_in[31:18]==1)
            data_out<=13;
        else if(data_in[31:17]==1)
            data_out<=14;
        else if(data_in[31:16]==1)
            data_out<=15;
        else if(data_in[31:15]==1)
            data_out<=16;
        else if(data_in[31:14]==1)
            data_out<=17;
        else if(data_in[31:13]==1)
            data_out<=18;
        else if(data_in[31:12]==1)
            data_out<=19;
        else if(data_in[31:11]==1)
            data_out<=20;
        else if(data_in[31:10]==1)
            data_out<=21;
        else if(data_in[31:9]==1)
            data_out<=22;
        else if(data_in[31:8]==1)
            data_out<=23;
        else if(data_in[31:7]==1)
            data_out<=24;
        else if(data_in[31:6]==1)
            data_out<=25;
        else if(data_in[31:5]==1)
            data_out<=26;
        else if(data_in[31:4]==1)
            data_out<=27;
        else if(data_in[31:3]==1)
            data_out<=28;
        else if(data_in[31:2]==1)
            data_out<=29;
        else if(data_in[31:1]==1)
            data_out<=30;
        else if(data_in[31:0]==1)
            data_out<=31;
        else
            data_out<=32;
    end 

endmodule

