library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorOperation is
    Port (
        clk      : in  std_logic;
        button   : in  std_logic;
        switches : in  std_logic_vector(3 downto 0);
        leds     : out std_logic_vector(3 downto 0)
    );
end xorOperation;

architecture Behavioral of xorOperation is
    signal btn_prev : std_logic := '0';
    signal btn_edge : std_logic := '0';
    signal A, B     : std_logic_vector(3 downto 0) := (others => '0');
    signal loaded_A : boolean := false;

begin

    -- Button edge detection (single process implementation)

    process(clk)
    begin
        if rising_edge(clk) then
            -- Detect button press edge
            btn_edge <= button and not btn_prev;
            btn_prev <= button;

            -- Main operation logic

            if btn_edge = '1' then
                if not loaded_A then
                    A <= switches;
                    loaded_A <= true;

                else
                    B <= switches;
                    leds <= A xor B;  -- Perform XOR when both inputs are loaded
                    loaded_A <= false; -- Ready for new operation

                end if;
            end if;
        end if;
    end process;
end Behavioral;