-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Mon Jun 08 18:48:30 2015
-- Host        : Vangelis-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Vfor/git/Minesweeper_Vivado/Minesweeper_Vivado.srcs/sources_1/ip/Mem/Mem_funcsim.vhdl
-- Design      : Mem
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \Mem_dpram__parameterized0\ is
  port (
    spo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \Mem_dpram__parameterized0\ : entity is "dpram";
end \Mem_dpram__parameterized0\;

architecture STRUCTURE of \Mem_dpram__parameterized0\ is
  signal \^dpo\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal n_0_ram_reg_0_127_0_0 : STD_LOGIC;
  signal n_0_ram_reg_0_127_0_0_i_1 : STD_LOGIC;
  signal n_0_ram_reg_0_127_1_1 : STD_LOGIC;
  signal n_0_ram_reg_0_127_2_2 : STD_LOGIC;
  signal n_0_ram_reg_0_127_3_3 : STD_LOGIC;
  signal n_0_ram_reg_0_127_4_4 : STD_LOGIC;
  signal n_0_ram_reg_128_255_0_0 : STD_LOGIC;
  signal n_0_ram_reg_128_255_0_0_i_1 : STD_LOGIC;
  signal n_0_ram_reg_128_255_1_1 : STD_LOGIC;
  signal n_0_ram_reg_128_255_2_2 : STD_LOGIC;
  signal n_0_ram_reg_128_255_3_3 : STD_LOGIC;
  signal n_0_ram_reg_128_255_4_4 : STD_LOGIC;
  signal n_0_ram_reg_256_383_0_0 : STD_LOGIC;
  signal n_0_ram_reg_256_383_0_0_i_1 : STD_LOGIC;
  signal n_0_ram_reg_256_383_1_1 : STD_LOGIC;
  signal n_0_ram_reg_256_383_2_2 : STD_LOGIC;
  signal n_0_ram_reg_256_383_3_3 : STD_LOGIC;
  signal n_0_ram_reg_256_383_4_4 : STD_LOGIC;
  signal n_0_ram_reg_384_511_0_0 : STD_LOGIC;
  signal n_0_ram_reg_384_511_0_0_i_1 : STD_LOGIC;
  signal n_0_ram_reg_384_511_1_1 : STD_LOGIC;
  signal n_0_ram_reg_384_511_2_2 : STD_LOGIC;
  signal n_0_ram_reg_384_511_3_3 : STD_LOGIC;
  signal n_0_ram_reg_384_511_4_4 : STD_LOGIC;
  signal n_1_ram_reg_0_127_0_0 : STD_LOGIC;
  signal n_1_ram_reg_0_127_1_1 : STD_LOGIC;
  signal n_1_ram_reg_0_127_2_2 : STD_LOGIC;
  signal n_1_ram_reg_0_127_3_3 : STD_LOGIC;
  signal n_1_ram_reg_0_127_4_4 : STD_LOGIC;
  signal n_1_ram_reg_128_255_0_0 : STD_LOGIC;
  signal n_1_ram_reg_128_255_1_1 : STD_LOGIC;
  signal n_1_ram_reg_128_255_2_2 : STD_LOGIC;
  signal n_1_ram_reg_128_255_3_3 : STD_LOGIC;
  signal n_1_ram_reg_128_255_4_4 : STD_LOGIC;
  signal n_1_ram_reg_256_383_0_0 : STD_LOGIC;
  signal n_1_ram_reg_256_383_1_1 : STD_LOGIC;
  signal n_1_ram_reg_256_383_2_2 : STD_LOGIC;
  signal n_1_ram_reg_256_383_3_3 : STD_LOGIC;
  signal n_1_ram_reg_256_383_4_4 : STD_LOGIC;
  signal n_1_ram_reg_384_511_0_0 : STD_LOGIC;
  signal n_1_ram_reg_384_511_1_1 : STD_LOGIC;
  signal n_1_ram_reg_384_511_2_2 : STD_LOGIC;
  signal n_1_ram_reg_384_511_3_3 : STD_LOGIC;
  signal n_1_ram_reg_384_511_4_4 : STD_LOGIC;
  signal qdpo_int : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal qspo_int : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^spo\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \qdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[3]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[4]\ : label is "no";
  attribute KEEP of \qspo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[0]\ : label is "no";
  attribute KEEP of \qspo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[1]\ : label is "no";
  attribute KEEP of \qspo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[2]\ : label is "no";
  attribute KEEP of \qspo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[3]\ : label is "no";
  attribute KEEP of \qspo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[4]\ : label is "no";
begin
  dpo(4 downto 0) <= \^dpo\(4 downto 0);
  spo(4 downto 0) <= \^spo\(4 downto 0);
\dpo[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_ram_reg_384_511_0_0,
      I1 => n_0_ram_reg_256_383_0_0,
      I2 => dpra(8),
      I3 => n_0_ram_reg_128_255_0_0,
      I4 => dpra(7),
      I5 => n_0_ram_reg_0_127_0_0,
      O => \^dpo\(0)
    );
\dpo[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_ram_reg_384_511_1_1,
      I1 => n_0_ram_reg_256_383_1_1,
      I2 => dpra(8),
      I3 => n_0_ram_reg_128_255_1_1,
      I4 => dpra(7),
      I5 => n_0_ram_reg_0_127_1_1,
      O => \^dpo\(1)
    );
\dpo[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_ram_reg_384_511_2_2,
      I1 => n_0_ram_reg_256_383_2_2,
      I2 => dpra(8),
      I3 => n_0_ram_reg_128_255_2_2,
      I4 => dpra(7),
      I5 => n_0_ram_reg_0_127_2_2,
      O => \^dpo\(2)
    );
\dpo[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_ram_reg_384_511_3_3,
      I1 => n_0_ram_reg_256_383_3_3,
      I2 => dpra(8),
      I3 => n_0_ram_reg_128_255_3_3,
      I4 => dpra(7),
      I5 => n_0_ram_reg_0_127_3_3,
      O => \^dpo\(3)
    );
\dpo[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_ram_reg_384_511_4_4,
      I1 => n_0_ram_reg_256_383_4_4,
      I2 => dpra(8),
      I3 => n_0_ram_reg_128_255_4_4,
      I4 => dpra(7),
      I5 => n_0_ram_reg_0_127_4_4,
      O => \^dpo\(4)
    );
\qdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^dpo\(0),
      Q => qdpo_int(0),
      R => '0'
    );
\qdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^dpo\(1),
      Q => qdpo_int(1),
      R => '0'
    );
\qdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^dpo\(2),
      Q => qdpo_int(2),
      R => '0'
    );
\qdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^dpo\(3),
      Q => qdpo_int(3),
      R => '0'
    );
\qdpo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^dpo\(4),
      Q => qdpo_int(4),
      R => '0'
    );
\qspo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^spo\(0),
      Q => qspo_int(0),
      R => '0'
    );
\qspo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^spo\(1),
      Q => qspo_int(1),
      R => '0'
    );
\qspo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^spo\(2),
      Q => qspo_int(2),
      R => '0'
    );
\qspo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^spo\(3),
      Q => qspo_int(3),
      R => '0'
    );
\qspo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => '1',
      D => \^spo\(4),
      Q => qspo_int(4),
      R => '0'
    );
ram_reg_0_127_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => n_0_ram_reg_0_127_0_0,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_0_127_0_0,
      WCLK => clk,
      WE => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_0_127_0_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => we,
      I1 => a(7),
      I2 => a(8),
      O => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_0_127_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => n_0_ram_reg_0_127_1_1,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_0_127_1_1,
      WCLK => clk,
      WE => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_0_127_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => n_0_ram_reg_0_127_2_2,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_0_127_2_2,
      WCLK => clk,
      WE => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_0_127_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => n_0_ram_reg_0_127_3_3,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_0_127_3_3,
      WCLK => clk,
      WE => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_0_127_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => n_0_ram_reg_0_127_4_4,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_0_127_4_4,
      WCLK => clk,
      WE => n_0_ram_reg_0_127_0_0_i_1
    );
