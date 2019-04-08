`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/11 09:59:43
// Design Name: 
// Module Name: cputb
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


module cputb(
 
    );
   
        reg clk; 
        reg reset;
       
               //线
                wire z;
                wire c;
                wire n;
                wire o;
                wire [31:0]npc_o;
                wire [31:0]muxpc_o;
                wire [31:0]pc_o;
                wire [31:0]count_o;
                wire [31:0]imem_o;
                wire [31:0]Rd;
                wire [31:0]Rs_o;
                wire [31:0]Rt_o;
                wire [31:0]ext5_o;
                wire [31:0]ext16_o;
                wire [31:0]mux_alua_o;
                wire [31:0]mux_alub_o;
                wire [31:0]alu_o;
                wire [31:0]dm_o;
                wire [31:0]muxec_o;
                wire [31:0]ec_o;
                wire [31:0]hi_o;
                wire [31:0]lo_o;
                wire [31:0]muxhi_o;
                wire [31:0]muxlo_o;
                wire [31:0]divu_oh;
                wire [31:0]divu_ol;
                wire [31:0]mul_oh;
                wire [31:0]mul_ol;
               
                wire [31:0]cp0_o;
                wire [31:0]muxcp0_o;
                wire [31:0]ext18_o;
                wire [31:0]add_o;
               
               //控制指令
               wire [2:0]MUX_PC;
               wire IM_R;
               wire RF_W;
               wire [3:0]ALUC;
               wire [2:0]MUX_RD;
               wire SIGN_E;
               wire DM_W;
               wire MUX_ALUA;
               wire [1:0]MUX_ALUB;
               wire [2:0]E_C; 
               wire [1:0]MUX_HI;
               wire [1:0]MUX_LO;
               wire MUX_EC;
               wire HI_W;
               wire LO_W;
               wire [4:0]EX_TYPE;
               wire MFC0;
               wire MTC0;
               wire ERET;
               wire EXCEPTION;
               wire MUL_E;
               wire DIV_S;
               wire SIGN_EC;
              
               wire [4:0]Rdc;
               wire [4:0]Rsc;
               wire [4:0]Rtc;
               wire [4:0]cp0_addr;
               wire [63:0]mul_out;
               
       
        integer file_output;
        integer counter=0;
        
        initial
        begin
        file_output=$fopen("result.txt");
        clk=1;
        reset=1;
        #5;
        reset=0;
        end
        always #10  clk=~clk;
       
        always@(posedge clk)
        begin
        if(!reset)
        begin
           counter<=counter+1;
           
           $fdisplay(file_output,"pc: %h",cputb.CPU.pc.addr_out);
           $fdisplay(file_output,"instr: %h",cputb.CPU.imem.data_out);
           $fdisplay(file_output,"regfile0: %h",cputb.CPU.regfile.mem[0]);
           $fdisplay(file_output,"regfile1: %h",cputb.CPU.regfile.mem[1]);
           $fdisplay(file_output,"regfile2: %h",cputb.CPU.regfile.mem[2]);
           $fdisplay(file_output,"regfile3: %h",cputb.CPU.regfile.mem[3]);
           $fdisplay(file_output,"regfile4: %h",cputb.CPU.regfile.mem[4]);
           $fdisplay(file_output,"regfile5: %h",cputb.CPU.regfile.mem[5]);
           $fdisplay(file_output,"regfile6: %h",cputb.CPU.regfile.mem[6]);
           $fdisplay(file_output,"regfile7: %h",cputb.CPU.regfile.mem[7]);
           $fdisplay(file_output,"regfile8: %h",cputb.CPU.regfile.mem[8]);
           $fdisplay(file_output,"regfile9: %h",cputb.CPU.regfile.mem[9]);
           $fdisplay(file_output,"regfile10: %h",cputb.CPU.regfile.mem[10]);
           $fdisplay(file_output,"regfile11: %h",cputb.CPU.regfile.mem[11]);
           $fdisplay(file_output,"regfile12: %h",cputb.CPU.regfile.mem[12]);
           $fdisplay(file_output,"regfile13: %h",cputb.CPU.regfile.mem[13]);
           $fdisplay(file_output,"regfile14: %h",cputb.CPU.regfile.mem[14]);
           $fdisplay(file_output,"regfile15: %h",cputb.CPU.regfile.mem[15]);
           $fdisplay(file_output,"regfile16: %h",cputb.CPU.regfile.mem[16]);
           $fdisplay(file_output,"regfile17: %h",cputb.CPU.regfile.mem[17]);
           $fdisplay(file_output,"regfile18: %h",cputb.CPU.regfile.mem[18]);
           $fdisplay(file_output,"regfile19: %h",cputb.CPU.regfile.mem[19]);
           $fdisplay(file_output,"regfile20: %h",cputb.CPU.regfile.mem[20]);
           $fdisplay(file_output,"regfile21: %h",cputb.CPU.regfile.mem[21]);
           $fdisplay(file_output,"regfile22: %h",cputb.CPU.regfile.mem[22]);
           $fdisplay(file_output,"regfile23: %h",cputb.CPU.regfile.mem[23]);
           $fdisplay(file_output,"regfile24: %h",cputb.CPU.regfile.mem[24]);
           $fdisplay(file_output,"regfile25: %h",cputb.CPU.regfile.mem[25]);
           $fdisplay(file_output,"regfile26: %h",cputb.CPU.regfile.mem[26]);
           $fdisplay(file_output,"regfile27: %h",cputb.CPU.regfile.mem[27]);
           $fdisplay(file_output,"regfile28: %h",cputb.CPU.regfile.mem[28]);
           $fdisplay(file_output,"regfile29: %h",cputb.CPU.regfile.mem[29]);
           $fdisplay(file_output,"regfile30: %h",cputb.CPU.regfile.mem[30]);
           $fdisplay(file_output,"regfile31: %h",cputb.CPU.regfile.mem[31]);


          /* $fdisplay(file_output,"dmem0: %h",cputb.CPU.dmem.mem[0]);
           $fdisplay(file_output,"dmem1: %h",cputb.CPU.dmem.mem[1]);
           $fdisplay(file_output,"dmem2: %h",cputb.CPU.dmem.mem[2]);
           $fdisplay(file_output,"dmem3: %h",cputb.CPU.dmem.mem[3]);
           $fdisplay(file_output,"dmem4: %h",cputb.CPU.dmem.mem[4]);
           $fdisplay(file_output,"dmem5: %h",cputb.CPU.dmem.mem[5]);
           $fdisplay(file_output,"dmem6: %h",cputb.CPU.dmem.mem[6]);
           $fdisplay(file_output,"dmem7: %h",cputb.CPU.dmem.mem[7]);
           $fdisplay(file_output,"dmem8: %h",cputb.CPU.dmem.mem[8]);
           $fdisplay(file_output,"dmem9: %h",cputb.CPU.dmem.mem[9]);
           $fdisplay(file_output,"dmem10: %h",cputb.CPU.dmem.mem[10]);
           $fdisplay(file_output,"dmem11: %h",cputb.CPU.dmem.mem[11]);
           $fdisplay(file_output,"dmem12: %h",cputb.CPU.dmem.mem[12]);
           $fdisplay(file_output,"dmem13: %h",cputb.CPU.dmem.mem[13]);
           $fdisplay(file_output,"dmem14: %h",cputb.CPU.dmem.mem[14]);
           $fdisplay(file_output,"dmem15: %h",cputb.CPU.dmem.mem[15]);
           $fdisplay(file_output,"dmem16: %h",cputb.CPU.dmem.mem[16]);
           $fdisplay(file_output,"dmem17: %h",cputb.CPU.dmem.mem[17]);
           $fdisplay(file_output,"dmem18: %h",cputb.CPU.dmem.mem[18]);
           $fdisplay(file_output,"dmem19: %h",cputb.CPU.dmem.mem[19]);
           $fdisplay(file_output,"dmem20: %h",cputb.CPU.dmem.mem[20]);
           $fdisplay(file_output,"dmem21: %h",cputb.CPU.dmem.mem[21]);
           $fdisplay(file_output,"dmem22: %h",cputb.CPU.dmem.mem[22]);
           $fdisplay(file_output,"dmem23: %h",cputb.CPU.dmem.mem[23]);
           $fdisplay(file_output,"dmem24: %h",cputb.CPU.dmem.mem[24]);
           $fdisplay(file_output,"dmem25: %h",cputb.CPU.dmem.mem[25]);
           $fdisplay(file_output,"dmem26: %h",cputb.CPU.dmem.mem[26]);
           $fdisplay(file_output,"dmem27: %h",cputb.CPU.dmem.mem[27]);
           $fdisplay(file_output,"dmem28: %h",cputb.CPU.dmem.mem[28]);
           $fdisplay(file_output,"dmem29: %h",cputb.CPU.dmem.mem[29]);
           $fdisplay(file_output,"dmem30: %h",cputb.CPU.dmem.mem[30]);
           $fdisplay(file_output,"dmem31: %h",cputb.CPU.dmem.mem[31]);
            $fdisplay(file_output,"dmem28: %h",cputb.CPU.dmem.mem[32]);
                     $fdisplay(file_output,"dmem29: %h",cputb.CPU.dmem.mem[33]);
                     $fdisplay(file_output,"dmem30: %h",cputb.CPU.dmem.mem[34]);
                     $fdisplay(file_output,"dmem31: %h",cputb.CPU.dmem.mem[35]);*/
                                
                                /*$fdisplay(file_output,"cp00: %h",cputb.CPU.cp0.mem[0]);
                                $fdisplay(file_output,"cp01: %h",cputb.CPU.cp0.mem[1]);
                                $fdisplay(file_output,"cp02: %h",cputb.CPU.cp0.mem[2]);
                                $fdisplay(file_output,"cp03: %h",cputb.CPU.cp0.mem[3]);
                                $fdisplay(file_output,"cp04: %h",cputb.CPU.cp0.mem[4]);
                                $fdisplay(file_output,"cp05: %h",cputb.CPU.cp0.mem[5]);
                                $fdisplay(file_output,"cp06: %h",cputb.CPU.cp0.mem[6]);
                                $fdisplay(file_output,"cp07: %h",cputb.CPU.cp0.mem[7]);
                                $fdisplay(file_output,"cp08: %h",cputb.CPU.cp0.mem[8]);
                                $fdisplay(file_output,"cp09: %h",cputb.CPU.cp0.mem[9]);
                                $fdisplay(file_output,"cp010: %h",cputb.CPU.cp0.mem[10]);
                                $fdisplay(file_output,"cp011: %h",cputb.CPU.cp0.mem[11]);
                                $fdisplay(file_output,"cp012: %h",cputb.CPU.cp0.mem[12]);
                               // $fdisplay(file_output,"cp0_status_left: %h",cputb.CPU.cp0.buffer);
                                $fdisplay(file_output,"cp013: %h",cputb.CPU.cp0.mem[13]);
                                $fdisplay(file_output,"cp014: %h",cputb.CPU.cp0.mem[14]);
                                $fdisplay(file_output,"cp015: %h",cputb.CPU.cp0.mem[15]);
                                $fdisplay(file_output,"cp016: %h",cputb.CPU.cp0.mem[16]);
                                $fdisplay(file_output,"cp017: %h",cputb.CPU.cp0.mem[17]);
                                $fdisplay(file_output,"cp018: %h",cputb.CPU.cp0.mem[18]);
                                $fdisplay(file_output,"cp019: %h",cputb.CPU.cp0.mem[19]);
                                $fdisplay(file_output,"cp020: %h",cputb.CPU.cp0.mem[20]);
                                $fdisplay(file_output,"cp021: %h",cputb.CPU.cp0.mem[21]);
                                $fdisplay(file_output,"cp022: %h",cputb.CPU.cp0.mem[22]);
                                $fdisplay(file_output,"cp023: %h",cputb.CPU.cp0.mem[23]);
                                $fdisplay(file_output,"cp024: %h",cputb.CPU.cp0.mem[24]);
                                $fdisplay(file_output,"cp025: %h",cputb.CPU.cp0.mem[25]);
                                $fdisplay(file_output,"cp026: %h",cputb.CPU.cp0.mem[26]);
                                $fdisplay(file_output,"cp027: %h",cputb.CPU.cp0.mem[27]);
                                $fdisplay(file_output,"cp028: %h",cputb.CPU.cp0.mem[28]);
                                $fdisplay(file_output,"cp029: %h",cputb.CPU.cp0.mem[29]);
                                $fdisplay(file_output,"cp030: %h",cputb.CPU.cp0.mem[30]);
                                $fdisplay(file_output,"cp031: %h",cputb.CPU.cp0.mem[31]);*/
 
                end
        end
              
             // wire [7:0]seg;
             // wire [7:0]sel;
              
        cpu_top CPU(
                .clk(clk),
                .reset(reset),
                //.o_seg(seg),
               // .o_sel(sel)
                //线
                .z(z),
                .c(c),
                .n(n),
                .o(o),
                .npc_o(npc_o),
                .muxpc_o(muxpc_o),
                .pc_o(pc_o),
                .count_o(count_o),
                .imem_o(imem_o),
                .Rd(Rd),
                .Rs_o(Rs_o),
                .Rt_o(Rt_o),
                .ext5_o(ext5_o),
                .ext16_o(ext16_o),
                .mux_alua_o(mux_alua_o),
                .mux_alub_o(mux_alub_o),
                .alu_o(alu_o),
                .dm_o(dm_o),
                .muxec_o(muxec_o),
                .ec_o(ec_o),
                .hi_o(hi_o),
                .lo_o(lo_o),
                .muxhi_o(muxhi_o),
                .muxlo_o(muxlo_o),
                .div_oh(div_oh),
                .div_ol(div_ol),
                .mulu_oh(mulu_oh),
                .mulu_ol(mulu_ol),
                .div_busy(div_busy),
                .cp0_o(cp0_o),
                .muxcp0_o(muxcp0_o),
                .ext18_o(ext18_o),
                .add_o(add_o),
        
                //控制指令
                .MUX_PC(MUX_PC),
                .IM_R(IM_R),
                .RF_W(RF_W),
                .ALUC(ALUC),
                .MUX_RD(MUX_RD),
                .SIGN_E(SIGN_E),
                .DM_W(DM_W),
                .MUX_ALUA(MUX_ALUA),
                .MUX_ALUB(MUX_ALUB),
                .E_C(E_C), 
                .MUX_HI(MUX_HI),
                .MUX_LO(MUX_LO),
                .MUX_EC(MUX_EC),
                .HI_W(HI_W),
                .LO_W(LO_W),
                .EX_TYPE(EX_TYPE),
                .MFC0(MFC0),
                .MTC0(MTC0),
                .ERET(ERET),
                .EXCEPTION(EXCEPTION),
                .MUL_E(MUL_E),
                .DIV_S(DIV_S),
                .SIGN_EC(SIGN_EC),
                .Rdc(Rdc),
                .Rsc(Rsc),
                .Rtc(Rtc),
                .cp0_addr(cp0_addr),
                .mulu_out(mulu_out)
            );
        
              wire [31:0]mux_staclr_o;
              wire [31:0]mux_sta_o;
              wire [31:0]mux_cau_o;
              wire [31:0]mux_epc_o;
               
              assign mux_staclr_o=cputb.CPU.cp0.mux_staclr_o;
              assign mux_sta_o=cputb.CPU.cp0.mux_sta_o;        
              assign mux_cau_o=cputb.CPU.cp0.mux_cau_o;
              assign mux_epc_o=cputb.CPU.cp0.mux_epc_o;
        
endmodule
