library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- ADDITION MODULE
entity addition is
    Port (
        A         : in  std_logic_vector(3 downto 0);
        B         : in  std_logic_vector(3 downto 0);
        Y         : out std_logic_vector(3 downto 0);
        carry_out : out std_logic;
        overflow  : out std_logic
    );
end addition;

architecture Behavioral of addition is
    signal A_signed, B_signed : signed(3 downto 0);
    signal SUM_signed         : signed(4 downto 0);
begin

    A_signed <= signed(A);
    B_signed <= signed(B);
    SUM_signed <= resize(A_signed, 5) + resize(B_signed, 5);

    Y <= std_logic_vector(SUM_signed(3 downto 0)); -- Output lower 4 bits
    carry_out <= SUM_signed(4); -- 5th bit is the carry out

    -- Overflow detection for 2's complement addition
    overflow <= (A_signed(3) and B_signed(3) and not SUM_signed(3)) or
                (not A_signed(3) and not B_signed(3) and SUM_signed(3));

end Behavioral;
