library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_subtraction is
-- No ports for a testbench
end tb_subtraction;

architecture behavior of tb_subtraction is

    -- Component Declaration
    component subtraction
        Port (
            A          : in  std_logic_vector(3 downto 0);
            B          : in  std_logic_vector(3 downto 0);
            Y          : out std_logic_vector(3 downto 0);
            borrow_out : out std_logic;
            overflow   : out std_logic
        );
    end component;

    -- Signals to connect to UUT
    signal A          : std_logic_vector(3 downto 0) := (others => '0');
    signal B          : std_logic_vector(3 downto 0) := (others => '0');
    signal Y          : std_logic_vector(3 downto 0);
    signal borrow_out : std_logic;
    signal overflow   : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: subtraction
        port map (
            A          => A,
            B          => B,
            Y          => Y,
            borrow_out => borrow_out,
            overflow   => overflow
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: 5 - 3 = 2
        A <= "0101"; -- 5
        B <= "0011"; -- 3
        wait for 10 ns;

        -- Test case 2: 3 - 5 = -2 (check for borrow/overflow)
        A <= "0011"; -- 3
        B <= "0101"; -- 5
        wait for 10 ns;

        -- Test case 3: 7 - 7 = 0
        A <= "0111"; -- 7
        B <= "0111"; -- 7
        wait for 10 ns;

        -- Test case 5: -3 - (-5) = 2
        A <= "1101"; -- -3
        B <= "1011"; -- -5
        wait for 10 ns;

        -- Test case 6: 0 - 0 = 0
        A <= "0000";
        B <= "0000";
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end behavior;