library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_debouncer is
-- No ports needed for a testbench
end tb_debouncer;

architecture Behavioral of tb_debouncer is

    -- Component declaration for the Unit Under Test (UUT)
    component debouncer
        Port (
            clk     : in  STD_LOGIC;
            btn_in  : in  STD_LOGIC;
            btn_out : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal clk_tb     : STD_LOGIC := '0';
    signal btn_in_tb  : STD_LOGIC := '0';
    signal btn_out_tb : STD_LOGIC;

begin

    -- Instantiate the debouncer
    uut: debouncer
        port map (
            clk     => clk_tb,
            btn_in  => btn_in_tb,
            btn_out => btn_out_tb
        );

    -- Clock generation process: 50MHz clock (20 ns period)
    clk_process : process
    begin
        clk_tb <= '0';
        wait for 10 ns;
        clk_tb <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process: simulate button presses with bounce
    stimulus: process
    begin
        wait for 100 ns;

        -- Simulate bouncing on button press
        btn_in_tb <= '1';
        wait for 2 ms;
        btn_in_tb <= '0';
        wait for 1 ms;
        btn_in_tb <= '1';
        wait for 1 ms;
        btn_in_tb <= '0';
        wait for 5 ms;
        btn_in_tb <= '1'; -- Finally stable press
        wait for 20 ms;   -- Pressed long enough to be detected

        -- Release button with some bounce
        btn_in_tb <= '0';
        wait for 2 ms;
        btn_in_tb <= '1';
        wait for 1 ms;
        btn_in_tb <= '0';
        wait for 1 ms;
        btn_in_tb <= '1';
        wait for 1 ms;
        btn_in_tb <= '0'; -- Finally stable release
        wait for 20 ms;

        -- End simulation
        wait;
    end process;

end Behavioral;