ram_reg_128_255_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => n_0_ram_reg_128_255_0_0,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_128_255_0_0,
      WCLK => clk,
      WE => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_128_255_0_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => a(8),
      I1 => a(7),
      I2 => we,
      O => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_128_255_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => n_0_ram_reg_128_255_1_1,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_128_255_1_1,
      WCLK => clk,
      WE => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_128_255_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => n_0_ram_reg_128_255_2_2,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_128_255_2_2,
      WCLK => clk,
      WE => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_128_255_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => n_0_ram_reg_128_255_3_3,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_128_255_3_3,
      WCLK => clk,
      WE => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_128_255_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => n_0_ram_reg_128_255_4_4,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_128_255_4_4,
      WCLK => clk,
      WE => n_0_ram_reg_128_255_0_0_i_1
    );
ram_reg_256_383_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => n_0_ram_reg_256_383_0_0,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_256_383_0_0,
      WCLK => clk,
      WE => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_256_383_0_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => a(7),
      I1 => a(8),
      I2 => we,
      O => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_256_383_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => n_0_ram_reg_256_383_1_1,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_256_383_1_1,
      WCLK => clk,
      WE => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_256_383_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => n_0_ram_reg_256_383_2_2,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_256_383_2_2,
      WCLK => clk,
      WE => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_256_383_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => n_0_ram_reg_256_383_3_3,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_256_383_3_3,
      WCLK => clk,
      WE => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_256_383_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => n_0_ram_reg_256_383_4_4,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_256_383_4_4,
      WCLK => clk,
      WE => n_0_ram_reg_256_383_0_0_i_1
    );
ram_reg_384_511_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => n_0_ram_reg_384_511_0_0,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_384_511_0_0,
      WCLK => clk,
      WE => n_0_ram_reg_384_511_0_0_i_1
    );
ram_reg_384_511_0_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => we,
      I1 => a(7),
      I2 => a(8),
      O => n_0_ram_reg_384_511_0_0_i_1
    );
ram_reg_384_511_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => n_0_ram_reg_384_511_1_1,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_384_511_1_1,
      WCLK => clk,
      WE => n_0_ram_reg_384_511_0_0_i_1
    );
ram_reg_384_511_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => n_0_ram_reg_384_511_2_2,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_384_511_2_2,
      WCLK => clk,
      WE => n_0_ram_reg_384_511_0_0_i_1
    );
ram_reg_384_511_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => n_0_ram_reg_384_511_3_3,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_384_511_3_3,
      WCLK => clk,
      WE => n_0_ram_reg_384_511_0_0_i_1
    );
ram_reg_384_511_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
    port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => n_0_ram_reg_384_511_4_4,
      DPRA(6 downto 0) => dpra(6 downto 0),
      SPO => n_1_ram_reg_384_511_4_4,
      WCLK => clk,
      WE => n_0_ram_reg_384_511_0_0_i_1
    );
\spo[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_1_ram_reg_384_511_0_0,
      I1 => n_1_ram_reg_256_383_0_0,
      I2 => a(8),
      I3 => n_1_ram_reg_128_255_0_0,
      I4 => a(7),
      I5 => n_1_ram_reg_0_127_0_0,
      O => \^spo\(0)
    );
\spo[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_1_ram_reg_384_511_1_1,
      I1 => n_1_ram_reg_256_383_1_1,
      I2 => a(8),
      I3 => n_1_ram_reg_128_255_1_1,
      I4 => a(7),
      I5 => n_1_ram_reg_0_127_1_1,
      O => \^spo\(1)
    );
\spo[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_1_ram_reg_384_511_2_2,
      I1 => n_1_ram_reg_256_383_2_2,
      I2 => a(8),
      I3 => n_1_ram_reg_128_255_2_2,
      I4 => a(7),
      I5 => n_1_ram_reg_0_127_2_2,
      O => \^spo\(2)
    );
