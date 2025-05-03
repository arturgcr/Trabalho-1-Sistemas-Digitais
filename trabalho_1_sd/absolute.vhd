library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;       
use IEEE.STD_LOGIC_UNSIGNED.ALL;    

entity absolute is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);  -- input in two's complement
        Y : out STD_LOGIC_VECTOR(3 downto 0)   -- output: absolute value
    );
end absolute;

architecture Behavioral of absolute is
begin
    process(A)
        variable temp : STD_LOGIC_VECTOR(3 downto 0);
    begin
        if A(3) = '0' then
            -- A is positive
            temp := A;
        else
            -- A is negative: absolute = NOT A + 1
            temp := (NOT A) + "0001";
        end if;

        Y <= temp;
    end process;

end Behavioral;