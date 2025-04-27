library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main_tb is
end Main_tb;

architecture Behavioral of Main_tb is
    -- Signals to connect to the DUT (Device Under Test)
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal button     : std_logic := '0';
    signal switches   : std_logic_vector(3 downto 0) := (others => '0');
    signal Y          : std_logic_vector(3 downto 0);
    signal carry_out  : std_logic;
    signal overflow   : std_logic;
    -- Clock period constant
    constant CLK_PERIOD : time := 20 ns;
begin

    -- Instantiate the DUT
    uut: entity work.Main
        port map (
            clk        => clk,
            reset      => reset,
            button     => button,
            switches   => switches,
            Y          => Y,
            carry_out  => carry_out,
            overflow   => overflow
        );

    -- Clock process
    clk_process :process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        reset <= '1';
        wait for 2*CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;

        -- Load operation = AND (operation code "0001")
        switches <= "0001";  
		  wait for CLK_PERIOD;
        button <= '1';  -- Press button to load operation
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        -- Load operand A = "1010"
        switches <= "1010";
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        -- Load operand B = "1100"
        switches <= "1100";
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        -- Now result should appear: Y = A AND B = "1000"
        wait for 5*CLK_PERIOD;

        -- Reset and test OR operation
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;

        switches <= "0010";  -- OR operation
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        switches <= "0101"; -- A = 0101
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        switches <= "0011"; -- B = 0011
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        -- Y should now be A OR B = "0111"
        wait for 5*CLK_PERIOD;

        -- Reset and test ADD operation
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD;

        switches <= "0011";  -- ADD operation
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        switches <= "0101"; -- A = 0101
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        switches <= "0011"; -- B = 0011
		  wait for CLK_PERIOD;
        button <= '1';
        wait for CLK_PERIOD;
        button <= '0';
        wait for CLK_PERIOD;

        -- Y should now be A + B = 8 (1000)
        wait for 5*CLK_PERIOD;

        -- End simulation
        wait;
    end process;
end Behavioral;
