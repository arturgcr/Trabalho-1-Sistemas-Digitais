library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparator is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit signed input A (2's complement)
        B : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit signed input B (2's complement)
        Y : out STD_LOGIC_VECTOR(3 downto 0)   -- 4-bit output:
                                               -- Y(0) = 1 if A < B
                                               -- Y(1) = 1 if A = B
                                               -- Y(2) = 1 if A > B
                                               -- Y(3) = unused (always 0)
    );
end Comparator;

architecture Behavioral of Comparator is
begin
    process(A, B)
        variable result : STD_LOGIC_VECTOR(3 downto 0);
    begin
        result := (others => '0');

        if signed(A) < signed(B) then
            result(0) := '1';  -- Set LSB if A < B
        elsif signed(A) = signed(B) then
            result(1) := '1';  -- Set bit 1 if A = B
        else
            result(2) := '1';  -- Set bit 2 if A > B
        end if;

        Y <= result;
    end process;
end Behavioral;
