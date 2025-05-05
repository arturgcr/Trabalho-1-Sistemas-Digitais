library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign is
    Port (
        A : in  std_logic_vector(3 downto 0);
        Y     : out std_logic_vector(3 downto 0)  -- [0]=zero, [1]=positive, [2]=negative
    );
end sign;

architecture Behavioral of sign is
	 signal led0   : std_logic;
	 
begin
	 led0 <= '1' when A = "0000" else '0';  -- Zero
	 Y(0) <= led0;
	 Y(1) <= '1' when A(3) = '0' and A /= "0000" else '0';  -- Positive
	 Y(2) <= A(3) and not led0;  -- Negative (MSB set and not zero)
	 Y(3) <= '0';  -- Unused
end Behavioral;