library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity absolute_tb is
end absolute_tb;

architecture Behavioral of absolute_tb is
    -- Signals to connect to DUT
    signal A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the DUT
    uut: entity work.absolute
        port map (
            A => A,
            Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 0 (0000 -> 0000)
        A <= "0000"; 
        wait for 20 ns;

        -- Test +3 (0011 -> 0011)
        A <= "0011"; 
        wait for 20 ns;

        -- Test -3 (1101 -> 0011)
        A <= "1101"; 
        wait for 20 ns;

        A <= "1100"; 
        wait for 20 ns;

        -- Test +7 (0111 -> 0111)
        A <= "0111"; 
        wait for 20 ns;

        -- Test -1 (1111 -> 0001)
        A <= "1111"; 
        wait for 20 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