\spo[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_1_ram_reg_384_511_3_3,
      I1 => n_1_ram_reg_256_383_3_3,
      I2 => a(8),
      I3 => n_1_ram_reg_128_255_3_3,
      I4 => a(7),
      I5 => n_1_ram_reg_0_127_3_3,
      O => \^spo\(3)
    );
\spo[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_1_ram_reg_384_511_4_4,
      I1 => n_1_ram_reg_256_383_4_4,
      I2 => a(8),
      I3 => n_1_ram_reg_128_255_4_4,
      I4 => a(7),
      I5 => n_1_ram_reg_0_127_4_4,
      O => \^spo\(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mem_dist_mem_gen_v8_0_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    we : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Mem_dist_mem_gen_v8_0_synth : entity is "dist_mem_gen_v8_0_synth";
end Mem_dist_mem_gen_v8_0_synth;

architecture STRUCTURE of Mem_dist_mem_gen_v8_0_synth is
begin
\gen_dp_ram.dpram_inst\: entity work.\Mem_dpram__parameterized0\
    port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(4 downto 0) => d(4 downto 0),
      dpo(4 downto 0) => dpo(4 downto 0),
      dpra(8 downto 0) => dpra(8 downto 0),
      spo(4 downto 0) => spo(4 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \Mem_dist_mem_gen_v8_0__parameterized0\ is
  port (
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is "dist_mem_gen_v8_0";
  attribute C_FAMILY : string;
  attribute C_FAMILY of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is "artix7";
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 9;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 512;
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is "no_coe_file_loaded";
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is "./";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 2;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 5;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of \Mem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
end \Mem_dist_mem_gen_v8_0__parameterized0\;

architecture STRUCTURE of \Mem_dist_mem_gen_v8_0__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
begin
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.Mem_dist_mem_gen_v8_0_synth
    port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(4 downto 0) => d(4 downto 0),
      dpo(4 downto 0) => dpo(4 downto 0),
      dpra(8 downto 0) => dpra(8 downto 0),
      spo(4 downto 0) => spo(4 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mem is
  port (
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Mem : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Mem : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of Mem : entity is "dist_mem_gen_v8_0,Vivado 2014.4";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Mem : entity is "Mem,dist_mem_gen_v8_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of Mem : entity is "Mem,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=7,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_FAMILY=artix7,C_ADDR_WIDTH=9,C_DEFAULT_DATA=0,C_DEPTH=512,C_HAS_CLK=1,C_HAS_D=1,C_HAS_DPO=1,C_HAS_DPRA=1,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=1,C_MEM_INIT_FILE=no_coe_file_loaded,C_ELABORATION_DIR=./,C_MEM_TYPE=2,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=0,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=5,C_PARSER_TYPE=1}";
end Mem;

architecture STRUCTURE of Mem is
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 2;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 9;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 512;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_dpo : integer;
  attribute c_has_dpo of U0 : label is 1;
  attribute c_has_dpra : integer;
  attribute c_has_dpra of U0 : label is 1;
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qdpo : integer;
  attribute c_has_qdpo of U0 : label is 0;
  attribute c_has_qdpo_ce : integer;
  attribute c_has_qdpo_ce of U0 : label is 0;
  attribute c_has_qdpo_clk : integer;
  attribute c_has_qdpo_clk of U0 : label is 0;
  attribute c_has_qdpo_rst : integer;
  attribute c_has_qdpo_rst of U0 : label is 0;
  attribute c_has_qdpo_srst : integer;
  attribute c_has_qdpo_srst of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_reg_dpra_input : integer;
  attribute c_reg_dpra_input of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 5;
begin
U0: entity work.\Mem_dist_mem_gen_v8_0__parameterized0\
    port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(4 downto 0) => d(4 downto 0),
      dpo(4 downto 0) => dpo(4 downto 0),
      dpra(8 downto 0) => dpra(8 downto 0),
      i_ce => '1',
      qdpo(4 downto 0) => NLW_U0_qdpo_UNCONNECTED(4 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(4 downto 0) => NLW_U0_qspo_UNCONNECTED(4 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(4 downto 0) => spo(4 downto 0),
      we => we
    );
end STRUCTURE;
