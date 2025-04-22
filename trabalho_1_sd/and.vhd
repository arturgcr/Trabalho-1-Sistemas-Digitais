library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and4bit is
    Port (
        clk : in  STD_LOGIC;
        EN  : in  STD_LOGIC;
        A   : in  STD_LOGIC_VECTOR(3 downto 0);
        B   : in  STD_LOGIC_VECTOR(3 downto 0);
        Y   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end and4bit;

architecture Behavioral of and4bit is
    signal result : STD_LOGIC_VECTOR(3 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if EN = '1' then
                result <= A and B;
            end if;
        end if;
    end process;

    Y <= result;

end Behavioral;
