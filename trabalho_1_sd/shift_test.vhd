library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity (no ports needed)
entity shift_tb is
end shift_tb;

-- Testbench architecture
architecture behavior of shift_tb is
    -- Component declaration for the shift module
    component shift
        Port (
            clk : in  STD_LOGIC;
            A   : in  STD_LOGIC_VECTOR(3 downto 0);
            B   : in  STD_LOGIC_VECTOR(3 downto 0);
            Y   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals to connect to the shift module
    signal clk : STD_LOGIC := '0';
    signal A   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y   : STD_LOGIC_VECTOR(3 downto 0);
	 constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the shift module
    uut: shift
        Port map (
            clk => clk,
            A => A,
            B => B,
            Y => Y
        );

    -- Clock process
    clk_process :process
    begin
			clk <= '0';
			wait for CLK_PERIOD / 2;
			clk <= '1';
			wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process to apply inputs and observe output
    stimulus : process
    begin
        -- Test Case 1: Shift Left (B = "0000")
        A <= "1010";  -- Example input A = 1010
        B <= "0000";  -- Left shift control
        wait for CLK_PERIOD*2;  -- Wait for 2 clock cycles

        -- Test Case 2: Shift Right (B = "0001")
        A <= "1010";  -- Example input A = 1010
        B <= "0001";  -- Right shift control
        wait for CLK_PERIOD*2;  -- Wait for 2 clock cycles

        -- Test Case 3: No Shift (B = "0010")
        A <= "1010";  -- Example input A = 1010
        B <= "0010";  -- No shift control
        wait for CLK_PERIOD*2;  -- Wait for 2 clock cycles

        -- Test Case 4: No Shift (B = "1111")
        A <= "1111";  -- Example input A = 1111
        B <= "1111";  -- No shift control
        wait for CLK_PERIOD*2;  -- Wait for 2 clock cycles

        -- Test Case 5: Another Shift Left (B = "0000")
        A <= "1100";  -- Example input A = 1100
        B <= "0000";  -- Left shift control
        wait for CLK_PERIOD*2;  -- Wait for 2 clock cycles

        -- End of Test
        wait;
    end process;
end behavior;
