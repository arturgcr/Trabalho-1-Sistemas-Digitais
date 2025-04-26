library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andOperation_tb is
end andOperation_tb;

architecture Behavioral of andOperation_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component andOperation
        Port (
            clk : in  STD_LOGIC;
            EN  : in  STD_LOGIC;
            A   : in  STD_LOGIC_VECTOR(3 downto 0);
            B   : in  STD_LOGIC_VECTOR(3 downto 0);
            Y   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal clk_tb : STD_LOGIC := '0';
    signal EN_tb  : STD_LOGIC := '0';
    signal A_tb   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B_tb   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: andOperation
        Port map (
            clk => clk_tb,
            EN  => EN_tb,
            A   => A_tb,
            B   => B_tb,
            Y   => Y_tb
        );

    -- Clock generation process (50 MHz clock)
    clk_process: process
    begin
        clk_tb <= not clk_tb;
        wait for 10 ns;  -- Toggle every 10 ns for 50 MHz clock
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Set inputs to known values and enable the AND operation
        A_tb <= "1100";  -- 12 in decimal
        B_tb <= "1010";  -- 10 in decimal
        EN_tb <= '1';    -- Enable the operation
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 2: Disable the AND operation (EN = '0')
        EN_tb <= '0';    -- Disable the operation
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 3: Set inputs to another set of values and enable the AND operation
        A_tb <= "1111";  -- 15 in decimal
        B_tb <= "0111";  -- 7 in decimal
        EN_tb <= '1';    -- Enable the operation
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 4: Change inputs and disable the AND operation
        A_tb <= "0001";  -- 1 in decimal
        B_tb <= "0100";  -- 4 in decimal
        EN_tb <= '0';    -- Disable the operation
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- Test 5: Enable AND operation with new values
        A_tb <= "1010";  -- 10 in decimal
        B_tb <= "1100";  -- 12 in decimal
        EN_tb <= '1';    -- Enable the operation
        wait for 20 ns;  -- Wait for 2 clock cycles

        -- End the simulation
        wait;
    end process;

end Behavioral;
