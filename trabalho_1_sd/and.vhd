library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andOperation is
    Port (
        A   : in  STD_LOGIC_VECTOR(3 downto 0);
        B   : in  STD_LOGIC_VECTOR(3 downto 0);
        Y   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end andOperation;

architecture Behavioral of andOperation is
begin
    Y <= A and B;
end Behavioral;
