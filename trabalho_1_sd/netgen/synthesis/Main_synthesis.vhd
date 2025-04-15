--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: Main_synthesis.vhd
-- /___/   /\     Timestamp: Tue Apr 15 18:29:17 2025
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm Main -w -dir netgen/synthesis -ofmt vhdl -sim Main.ngc Main_synthesis.vhd 
-- Device	: xc3s700an-5-fgg484
-- Input file	: Main.ngc
-- Output file	: /home/ise/VirtualBox/Trabalho-1-Sistemas-Digitais/trabalho_1_sd/netgen/synthesis/Main_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: Main
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity Main is
  port (
    bt_clk : in STD_LOGIC := 'X'; 
    led_carry : out STD_LOGIC; 
    led_result : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    vetor_in : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end Main;

architecture Structure of Main is
  signal Madd_result_reg_add0000_lut_0_Q : STD_LOGIC; 
  signal Madd_result_reg_add0000_lut_3_Q : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal bt_clk_BUFGP_8 : STD_LOGIC; 
  signal state_FSM_FFd2_23 : STD_LOGIC; 
  signal state_FSM_FFd3_24 : STD_LOGIC; 
  signal vetor_in_0_IBUF_29 : STD_LOGIC; 
  signal vetor_in_1_IBUF_30 : STD_LOGIC; 
  signal vetor_in_2_IBUF_31 : STD_LOGIC; 
  signal vetor_in_3_IBUF_32 : STD_LOGIC; 
  signal Madd_result_reg_add0000_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal result_reg : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal result_reg_add0000 : STD_LOGIC_VECTOR ( 4 downto 1 ); 
  signal x_reg : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  x_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd3_24,
      D => vetor_in_0_IBUF_29,
      Q => x_reg(0)
    );
  x_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd3_24,
      D => vetor_in_1_IBUF_30,
      Q => x_reg(1)
    );
  x_reg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd3_24,
      D => vetor_in_2_IBUF_31,
      Q => x_reg(2)
    );
  x_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd3_24,
      D => vetor_in_3_IBUF_32,
      Q => x_reg(3)
    );
  result_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd2_23,
      D => Madd_result_reg_add0000_lut_0_Q,
      Q => result_reg(0)
    );
  result_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd2_23,
      D => result_reg_add0000(1),
      Q => result_reg(1)
    );
  result_reg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd2_23,
      D => result_reg_add0000(2),
      Q => result_reg(2)
    );
  result_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd2_23,
      D => result_reg_add0000(3),
      Q => result_reg(3)
    );
  result_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      CE => state_FSM_FFd2_23,
      D => result_reg_add0000(4),
      Q => result_reg(4)
    );
  state_FSM_FFd3 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => bt_clk_BUFGP_8,
      D => N0,
      Q => state_FSM_FFd3_24
    );
  state_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => bt_clk_BUFGP_8,
      D => state_FSM_FFd3_24,
      Q => state_FSM_FFd2_23
    );
  Madd_result_reg_add0000_lut_0_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => x_reg(0),
      I1 => vetor_in_0_IBUF_29,
      O => Madd_result_reg_add0000_lut_0_Q
    );
  vetor_in_3_IBUF : IBUF
    port map (
      I => vetor_in(3),
      O => vetor_in_3_IBUF_32
    );
  vetor_in_2_IBUF : IBUF
    port map (
      I => vetor_in(2),
      O => vetor_in_2_IBUF_31
    );
  vetor_in_1_IBUF : IBUF
    port map (
      I => vetor_in(1),
      O => vetor_in_1_IBUF_30
    );
  vetor_in_0_IBUF : IBUF
    port map (
      I => vetor_in(0),
      O => vetor_in_0_IBUF_29
    );
  led_carry_OBUF : OBUF
    port map (
      I => result_reg(4),
      O => led_carry
    );
  led_result_3_OBUF : OBUF
    port map (
      I => result_reg(3),
      O => led_result(3)
    );
  led_result_2_OBUF : OBUF
    port map (
      I => result_reg(2),
      O => led_result(2)
    );
  led_result_1_OBUF : OBUF
    port map (
      I => result_reg(1),
      O => led_result(1)
    );
  led_result_0_OBUF : OBUF
    port map (
      I => result_reg(0),
      O => led_result(0)
    );
  Madd_result_reg_add0000_xor_4_1 : LUT3
    generic map(
      INIT => X"2E"
    )
    port map (
      I0 => x_reg(3),
      I1 => Madd_result_reg_add0000_lut_3_Q,
      I2 => N5,
      O => result_reg_add0000(4)
    );
  Madd_result_reg_add0000_xor_1_11 : LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      I0 => vetor_in_1_IBUF_30,
      I1 => x_reg(1),
      I2 => x_reg(0),
      I3 => vetor_in_0_IBUF_29,
      O => result_reg_add0000(1)
    );
  Madd_result_reg_add0000_xor_2_11 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => x_reg(2),
      I1 => vetor_in_2_IBUF_31,
      I2 => N8,
      O => result_reg_add0000(2)
    );
  Madd_result_reg_add0000_xor_3_11 : LUT4
    generic map(
      INIT => X"566A"
    )
    port map (
      I0 => N7,
      I1 => x_reg(2),
      I2 => vetor_in_2_IBUF_31,
      I3 => Madd_result_reg_add0000_cy(1),
      O => result_reg_add0000(3)
    );
  bt_clk_BUFGP : BUFGP
    port map (
      I => bt_clk,
      O => bt_clk_BUFGP_8
    );
  Madd_result_reg_add0000_lut_3_1 : LUT2_D
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => x_reg(3),
      I1 => vetor_in_3_IBUF_32,
      LO => N7,
      O => Madd_result_reg_add0000_lut_3_Q
    );
  Madd_result_reg_add0000_cy_1_11 : LUT4_D
    generic map(
      INIT => X"E8C0"
    )
    port map (
      I0 => vetor_in_0_IBUF_29,
      I1 => vetor_in_1_IBUF_30,
      I2 => x_reg(1),
      I3 => x_reg(0),
      LO => N8,
      O => Madd_result_reg_add0000_cy(1)
    );
  Madd_result_reg_add0000_xor_4_1_SW0 : LUT3_L
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => vetor_in_2_IBUF_31,
      I1 => x_reg(2),
      I2 => Madd_result_reg_add0000_cy(1),
      LO => N5
    );

end Structure;

