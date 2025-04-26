library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_addition is
end tb_addition;

architecture Behavioral of tb_addition is
    -- Component declaration
    component addition
        Port (
			  clk        : in  std_logic;
			  reset      : in  std_logic;
			  button     : in  std_logic;
			  switches   : in  std_logic_vector(3 downto 0);
			  leds       : out std_logic_vector(3 downto 0);
			  carry_out  : out std_logic;
			  overflow   : out std_logic;
			  state_out  : out std_logic_vector(1 downto 0)
        );
    end component;
    -- Testbench signals
    signal clk_tb        : std_logic := '0';
    signal reset_tb      : std_logic := '0';
    signal button_tb     : std_logic := '0';
    signal switches_tb   : std_logic_vector(3 downto 0) := (others => '0');
    signal leds_tb       : std_logic_vector(3 downto 0);
    signal carry_out_tb  : std_logic;
    signal overflow_tb   : std_logic;
	 signal state_out_tb  : std_logic_vector(1 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the unit under test
    UUT: addition
        port map (
            clk        => clk_tb,
            reset      => reset_tb,
            button     => button_tb,
            switches   => switches_tb,
            leds       => leds_tb,
            carry_out  => carry_out_tb,
            overflow   => overflow_tb,
				state_out  => state_out_tb
        );

    -- Clock generation
    clk_process : process
    begin
			clk_tb <= '0';
			wait for clk_period/2;
			clk_tb <= '1';
			wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset
        reset_tb <= '1';
        wait for clk_period * 2;
        reset_tb <= '0';
        wait for clk_period * 2;

        -- First number: 5 (0101)
        switches_tb <= "0101";
        wait for clk_period;

        -- Button press to store first number
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;

        -- Second number: -3 (1101 in 2's complement)
        switches_tb <= "1101";
        wait for clk_period;

        -- Button press to trigger addition
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;

        -- Wait and observe result
        wait for clk_period * 10;
		  
		  -- Reset to IDLE
        reset_tb <= '1';
        wait for clk_period * 2;
        reset_tb <= '0';
        wait for clk_period * 4;
		  
        -- Another test: 7 + 2 = 9 (with overflow)
        switches_tb <= "0111"; -- 7
		  wait for clk_period;
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;

        switches_tb <= "0010"; -- 2
		  wait for clk_period;
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;
		  
		  -- Reset to IDLE
        reset_tb <= '1';
        wait for clk_period * 2;
        reset_tb <= '0';
        wait for clk_period * 4;
		  
		   -- Another test: 5 - 2 = 3
        switches_tb <= "0101"; -- 5
		  wait for clk_period;
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;

        switches_tb <= "1110"; -- -2
		  wait for clk_period;
        button_tb <= '1';
        wait for clk_period;
        button_tb <= '0';
        wait for clk_period * 4;

        -- Wait and observe result
        wait for clk_period * 10;

        -- End simulation
        wait;
    end process;
end Behavioral;
