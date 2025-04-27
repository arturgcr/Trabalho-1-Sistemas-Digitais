library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;  -- synchronous reset
        button   : in  std_logic;
        switches : in  std_logic_vector(3 downto 0);
        leds     : out std_logic_vector(3 downto 0)  -- [0]=zero, [1]=positive, [2]=negative
    );
end sign;

architecture Behavioral of sign is
    signal btn_prev : std_logic := '0';
    signal btn_edge : std_logic := '0';
    signal number   : signed(3 downto 0) := (others => '0');
	 
begin
    -- Button edge detection
    process(clk)
    begin
        if rising_edge(clk) then
            btn_edge <= button and not btn_prev;
            btn_prev <= button;
        end if;
    end process;

    -- Main process

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                number <= (others => '0');
                leds <= (others => '0');

            elsif btn_edge = '1' then
                -- Capture input on button press
                number <= signed(switches);

                -- Check number properties
                leds(0) <= '1' when switches = "0000" else '0';  -- Zero
                leds(1) <= '1' when switches(3) = '0' and switches /= "0000" else '0';  -- Positive
                leds(2) <= switches(3) and not leds(0);  -- Negative (MSB set and not zero)
                leds(3) <= '0';  -- Unused
            end if;
        end if;
    end process;
end Behavioral;