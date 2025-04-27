library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity addition_tb is
-- no ports for a testbench
end addition_tb;

architecture Behavioral of addition_tb is

    -- Component declaration of the Unit Under Test (UUT)
    component addition is
        Port (
            A         : in  std_logic_vector(3 downto 0);
            B         : in  std_logic_vector(3 downto 0);
            Y         : out std_logic_vector(3 downto 0);
            carry_out : out std_logic;
            overflow  : out std_logic
        );
    end component;

    -- Signals to connect to UUT
    signal A, B       : std_logic_vector(3 downto 0) := (others => '0');
    signal Y          : std_logic_vector(3 downto 0);
    signal carry_out  : std_logic;
    signal overflow   : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: addition
        port map (
            A => A,
            B => B,
            Y => Y,
            carry_out => carry_out,
            overflow => overflow
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 0 + 0
        A <= "0000"; B <= "0000";
        wait for 10 ns;

        -- Test 3 + 2 = 5
        A <= "0011"; B <= "0010";
        wait for 10 ns;

        -- Test -3 + -2
        A <= "1101"; B <= "1110";  -- -3 and -2 in 2's complement
        wait for 10 ns;

        -- Test 7 + 1 (overflow expected)
        A <= "0111"; B <= "0001";
        wait for 10 ns;

        -- Test -8 + -1 (overflow expected)
        A <= "1000"; B <= "1111";
        wait for 10 ns;

        -- Test 5 + (-5) = 0
        A <= "0101"; B <= "1011";
        wait for 10 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
