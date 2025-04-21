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
    Port (
        vetor_in   : in  STD_LOGIC_VECTOR (3 downto 0);
        bt_clk     : in  STD_LOGIC;
        led_result : out STD_LOGIC_VECTOR (3 downto 0);
        led_carry  : out STD_LOGIC;
		  state_out  : out STD_LOGIC_VECTOR (1 downto 0)
    );
end Main;

architecture Behavioral of Main is

    -- Sinais internos
    signal x_reg      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal y_reg      : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal result_reg : signed (4 downto 0) := (others => '0');
    signal state      : integer range 0 to 2 := 0;
	 signal state_out_reg : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
begin

    process (bt_clk)
    begin
	 
        if rising_edge(bt_clk) then
            case state is
                when 0 =>
                    x_reg <= vetor_in; -- armazena X
                    state <= 1;
						  state_out_reg <= "01";
                when 1 =>
                    y_reg <= vetor_in; -- armazena Y
                    result_reg <= resize(signed(x_reg), 5) + resize(signed(vetor_in), 5);
                    state <= 2;
						  state_out_reg <= "10";
                when others =>
                    -- aguarda novo ciclo
                    state <= 0;  -- opcional: reiniciar para novo cálculo
						  state_out_reg <= "00";
            end case;
        end if;
    end process;

    led_result <= std_logic_vector(result_reg(3 downto 0));
    led_carry  <= result_reg(4);
	 state_out <= state_out_reg;

end Behavioral;