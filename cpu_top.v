`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 10:01:02
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
       
         input o_clk,
         input reset,
         output [7:0] o_seg,
         output [7:0] o_sel

         
         //线
         /*output z,
         output c,
         output n,
         output o,
         output [31:0]npc_o,
         output [31:0]muxpc_o,
         output [31:0]pc_o,
         output [31:0]count_o,
         output [31:0]imem_o,
         output [31:0]Rd,
         output [31:0]Rs_o,
         output [31:0]Rt_o,
         output [31:0]ext5_o,
         output [31:0]ext16_o,
         output [31:0]mux_alua_o,
         output [31:0]mux_alub_o,
         output [31:0]alu_o,
         output [31:0]dm_o,
         output [31:0]muxec_o,
         output [31:0]ec_o,
         output [31:0]hi_o,
         output [31:0]lo_o,
         output [31:0]muxhi_o,
         output [31:0]muxlo_o,
         output [31:0]div_oh,
         output [31:0]div_ol,
         output [31:0]mulu_oh,
         output [31:0]mulu_ol,
         output div_busy,
         output [31:0]cp0_o,
         output [31:0]muxcp0_o,
         output [31:0]ext18_o,
         output [31:0]add_o,
         //控制指令
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
         output [4:0]cp0_addr,
         output [63:0]mulu_out,
         output [31:0]mul_o*/
    );
         //线
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire z;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire c;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire n;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]npc_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]muxpc_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]pc_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]count_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]imem_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]Rd;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]Rs_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]Rt_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]ext5_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]ext16_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]mux_alua_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]mux_alub_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]alu_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]dm_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]muxec_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]ec_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]hi_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]lo_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]muxhi_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]muxlo_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]div_oh;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]div_ol;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]mulu_oh;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]mulu_ol;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire div_busy;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]cp0_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]muxcp0_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]ext18_o;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]add_o;
             //控制指令
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [2:0]MUX_PC;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire IM_R;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire RF_W;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [3:0]ALUC;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [2:0]MUX_RD;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire SIGN_E;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire DM_W;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire MUX_ALUA;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [1:0]MUX_ALUB;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [2:0]E_C; 
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [1:0]MUX_HI;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [1:0]MUX_LO;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire MUX_EC;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire HI_W;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire LO_W;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]EX_TYPE;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire MFC0;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire MTC0;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire ERET;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire EXCEPTION;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire MUL_E;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire DIV_S;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire SIGN_EC;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]Rdc;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]Rsc;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]Rtc;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]cp0_addr;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [63:0]mulu_out;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [31:0]mul_o;
         
         //控制指令
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [4:0]shamt=imem_o[10:6];
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [15:0]imm=imem_o[15:0];
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire clk;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire r=0;
         
         DIVIDER divider(.clk_in1(o_clk),.clk_out1(clk),.reset(r));
        
         I_TRANS i_trans(.z(z),.n(n),.data_in(imem_o),.Rs_o(Rs_o),.MUX_PC(MUX_PC),.IM_R(IM_R),.RF_W(RF_W),.ALUC(ALUC),.MUX_RD(MUX_RD),.SIGN_E(SIGN_E),.DM_W(DM_W),.MUX_ALUA(MUX_ALUA),.MUX_ALUB(MUX_ALUB),.E_C(E_C), .MUX_HI(MUX_HI),.MUX_LO(MUX_LO),.MUX_EC(MUX_EC),.HI_W(HI_W),.LO_W(LO_W),.EX_TYPE(EX_TYPE),.MFC0(MFC0),.MTC0(MTC0),.ERET(ERET),.EXCEPTION(EXCEPTION),.MUL_E(MUL_E),.DIV_S(DIV_S),.SIGN_EC(SIGN_EC),.Rdc(Rdc),.Rsc(Rsc),.Rtc(Rtc),.cp0_addr(cp0_addr));
         NPC npc(.addr_in(pc_o),.clk(clk),.reset(reset),.addr_out(npc_o));
         MUX8  mux_pc(.data_in1(Rs_o-32'h00400000),.data_in2({pc_o[31:28],imem_o[25:0],2'b00}-32'h00400000),.data_in3(4),.data_in4(npc_o),.data_in5(cp0_o),.data_in6(add_o),.c1(MUX_PC[2]),.c2(MUX_PC[1]),.c3(MUX_PC[0]),.data_out(muxpc_o));
         PC pc(.clk(clk),.reset(reset),.addr_in(muxpc_o),.addr_out(pc_o));
        
         //IMEM imem(.reset(reset),.addr(pc_o/4),.data_out(imem_o));
         IMEM_IP imem(.a(pc_o[12:2]),.spo(imem_o));
         
         COUNT count(.data_in(Rs_o),.data_out(count_o));
         
         MUX8 mux_rd(.data_in1(npc_o+32'h00400000),.data_in2(lo_o),.data_in3(cp0_o),.data_in4(count_o),.data_in5(alu_o),.data_in6(ec_o),.data_in7(mul_o),.data_in8(hi_o),.c1(MUX_RD[2]),.c2(MUX_RD[1]),.c3(MUX_RD[0]),.data_out(Rd));
        
                  RegFile regfile(.clk(clk),.rst(reset),.we(RF_W),.raddr1(Rsc),.raddr2(Rtc),.waddr(Rdc),.wdata(Rd),.rdata1(Rs_o),.rdata2(Rt_o));  
  
         EXT18 ext18(.sign(SIGN_E),.data_in(imm),.data_out(ext18_o));
         ADD add(.addr_in1(ext18_o),.addr_in2(npc_o),.addr_out(add_o));
         EXT5 ext5(.sign(SIGN_E),.data_in(shamt),.data_out(ext5_o));
         MUX2 mux_alua(.data_in1(Rs_o),.data_in2(ext5_o),.c1(MUX_ALUA),.data_out(mux_alua_o));
         EXT16 ext16(.sign(SIGN_E),.data_in(imm),.data_out(ext16_o));
         MUX4 mux_alub(.data_in1(Rt_o),.data_in2(ext16_o),.data_in3(0),.data_in4(0),.c1(MUX_ALUB[1]),.c2(MUX_ALUB[0]),.data_out(mux_alub_o));
         ALU alu(.a(mux_alua_o),.b(mux_alub_o),.aluc(ALUC),.r(alu_o),.zero(z),.carry(c),.negative(n),.overflow(o));
         DMEM dmem(.clk(clk),.wena(DM_W),.addr(alu_o),.data_in(ec_o),.data_out(dm_o));
         MUX2 mux_ec(.data_in1(Rt_o),.data_in2(dm_o),.c1(MUX_EC),.data_out(muxec_o));
         EXT_CUT ext_cut(.data_in(muxec_o),.E_C(E_C),.SIGN_E(SIGN_EC),.data_out(ec_o));
         HI hi(.hi_w(HI_W),.clk(clk),.hi_in(muxhi_o),.hi_out(hi_o));
         LO lo(.lo_w(LO_W),.clk(clk),.lo_in(muxlo_o),.lo_out(lo_o));
         MUX4 mux_hi(.data_in1(div_oh),.data_in2(mulu_oh),.data_in3(Rs_o),.c1(MUX_HI[1]),.c2(MUX_HI[0]),.data_out(muxhi_o));
         MUX4 mux_ol(.data_in1(div_ol),.data_in2(mulu_ol),.data_in3(Rs_o),.c1(MUX_LO[1]),.c2(MUX_LO[0]),.data_out(muxlo_o));
        
         //有无符号除法 
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [63:0]div_out;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [63:0]divu_out;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire div_tvalid_out;
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire divu_tvalid_out;
        
         div_signed div(
             .s_axis_divisor_tvalid(DIV_S),
             .s_axis_divisor_tdata(Rt_o),
             .s_axis_dividend_tvalid(DIV_S),
             .s_axis_dividend_tdata(Rs_o),
             .m_axis_dout_tvalid(div_tvalid_out),
             .m_axis_dout_tdata(div_out)
         );
        
         div_usigned divu(
             .s_axis_divisor_tvalid(DIV_S),
             .s_axis_divisor_tdata(Rt_o),
             .s_axis_dividend_tvalid(DIV_S),
             .s_axis_dividend_tdata(Rs_o),
             .m_axis_dout_tvalid(divu_tvalid_out),
             .m_axis_dout_tdata(divu_out)
         );
        
         MUX2 M_h(.data_in1(div_out[31:0]),.data_in2(divu_out[31:0]),.c1(DIV_S),.data_out(div_oh));
         MUX2 M_i(.data_in1(div_out[63:32]),.data_in2(divu_out[63:32]),.c1(DIV_S),.data_out(div_ol));
        
         //mul_signed 
        
         (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire [63:0]mul_out;
         mul_signed mul(.A(Rs_o),.B(Rt_o),.P(mul_out));
         assign mul_o=mul_out[31:0];
        
         mul_usigned mulu(.A(Rs_o),.B(Rt_o),.P(mulu_out));
         assign mulu_oh=mulu_out[63:32];
         assign mulu_ol=mulu_out[31:0]; 
        
         CP0 cp0(.clk(clk),.mfc0(MFC0),.mtc0(MTC0),.pc(pc_o),.addr(cp0_addr),.data(Rt_o),.exception(EXCEPTION),.eret(ERET),.ex_type(EX_TYPE),.cp0_o(cp0_o));  

        (* MARK_DEBUG = "true"*)(*KEEP="true"*)wire seg7_cs;
        io_sel io_mem(.addr(alu_o),.cs(DM_W),.seg7_cs(seg7_cs));
        seg7x16 seg7(.clk(clk),.reset(reset),.cs(seg7_cs),.i_data(Rt_o),.o_seg(o_seg),.o_sel(o_sel));

endmodule