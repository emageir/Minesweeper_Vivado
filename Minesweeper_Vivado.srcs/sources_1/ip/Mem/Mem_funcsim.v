// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon Jun 08 18:48:30 2015
// Host        : Vangelis-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Vfor/git/Minesweeper_Vivado/Minesweeper_Vivado.srcs/sources_1/ip/Mem/Mem_funcsim.v
// Design      : Mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Mem,dist_mem_gen_v8_0,{}" *) 
(* core_generation_info = "Mem,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=7,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_FAMILY=artix7,C_ADDR_WIDTH=9,C_DEFAULT_DATA=0,C_DEPTH=512,C_HAS_CLK=1,C_HAS_D=1,C_HAS_DPO=1,C_HAS_DPRA=1,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=1,C_MEM_INIT_FILE=no_coe_file_loaded,C_ELABORATION_DIR=./,C_MEM_TYPE=2,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=0,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=5,C_PARSER_TYPE=1}" *) 
(* NotValidForBitStream *)
module Mem
   (a,
    d,
    dpra,
    clk,
    we,
    spo,
    dpo);
  input [8:0]a;
  input [4:0]d;
  input [8:0]dpra;
  input clk;
  input we;
  output [4:0]spo;
  output [4:0]dpo;

  wire [8:0]a;
  wire clk;
  wire [4:0]d;
  wire [4:0]dpo;
  wire [8:0]dpra;
  wire [4:0]spo;
  wire we;
  wire [4:0]NLW_U0_qdpo_UNCONNECTED;
  wire [4:0]NLW_U0_qspo_UNCONNECTED;

