library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Comparator is
end tb_Comparator;

architecture sim of tb_Comparator is
    -- Component declaration
    component Comparator is
        Port (
            A : in  STD_LOGIC_VECTOR(3 downto 0);
            B : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals to connect to the DUT (Device Under Test)
    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal B : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate the Comparator
    uut: Comparator port map (
        A => A,
        B => B,
        Y => Y
    );

    -- Test process
    stim_proc: process
    begin
        -- Test Case 1: A < B  (-3 < 1)
        A <= std_logic_vector(to_signed(-3, 4));
        B <= std_logic_vector(to_signed(1, 4));
        wait for 10 ns;

        -- Test Case 2: A = B (2 = 2)
        A <= std_logic_vector(to_signed(2, 4));
        B <= std_logic_vector(to_signed(2, 4));
        wait for 10 ns;

        -- Test Case 3: A > B (3 > -1)
        A <= std_logic_vector(to_signed(3, 4));
        B <= std_logic_vector(to_signed(-1, 4));
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end sim;
