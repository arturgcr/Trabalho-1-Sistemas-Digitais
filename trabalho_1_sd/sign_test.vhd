library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_sign is
end tb_sign;

architecture behavior of tb_sign is

    -- Component Declaration
    component sign
        Port (
            A : in  std_logic_vector(3 downto 0);
            Y     : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal Y     : std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: sign
        Port map (
            A => A,
            Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Wait some time to initialize
        wait for 10 ns;

        -- Test case 1: Zero
        A <= "0000";
        wait for 10 ns;

        -- Test case 2: Positive number (e.g., 0010 = 2)
        A <= "0010";
        wait for 10 ns;

        -- Test case 3: Positive number (e.g., 0111 = 7)
        A <= "0111";
        wait for 10 ns;


        -- Test case 5: Negative number (e.g., 1111 = -1)
        A <= "1111";
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end behavior;
