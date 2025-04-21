library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main_tb is
-- no ports in testbench
end Main_tb;

architecture behavior of Main_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Main is
        Port (
            vetor_in   : in  STD_LOGIC_VECTOR (3 downto 0);
            bt_clk     : in  STD_LOGIC;
            led_result : out STD_LOGIC_VECTOR (3 downto 0);
            led_carry  : out STD_LOGIC;
				state_out  : out STD_LOGIC_VECTOR (1 downto 0)
        );
    end component;

    -- Inputs
    signal vetor_in   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal bt_clk     : STD_LOGIC := '0';

    -- Outputs
    signal led_result : STD_LOGIC_VECTOR(3 downto 0);
    signal led_carry  : STD_LOGIC;
	 signal state_out  : STD_LOGIC_VECTOR (1 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Main
        Port map (
            vetor_in   => vetor_in,
            bt_clk     => bt_clk,
            led_result => led_result,
            led_carry  => led_carry,
				state_out => state_out
        );

    -- Clock process definitions
    clk_process :process
    begin
		bt_clk <= '0';
		wait for clk_period/2;
		bt_clk <= '1';
		wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial delay
        wait for clk_period*4;

        -- First operand: 3 (0011)
        vetor_in <= "0011";  -- x = 3
        wait for clk_period*2;

        -- Second operand: 5 (0101)
        vetor_in <= "0101";  -- y = 5
        wait for clk_period*2;

        -- Wait for result to settle
        wait for clk_period*5;

        -- Expect result = 8 (1000), carry = 0

        -- Test another case: 7 + 9 = 16 (1 0000)
        vetor_in <= "0111";  -- x = 7
        wait for clk_period*2;

        vetor_in <= "1001";  -- y = 9
        wait for clk_period*2;

        -- Wait for result to settle
        wait for clk_period*5;

        -- Expect result = 0000, carry = 1

        wait;
    end process;

end behavior;
