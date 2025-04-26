library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity addition is
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;  -- will now trigger state transition, not async
        button     : in  std_logic;
        switches   : in  std_logic_vector(3 downto 0);
        leds       : out std_logic_vector(3 downto 0);
        carry_out  : out std_logic;
        overflow   : out std_logic;
        state_out  : out std_logic_vector(1 downto 0)
    );
end addition;

architecture Behavioral of addition is
    type state_type is (RESET_STATE, IDLE, LOAD_A, LOAD_B, SHOW_RESULT);
    signal state       : state_type := RESET_STATE;
    signal btn_prev    : std_logic := '0';
    signal btn_edge    : std_logic := '0';

    signal A, B        : signed(3 downto 0) := (others => '0');
    signal sum         : signed(4 downto 0) := (others => '0');  -- 5-bit sum for carry
	 signal leds_int      : std_logic_vector(3 downto 0) := (others => '0');
	 signal carry_out_int : std_logic := '0';
	 signal overflow_int  : std_logic := '0';
	 signal state_out_int : std_logic_vector(1 downto 0) := (others => '0');
begin
    -- Button edge detection
    process(clk)
    begin
        if rising_edge(clk) then
            btn_edge <= button and not btn_prev;
            btn_prev <= button;
        end if;
    end process;

    -- FSM process, reset becomes a state
    process(clk)
    begin
		  if state = RESET_STATE then
				A          <= (others => '0');
				B          <= (others => '0');
				sum        <= (others => '0');
				leds       <= (others => '0');
				carry_out  <= '0';
				overflow   <= '0';
				state_out  <= "00";
				state      <= IDLE;
		  end if;	
        if rising_edge(clk) then
            -- Check for synchronous reset
            if reset = '1' then
                state <= RESET_STATE;
            else
						case state is
                    when IDLE =>
                        if btn_edge = '1' then
                            A     <= signed(switches);
                            state <= LOAD_B;
                            state_out <= "01";
                        end if;

                    when LOAD_B =>
                        if btn_edge = '1' then
                            B     <= signed(switches);
                            state <= SHOW_RESULT;
                            state_out <= "10";
                        end if;
                    when SHOW_RESULT =>
                        -- Optional: use variable here to avoid delay
                        sum <= resize(A, 5) + resize(B, 5);
                        leds <= std_logic_vector(sum(3 downto 0));
                        carry_out <= sum(4);
                        overflow <= (A(3) and B(3) and not sum(3)) or
                                    (not A(3) and not B(3) and sum(3));
                    when others =>
                        state <= RESET_STATE;
                        state_out <= "00";
                end case;
            end if;
        end if;
    end process;

end Behavioral;
