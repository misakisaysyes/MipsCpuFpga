`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 08:53:04
// Design Name: 
// Module Name: ALU
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

module ALU(
input  [31:0] a,
input  [31:0] b,
input  [3:0] aluc,
output reg [31:0] r,
output reg zero,
output reg carry,
output reg negative,
output reg overflow
    );
    
    wire signed [31:0]aa;
    wire signed [31:0]bb;
    wire [31:0]memu[9:0];
    wire [3:0]zcnou[9:0];
    wire signed [31:0]mem[3:0];
    wire [3:0]zcno[3:0]; 
    reg [3:0]choose;
    
    //0无符号加法//
    assign memu[0]=a+b;
    assign zcnou[0][3]=(!memu[0]);
    assign zcnou[0][2]=(memu[0]<a&&memu[0]<b);
    assign zcnou[0][1]=memu[0][31];
    assign zcnou[0][0]=0;
    
    //0有符号加法//
   assign aa=a;
   assign bb=b; 
   assign mem[0]=aa+bb;
   assign zcno[0][3]=(!mem[0]);
   assign zcno[0][2]=0;
   assign zcno[0][1]=mem[0][31];
   assign zcno[0][0]=((aa>0&&bb>0&&mem[0]<0)||(aa<0&&bb<0&&mem[0]>0));
    
    //1无符号减法//
    assign memu[1]=a-b;
    assign zcnou[1][3]=(!memu[1]);
    assign zcnou[1][2]=(a<b);
    assign zcnou[1][1]=0;
    assign zcnou[1][0]=0;
    
    //1有符号减法//
    assign aa=a;
    assign bb=b; 
    assign mem[1]=aa-bb;
    assign zcno[1][3]=(!mem[1]);
    assign zcno[1][2]=0;
    assign zcno[1][1]=mem[1][31];
    assign zcno[1][0]=((aa>0&&bb<0&&mem[1]<0)||(aa<0&&bb>0&&mem[1]>0));   
    
    //2与//
    assign memu[2]=a&b;
    assign zcnou[2][3]=(!memu[2]);
    assign zcnou[2][2]=0;
    assign zcnou[2][1]=memu[2][31];
    assign zcnou[2][0]=0;
    
    //3或//
    assign memu[3]=a|b;
    assign zcnou[3][3]=(!memu[3]);
    assign zcnou[3][2]=0;
    assign zcnou[3][1]=memu[3][31];
    assign zcnou[3][0]=0;
    
    //4异或//
    assign memu[4]=a^b;
    assign zcnou[4][3]=(!memu[4]);
    assign zcnou[4][2]=0;
    assign zcnou[4][1]=memu[4][31];
    assign zcnou[4][0]=0;
    
    //5同或//
    assign memu[5]=~(a|b);
    assign zcnou[5][3]=(!memu[5]);
    assign zcnou[5][2]=0;
    assign zcnou[5][1]=memu[5][31];
    assign zcnou[5][0]=0;
    
    //6lui//
    assign memu[6]={b[15:0],16'b0};
    assign zcnou[6][3]=(!memu[6]);
    assign zcnou[6][2]=0;
    assign zcnou[6][1]=memu[6][31];
    assign zcnou[6][0]=0;
   
    //7sltu//
    assign memu[7]=(a<b)?1:0;
    assign zcnou[7][3]=(!(a-b));
    assign zcnou[7][2]=(a<b);
    assign zcnou[7][1]=0;
    assign zcnou[7][0]=0;
    
    //2slt//
    assign bb=b;
    assign aa=a;
    assign mem[2]=(aa<bb)?1:0;
    assign zcno[2][3]=(!(aa-bb));
    assign zcno[2][2]=0;
    assign zcno[2][1]=(aa<bb);
    assign zcno[2][0]=0;
    
    //3算术右移//
        assign bb=b;
        assign aa=a;
        assign zcno[3][2]=bb[aa-1];
        assign mem[3]=bb>>>aa;
        assign zcno[3][3]=(!mem[3]);
        assign zcno[3][1]=mem[3][31];
        assign zcno[3][0]=0;    
    
    //8逻辑左移//
        assign zcnou[8][2]=b[31-a+1];
        assign memu[8]=b<<a;
        assign zcnou[8][3]=(!memu[8]);
        assign zcnou[8][1]=memu[8][31];
        assign zcnou[8][0]=0;    
    
    //9逻辑右移//
           assign zcnou[9][2]=b[a-1];
           assign memu[9]=b>>a;
           assign zcnou[9][3]=(!memu[9]);
           assign zcnou[9][1]=memu[9][31];
           assign zcnou[9][0]=0;    
           
       always@(*)
       begin
            case(aluc)
            //无符号加//
            4'b0000:choose=0;
               
               //有符号加//
             4'b0010:choose=0;
               
               
               //无符号减//
              4'b0001:choose=1;
               
               //有符号减//
              4'b0011:choose=1;
               
               //与//
              4'b0100:choose=2;
               
               //或//
              4'b0101:choose=3;
               
               //异或//
              4'b0110:choose=4; 
               
               //同或//
              4'b0111:choose=5;
               
                
               //拼接//
               4'b1001:choose=6;
               4'b1000:choose=6;
                 
                
               //有符号比较//
               4'b1011:choose=2;
               
               //无符号比较//
               4'b1010:choose=7;
               
               //算术右移//
               4'b1100:choose=3;
               
               //左移//
               4'b1111:choose=8;
               4'b1110:choose=8;
               
               //逻辑右移//
               4'b1101:choose=9; 
            endcase
            
            if(aluc==2||aluc==3||aluc==11||aluc==12)
            begin
                r=mem[choose];
                zero=zcno[choose][3];
                carry=zcno[choose][2];
                negative=zcno[choose][1];
                overflow=zcno[choose][0];
            end
            else
            begin
                 r=memu[choose];
                 zero=zcnou[choose][3];
                 carry=zcnou[choose][2];
                 negative=zcnou[choose][1];
                 overflow=zcnou[choose][0];
            end
            
            if((aluc==4'b1100||aluc==4'b1111||aluc==4'b1110||aluc==4'b1101)&&!a)
                carry=0;
 
       end    

endmodule

