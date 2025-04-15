----------------------------------------------------------------------------------
-- Company: UFRJ
-- Students: Artur, Micaela and Rafael
-- 
-- Create Date:    22:42:33 04/14/2025 
-- Design Name: 4-bit ALU
-- Module Name: Main - Behavioral 
-- Project Name: ULA - Primeiro trabalho
-- Target Devices: 
-- Tool versions: 
-- Description: This project implements a 4-bit Arithmetic Logic Unit (ALU) capable of performing 
-- 8 different operations, including arithmetic and logical functions. 
-- It was developed as the first assignment for the Digital Systems course at UFRJ. 
--
-- Dependencies: None
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: None
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- allows the use of signed arithmetic

entity Main is
    Port ( vetor_x : in  STD_LOGIC_VECTOR (3 downto 0);
           vetor_y : in  STD_LOGIC_VECTOR (3 downto 0);
			  bt_clk : in STD_LOGIC;
           led_result : out  STD_LOGIC_VECTOR (3 downto 0);
           led_carry : out  STD_LOGIC);
end Main;

architecture Behavioral of Main is
	-- registradores
	signal x_reg : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal y_reg : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal result_reg : signed (4 downto 0) := (others => '0');
	signal state : integer range 0 to 2 := 0;
	
begin
	
	process (bt_clk)
		variable x_sig : signed(3 downto 0);
		variable y_sig : signed(3 downto 0);
		
	begin
		if rising_edge(bt_clk) then
			case state is
				when 0 =>
					-- primeiro clk = registra x
					x_reg <= vetor_x;
					state <= 1;
					
				when 1 =>
					-- segundo clk = registra y e faz a operaracao
					y_reg <= vetor_y;
					x_sig := signed(x_reg);
					y_sig := signed(y_reg);
					result_reg <= resize(x_sig, 5) + resize(y_sig, 5);
					state <= 2;
					
				when 2 =>
					-- resultado ja calculado, esperando outro clk
					null;
					
				end case;
			end if;
		end process;

	-- saidas
	led_result <= STD_LOGIC_VECTOR(result_reg(3 downto 0)); -- 4 bits do resultado da soma
	led_carry <= result_reg(4); -- carry, se houver

end Behavioral;

