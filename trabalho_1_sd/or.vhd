library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- OR OPERATION MODULE
entity orOperation is
    Port (
        A   : in  STD_LOGIC_VECTOR(3 downto 0);
        B   : in  STD_LOGIC_VECTOR(3 downto 0);
        Y   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end orOperation;

architecture Behavioral of orOperation is
    signal result : STD_LOGIC_VECTOR(3 downto 0);
begin

    Y <= A or B;

end Behavioral;
