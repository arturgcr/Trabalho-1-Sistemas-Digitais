library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity orOperation_tb is
end orOperation_tb;

architecture Behavioral of orOperation_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component orOperation
        Port (
            A   : in  STD_LOGIC_VECTOR(3 downto 0);
            B   : in  STD_LOGIC_VECTOR(3 downto 0);
            Y   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal A_tb   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B_tb   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: orOperation
        Port map (
            A   => A_tb,
            B   => B_tb,
            Y   => Y_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Set inputs to known values and enable the AND operation
        A_tb <= "1100";  -- 12 in decimal
        B_tb <= "1010";  -- 10 in decimal
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 2: Disable the AND operation (EN = '0')
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 3: Set inputs to another set of values and enable the AND operation
        A_tb <= "1111";  -- 15 in decimal
        B_tb <= "0111";  -- 7 in decimal
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 4: Change inputs and disable the AND operation
        A_tb <= "0001";  -- 1 in decimal
        B_tb <= "0100";  -- 4 in decimal
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 5: Enable AND operation with new values
        A_tb <= "1010";  -- 10 in decimal
        B_tb <= "1100";  -- 12 in decimal
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- End the simulation
        wait;
    end process;

end Behavioral;
