-- Engineer: Artur, Micaela, Rafael
-- University: UFRJ
-- Project: EEL480 - Practical Assignment 1 (ULA with FSM)
-- Module: shift.vhd
-- Description: 
--     This module performs a logical shift operation on a 4-bit input (A).
--     The direction of the shift is determined by the 4-bit control input (B).
--     - If B = "0000", A is shifted left by 1 bit.
--     - If B = "0001", A is shifted right by 1 bit.
--     - Otherwise, A is unchanged.
--     The shift is triggered by the rising edge of the clock and only when EN = '1'.
--     The output Y represents the shifted value and is intended to be connected to 4 LEDs.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity shift is
    Port (
        clk : in  STD_LOGIC;                     -- Clock input
        EN  : in  STD_LOGIC;                     -- Enable signal (operation happens only if EN = '1')
        A   : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit input to be shifted
        B   : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit control input to define the shift direction
        Y   : out STD_LOGIC_VECTOR(3 downto 0)   -- 4-bit output with the result (connect to LEDs)
    );
end shift;

-- Architecture defining the behavior
architecture Behavioral of shift is
    signal result : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); -- Internal signal to store the result
begin

    -- Process block triggered on the rising edge of the clock
    process(clk)
    begin
        if rising_edge(clk) then
            if EN = '1' then  -- Only perform shift if enabled
                if B = "0000" then
                    -- Shift left: discard the MSB, insert '0' in the LSB
                    result <= A(2 downto 0) & '0';
                elsif B = "0001" then
                    -- Shift right: discard the LSB, insert '0' in the MSB
                    result <= '0' & A(3 downto 1);
                else
                    -- For any other value of B, keep A unchanged
                    result <= A;
                end if;
            end if;
        end if;
    end process;

    -- Assign the internal result to output port Y
    Y <= result;

end Behavioral;