(* C_FAMILY = "artix7" *) 
   (* C_HAS_CLK = "1" *) 
   (* C_HAS_D = "1" *) 
   (* C_HAS_WE = "1" *) 
   (* C_MEM_TYPE = "2" *) 
   (* DONT_TOUCH *) 
   (* c_addr_width = "9" *) 
   (* c_default_data = "0" *) 
   (* c_depth = "512" *) 
   (* c_elaboration_dir = "./" *) 
   (* c_has_dpo = "1" *) 
   (* c_has_dpra = "1" *) 
   (* c_has_i_ce = "0" *) 
   (* c_has_qdpo = "0" *) 
   (* c_has_qdpo_ce = "0" *) 
   (* c_has_qdpo_clk = "0" *) 
   (* c_has_qdpo_rst = "0" *) 
   (* c_has_qdpo_srst = "0" *) 
   (* c_has_qspo = "0" *) 
   (* c_has_qspo_ce = "0" *) 
   (* c_has_qspo_rst = "0" *) 
   (* c_has_qspo_srst = "0" *) 
   (* c_has_spo = "1" *) 
   (* c_mem_init_file = "no_coe_file_loaded" *) 
   (* c_parser_type = "1" *) 
   (* c_pipeline_stages = "0" *) 
   (* c_qce_joined = "0" *) 
   (* c_qualify_we = "0" *) 
   (* c_read_mif = "0" *) 
   (* c_reg_a_d_inputs = "0" *) 
   (* c_reg_dpra_input = "0" *) 
   (* c_sync_enable = "1" *) 
   (* c_width = "5" *) 
   Mem_dist_mem_gen_v8_0__parameterized0 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[4:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[4:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0" *) (* C_FAMILY = "artix7" *) (* C_ADDR_WIDTH = "9" *) 
(* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "512" *) (* C_HAS_CLK = "1" *) 
(* C_HAS_D = "1" *) (* C_HAS_DPO = "1" *) (* C_HAS_DPRA = "1" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "1" *) 
(* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_ELABORATION_DIR = "./" *) (* C_MEM_TYPE = "2" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "0" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "5" *) (* C_PARSER_TYPE = "1" *) 
module Mem_dist_mem_gen_v8_0__parameterized0
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [8:0]a;
  input [4:0]d;
  input [8:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [4:0]spo;
  output [4:0]dpo;
  output [4:0]qspo;
  output [4:0]qdpo;

  wire \<const0> ;
  wire [8:0]a;
  wire clk;
  wire [4:0]d;
  wire [4:0]dpo;
  wire [8:0]dpra;
  wire [4:0]spo;
  wire we;

  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
GND GND
       (.G(\<const0> ));
Mem_dist_mem_gen_v8_0_synth \synth_options.dist_mem_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .spo(spo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_synth" *) 
module Mem_dist_mem_gen_v8_0_synth
   (spo,
    dpo,
    clk,
    d,
    a,
    dpra,
    we);
  output [4:0]spo;
  output [4:0]dpo;
  input clk;
  input [4:0]d;
  input [8:0]a;
  input [8:0]dpra;
  input we;

  wire [8:0]a;
  wire clk;
  wire [4:0]d;
  wire [4:0]dpo;
  wire [8:0]dpra;
  wire [4:0]spo;
  wire we;

Mem_dpram__parameterized0 \gen_dp_ram.dpram_inst 
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(dpo),
        .dpra(dpra),
        .spo(spo),
        .we(we));
endmodule

(* ORIG_REF_NAME = "dpram" *) 
module Mem_dpram__parameterized0
   (spo,
    dpo,
    clk,
    d,
    a,
    dpra,
    we);
  output [4:0]spo;
  output [4:0]dpo;
  input clk;
  input [4:0]d;
  input [8:0]a;
  input [8:0]dpra;
  input we;

  wire [8:0]a;
  wire clk;
  wire [4:0]d;
  wire [4:0]dpo;
  wire [8:0]dpra;
  wire n_0_ram_reg_0_127_0_0;
  wire n_0_ram_reg_0_127_0_0_i_1;
  wire n_0_ram_reg_0_127_1_1;
  wire n_0_ram_reg_0_127_2_2;
  wire n_0_ram_reg_0_127_3_3;
  wire n_0_ram_reg_0_127_4_4;
  wire n_0_ram_reg_128_255_0_0;
  wire n_0_ram_reg_128_255_0_0_i_1;
  wire n_0_ram_reg_128_255_1_1;
  wire n_0_ram_reg_128_255_2_2;
  wire n_0_ram_reg_128_255_3_3;
  wire n_0_ram_reg_128_255_4_4;
  wire n_0_ram_reg_256_383_0_0;
  wire n_0_ram_reg_256_383_0_0_i_1;
  wire n_0_ram_reg_256_383_1_1;
  wire n_0_ram_reg_256_383_2_2;
  wire n_0_ram_reg_256_383_3_3;
  wire n_0_ram_reg_256_383_4_4;
  wire n_0_ram_reg_384_511_0_0;
  wire n_0_ram_reg_384_511_0_0_i_1;
  wire n_0_ram_reg_384_511_1_1;
  wire n_0_ram_reg_384_511_2_2;
  wire n_0_ram_reg_384_511_3_3;
  wire n_0_ram_reg_384_511_4_4;
  wire n_1_ram_reg_0_127_0_0;
  wire n_1_ram_reg_0_127_1_1;
  wire n_1_ram_reg_0_127_2_2;
  wire n_1_ram_reg_0_127_3_3;
  wire n_1_ram_reg_0_127_4_4;
  wire n_1_ram_reg_128_255_0_0;
  wire n_1_ram_reg_128_255_1_1;
  wire n_1_ram_reg_128_255_2_2;
  wire n_1_ram_reg_128_255_3_3;
  wire n_1_ram_reg_128_255_4_4;
  wire n_1_ram_reg_256_383_0_0;
  wire n_1_ram_reg_256_383_1_1;
  wire n_1_ram_reg_256_383_2_2;
  wire n_1_ram_reg_256_383_3_3;
  wire n_1_ram_reg_256_383_4_4;
  wire n_1_ram_reg_384_511_0_0;
  wire n_1_ram_reg_384_511_1_1;
  wire n_1_ram_reg_384_511_2_2;
  wire n_1_ram_reg_384_511_3_3;
  wire n_1_ram_reg_384_511_4_4;
(* RTL_KEEP = "true" *)   wire [4:0]qdpo_int;
(* RTL_KEEP = "true" *)   wire [4:0]qspo_int;
  wire [4:0]spo;
  wire we;

LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \dpo[0]_INST_0 
       (.I0(n_0_ram_reg_384_511_0_0),
        .I1(n_0_ram_reg_256_383_0_0),
        .I2(dpra[8]),
        .I3(n_0_ram_reg_128_255_0_0),
        .I4(dpra[7]),
        .I5(n_0_ram_reg_0_127_0_0),
        .O(dpo[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \dpo[1]_INST_0 
       (.I0(n_0_ram_reg_384_511_1_1),
        .I1(n_0_ram_reg_256_383_1_1),
        .I2(dpra[8]),
        .I3(n_0_ram_reg_128_255_1_1),
        .I4(dpra[7]),
        .I5(n_0_ram_reg_0_127_1_1),
        .O(dpo[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \dpo[2]_INST_0 
       (.I0(n_0_ram_reg_384_511_2_2),
        .I1(n_0_ram_reg_256_383_2_2),
        .I2(dpra[8]),
        .I3(n_0_ram_reg_128_255_2_2),
        .I4(dpra[7]),
        .I5(n_0_ram_reg_0_127_2_2),
        .O(dpo[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \dpo[3]_INST_0 
       (.I0(n_0_ram_reg_384_511_3_3),
        .I1(n_0_ram_reg_256_383_3_3),
        .I2(dpra[8]),
        .I3(n_0_ram_reg_128_255_3_3),
        .I4(dpra[7]),
        .I5(n_0_ram_reg_0_127_3_3),
        .O(dpo[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \dpo[4]_INST_0 
       (.I0(n_0_ram_reg_384_511_4_4),
        .I1(n_0_ram_reg_256_383_4_4),
        .I2(dpra[8]),
        .I3(n_0_ram_reg_128_255_4_4),
        .I4(dpra[7]),
        .I5(n_0_ram_reg_0_127_4_4),
        .O(dpo[4]));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qdpo_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[0]),
        .Q(qdpo_int[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qdpo_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[1]),
        .Q(qdpo_int[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qdpo_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[2]),
        .Q(qdpo_int[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qdpo_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[3]),
        .Q(qdpo_int[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qdpo_int_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(dpo[4]),
        .Q(qdpo_int[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qspo_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[0]),
        .Q(qspo_int[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qspo_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[1]),
        .Q(qspo_int[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qspo_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[2]),
        .Q(qspo_int[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qspo_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[3]),
        .Q(qspo_int[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   (* equivalent_register_removal = "no" *) 
   FDRE #(
    .INIT(1'b0)) 
     \qspo_int_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(spo[4]),
        .Q(qspo_int[4]),
        .R(1'b0));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_0_127_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(n_0_ram_reg_0_127_0_0),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_0_127_0_0),
        .WCLK(clk),
        .WE(n_0_ram_reg_0_127_0_0_i_1));
LUT3 #(
    .INIT(8'h02)) 
     ram_reg_0_127_0_0_i_1
       (.I0(we),
        .I1(a[7]),
        .I2(a[8]),
        .O(n_0_ram_reg_0_127_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_0_127_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(n_0_ram_reg_0_127_1_1),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_0_127_1_1),
        .WCLK(clk),
        .WE(n_0_ram_reg_0_127_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_0_127_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(n_0_ram_reg_0_127_2_2),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_0_127_2_2),
        .WCLK(clk),
        .WE(n_0_ram_reg_0_127_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_0_127_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(n_0_ram_reg_0_127_3_3),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_0_127_3_3),
        .WCLK(clk),
        .WE(n_0_ram_reg_0_127_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_0_127_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(n_0_ram_reg_0_127_4_4),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_0_127_4_4),
        .WCLK(clk),
        .WE(n_0_ram_reg_0_127_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_128_255_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(n_0_ram_reg_128_255_0_0),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_128_255_0_0),
        .WCLK(clk),
        .WE(n_0_ram_reg_128_255_0_0_i_1));
LUT3 #(
    .INIT(8'h40)) 
     ram_reg_128_255_0_0_i_1
       (.I0(a[8]),
        .I1(a[7]),
        .I2(we),
        .O(n_0_ram_reg_128_255_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_128_255_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(n_0_ram_reg_128_255_1_1),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_128_255_1_1),
        .WCLK(clk),
        .WE(n_0_ram_reg_128_255_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_128_255_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(n_0_ram_reg_128_255_2_2),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_128_255_2_2),
        .WCLK(clk),
        .WE(n_0_ram_reg_128_255_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_128_255_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(n_0_ram_reg_128_255_3_3),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_128_255_3_3),
        .WCLK(clk),
        .WE(n_0_ram_reg_128_255_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_128_255_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(n_0_ram_reg_128_255_4_4),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_128_255_4_4),
        .WCLK(clk),
        .WE(n_0_ram_reg_128_255_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_256_383_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(n_0_ram_reg_256_383_0_0),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_256_383_0_0),
        .WCLK(clk),
        .WE(n_0_ram_reg_256_383_0_0_i_1));
LUT3 #(
    .INIT(8'h40)) 
     ram_reg_256_383_0_0_i_1
       (.I0(a[7]),
        .I1(a[8]),
        .I2(we),
        .O(n_0_ram_reg_256_383_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_256_383_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(n_0_ram_reg_256_383_1_1),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_256_383_1_1),
        .WCLK(clk),
        .WE(n_0_ram_reg_256_383_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_256_383_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(n_0_ram_reg_256_383_2_2),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_256_383_2_2),
        .WCLK(clk),
        .WE(n_0_ram_reg_256_383_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_256_383_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(n_0_ram_reg_256_383_3_3),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_256_383_3_3),
        .WCLK(clk),
        .WE(n_0_ram_reg_256_383_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_256_383_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(n_0_ram_reg_256_383_4_4),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_256_383_4_4),
        .WCLK(clk),
        .WE(n_0_ram_reg_256_383_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_384_511_0_0
       (.A(a[6:0]),
        .D(d[0]),
        .DPO(n_0_ram_reg_384_511_0_0),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_384_511_0_0),
        .WCLK(clk),
        .WE(n_0_ram_reg_384_511_0_0_i_1));
LUT3 #(
    .INIT(8'h80)) 
     ram_reg_384_511_0_0_i_1
       (.I0(we),
        .I1(a[7]),
        .I2(a[8]),
        .O(n_0_ram_reg_384_511_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_384_511_1_1
       (.A(a[6:0]),
        .D(d[1]),
        .DPO(n_0_ram_reg_384_511_1_1),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_384_511_1_1),
        .WCLK(clk),
        .WE(n_0_ram_reg_384_511_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_384_511_2_2
       (.A(a[6:0]),
        .D(d[2]),
        .DPO(n_0_ram_reg_384_511_2_2),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_384_511_2_2),
        .WCLK(clk),
        .WE(n_0_ram_reg_384_511_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_384_511_3_3
       (.A(a[6:0]),
        .D(d[3]),
        .DPO(n_0_ram_reg_384_511_3_3),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_384_511_3_3),
        .WCLK(clk),
        .WE(n_0_ram_reg_384_511_0_0_i_1));
RAM128X1D #(
    .INIT(128'h00000000000000000000000000000000)) 
     ram_reg_384_511_4_4
       (.A(a[6:0]),
        .D(d[4]),
        .DPO(n_0_ram_reg_384_511_4_4),
        .DPRA(dpra[6:0]),
        .SPO(n_1_ram_reg_384_511_4_4),
        .WCLK(clk),
        .WE(n_0_ram_reg_384_511_0_0_i_1));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[0]_INST_0 
       (.I0(n_1_ram_reg_384_511_0_0),
        .I1(n_1_ram_reg_256_383_0_0),
        .I2(a[8]),
        .I3(n_1_ram_reg_128_255_0_0),
        .I4(a[7]),
        .I5(n_1_ram_reg_0_127_0_0),
        .O(spo[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[1]_INST_0 
       (.I0(n_1_ram_reg_384_511_1_1),
        .I1(n_1_ram_reg_256_383_1_1),
        .I2(a[8]),
        .I3(n_1_ram_reg_128_255_1_1),
        .I4(a[7]),
        .I5(n_1_ram_reg_0_127_1_1),
        .O(spo[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[2]_INST_0 
       (.I0(n_1_ram_reg_384_511_2_2),
        .I1(n_1_ram_reg_256_383_2_2),
        .I2(a[8]),
        .I3(n_1_ram_reg_128_255_2_2),
        .I4(a[7]),
        .I5(n_1_ram_reg_0_127_2_2),
        .O(spo[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[3]_INST_0 
       (.I0(n_1_ram_reg_384_511_3_3),
        .I1(n_1_ram_reg_256_383_3_3),
        .I2(a[8]),
        .I3(n_1_ram_reg_128_255_3_3),
        .I4(a[7]),
        .I5(n_1_ram_reg_0_127_3_3),
        .O(spo[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[4]_INST_0 
       (.I0(n_1_ram_reg_384_511_4_4),
        .I1(n_1_ram_reg_256_383_4_4),
        .I2(a[8]),
        .I3(n_1_ram_reg_128_255_4_4),
        .I4(a[7]),
        .I5(n_1_ram_reg_0_127_4_4),
        .O(spo[4]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
