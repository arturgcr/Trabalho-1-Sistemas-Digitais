library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity subtraction is
    Port (
        A         : in  std_logic_vector(3 downto 0);
        B         : in  std_logic_vector(3 downto 0);
        Y         : out std_logic_vector(3 downto 0);
        borrow_out : out std_logic;
        overflow   : out std_logic
    );
end subtraction;

architecture Behavioral of subtraction is	 
    signal A_signed, B_signed        : signed(3 downto 0) := (others => '0');
    signal difference  : signed(4 downto 0) := (others => '0');  -- 5-bit difference for borrow

begin
	A_signed <= signed(A);
   B_signed <= signed(B);
   -- Perform subtraction: A - B
	difference <= resize(A_signed, 5) - resize(B_signed, 5);
	Y <= std_logic_vector(difference(3 downto 0));
	borrow_out <= difference(4); 

	-- Overflow detection for signed subtraction
	overflow <= (A_signed(3) and not B_signed(3) and not difference(3)) or
					(not A_signed(3) and B_signed(3) and difference(3));
end Behavioral;