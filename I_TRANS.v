`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:11:05
// Design Name: 
// Module Name: I_TRANS
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


module I_TRANS(
input z,//alu零标志位
input n,//alu负数标志位
input [31:0]data_in,//指令
input [31:0]Rs_o,
output [2:0]MUX_PC,
output IM_R,
output RF_W,
output [3:0]ALUC,
output [2:0]MUX_RD,
output SIGN_E,
output DM_W,
output MUX_ALUA,
output [1:0]MUX_ALUB,
output [2:0]E_C, 
output [1:0]MUX_HI,
output [1:0]MUX_LO,
output MUX_EC,
output HI_W,
output LO_W,
output [4:0]EX_TYPE,
output MFC0,
output MTC0,
output ERET,
output EXCEPTION,
output MUL_E,
output DIV_S,
output SIGN_EC,
output [4:0]Rdc,
output [4:0]Rsc,
output [4:0]Rtc,
output [4:0]cp0_addr
);
    
//31条
wire [5:0]op=data_in[31:26];
wire [5:0]func=data_in[5:0];
wire Add=(op==6'b000000&&func==6'b100000);
wire Addu=(op==6'b000000&&func==6'b100001);
wire Sub=(op==6'b000000&&func==6'b100010);
wire Subu=(op==6'b000000&&func==6'b100011);
wire And=(op==6'b000000&&func==6'b100100);
wire Or=(op==6'b000000&&func==6'b100101);
wire Xor=(op==6'b000000&&func==6'b100110);
wire Nor=(op==6'b000000&&func==6'b100111);
wire Slt=(op==6'b000000&&func==6'b101010);
wire Sltu=(op==6'b000000&&func==6'b101011);
wire Sll=(op==6'b000000&&func==6'b000000);
wire Srl=(op==6'b000000&&func==6'b000010);
wire Sra=(op==6'b000000&&func==6'b000011);
wire Sllv=(op==6'b000000&&func==6'b000100);
wire Srlv=(op==6'b000000&&func==6'b000110);
wire Srav=(op==6'b000000&&func==6'b000111);
wire Jr=(op==6'b000000&&func==6'b001000);
wire Addi=(op==6'b001000);
wire Addiu=(op==6'b001001);
wire Andi=(op==6'b001100);
wire Ori=(op==6'b001101);
wire Xori=(op==6'b001110);
wire Lw=(op==6'b100011);
wire Sw=(op==6'b101011);
wire Beq=(op==6'b000100);
wire Bne=(op==6'b000101);
wire Slti=(op==6'b001010);
wire Sltiu=(op==6'b001011);
wire Lui=(op==6'b001111);
wire J=(op==6'b000010);
wire Jal=(op==6'b000011);
        
//+23条
wire Clz=(op==6'b011100&&func==6'b100000);
wire Divu=(op==6'b000000&&func==6'b011011);
wire Eret=(op==6'b010000&&func==6'b011000);
wire Jarl=(op==6'b000000&&func==6'b001001);
wire Lb=(op==6'b100000);
wire Lbu=(op==6'b100100);
wire Lhu=(op==6'b100101);
wire Sb=(op==6'b101000);
wire Sh=(op==6'b101001);
wire Lh=(op==6'b100001);
//assign  MFC0=(data_in[31:21]==11'b01000000000&&data_in[10:3]==8'b00000000);
wire Mfc0=(data_in[31:21]==11'b01000000000&&data_in[10:3]==8'b00000000);
wire Mfhi=(op==6'b000000&&func==6'b010000);
wire Mflo=(op==6'b000000&&func==6'b010010);
//assign MTC0=(data_in[31:21]==11'b01000000100&&data_in[10:3]==8'b00000000);
wire Mtc0=(data_in[31:21]==11'b01000000100&&data_in[10:3]==8'b00000000);
wire Mthi=(op==6'b000000&&func==6'b010001);
wire Mtlo=(op==6'b000000&&func==6'b010011);
wire Mul=(op==6'b011100&&func==6'b000010);
wire Multu=(op==6'b000000&&func==6'b011001);
wire Syscall=(op==6'b000000&&func==6'b001100);
wire Teq=(op==6'b000000&&func==6'b110100);
wire Bgez=(op==6'b000001);
wire Break_=(op==6'b000000&&func==6'b001101);
wire Div=(op==6'b000000&&func==6'b011010);
        
assign MUX_PC[2]=Eret+(Beq&&(z?1:0))+(Bne&&(z?0:1))+(Bgez&&((!n||z)?1:0));
assign MUX_PC[1]=~(J+Jr+Jal+Jarl+MUX_PC[2]);
assign MUX_PC[0]=Eret+Syscall+Teq+Break_+Jr+Jarl;
assign IM_R=1;
assign RF_W=Addu+Add+Subu+Sub+And+Or+Xor+Nor+Slt+Sltu+Sllv+Srlv+Srav+Lui+Sll+Srl+Sra+Slti+Sltiu+Addi+Addiu+Andi+Ori+Xori+Lb+Lbu+Lh+Lhu+Lw+Mfc0+Clz+Jal+Jarl+Mfhi+Mflo+Mul;
assign ALUC[3]=Slt+Sltu+Sllv+Srlv+Srav+Lui+Srl+Sra+Slti+Sltiu+Sll;
assign ALUC[2]=And+Or+Xor+Nor+Sll+Srl+Sra+Sllv+Srlv+Srav+Andi+Ori+Xori;
assign ALUC[1]=Add+Sub+Xor+Nor+Slt+Sltu+Sll+Sllv+Addi+Xori+Beq+Bne+Slti+Sltiu+Bgez;
assign ALUC[0]=Subu+Sub+Or+Nor+Slt+Sllv+Srlv+Sll+Srl+Slti+Ori+Beq+Bne+Bgez;
assign MUX_RD[2]=~(Beq+Bne+Bgez+Div+Divu+Sb+Multu+Sh+Sw+J+Jr+Jal+Jarl+Mfc0+Mtc0+Mflo+Mthi+Mtlo+Clz+Eret+Syscall+Teq+Break_);
assign MUX_RD[1]=Mul+Mfc0+Mtc0+Clz+Mfhi;
assign MUX_RD[0]=~(Beq+Bne+Bgez+Div+Divu+Multu+Lb+Lbu+Lh+Lhu+Lw+Sb+Sh+Sw+J+Mtc0+Mfhi+Mflo+Mthi+Mtlo+Clz+Eret+Syscall+Teq+Break_);
assign SIGN_E=Slti+Sltiu+Beq+Bne+Bgez+Div+Mul+Lb+Lbu+Lh+Lhu+Lw+Sb+Sh+Sw+Addi+Addiu;
assign DM_W=Sb+Sh+Sw;
assign MUX_ALUA=~(Sll+Srl+Sra+Div+Divu+Mul+Multu+J+Jr+Jal+Jarl+Mfc0+Mtc0+Mfhi+Mflo+Mthi+Mtlo+Clz+Eret+Syscall+Teq+Break_);
assign MUX_ALUB[1]=Bgez;
assign MUX_ALUB[0]=Slti+Sltiu+Addi+Addiu+Andi+Ori+Xori+Lb+Lbu+Lh+Lhu+Lw+Sb+Sh+Sw+Lui;
assign E_C[2]=Sh;
assign E_C[1]=Lb+Lbu+Sb;
assign E_C[0]=Lh+Lhu+Sb;
assign MUX_HI[1]=Mthi;
assign MUX_HI[0]=Multu;
assign MUX_LO[1]=Mtlo;
assign MUX_LO[0]=Multu;
assign MUX_EC=Sb+Sh+Sw;
assign HI_W=Div+Divu+Multu+Mthi;
assign LO_W=Div+Divu+Multu+Mtlo;
//assign EX_TYPE=Syscall?5'b01000:(Break_?5'b01001:(Teq?5'b01101:5'b00000));
assign EXCEPTION=Syscall+Break_+Teq+Eret;
assign ERET=Eret;
assign MUL_E=Mul+Multu;
//assign DIV_S=Div+Divu;
assign DIV_S=Div;
assign SIGN_EC=Lb+Lh;
assign Rdc=(Add+Addu+Sub+Subu+And+Or+Xor+Nor+Slt+Sltu+Sll+Srl+Sra+Sllv+Srlv+Srav+Clz+Jarl+Mfhi+Mflo+Mul)?data_in[15:11]:(( Addi+Addiu+Andi+Ori+Xori+Lb+Lbu+Lh+Lhu+Lw+Sb+Sh+Sw+Slti+Sltiu+Lui+Mfc0)?data_in[20:16]:(Jal?5'd31:5'b0));
assign Rsc=data_in[25:21];
assign Rtc=data_in[20:16];
assign MFC0=Mfc0;
assign MTC0=Mtc0;
assign cp0_addr=data_in[15:11];
assign EX_TYPE=Break_?5'b01001:(Syscall?5'b01000:(Teq?5'b01101:5'b00000));
         
endmodule
