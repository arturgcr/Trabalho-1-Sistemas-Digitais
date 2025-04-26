library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity subtractor is
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
end subtractor;

architecture Behavioral of subtractor is
    type state_type is (RESET_STATE, IDLE, LOAD_A, LOAD_B, SHOW_RESULT);
    
    signal state       : state_type := RESET_STATE;
    signal btn_prev    : std_logic := '0';
    signal btn_edge    : std_logic := '0';

    signal A, B        : signed(3 downto 0) := (others => '0');
    signal sum         : signed(4 downto 0) := (others => '0');  -- 5-bit sum for carry

    -- Initialized output signals
    signal leds_int       : std_logic_vector(3 downto 0) := (others => '0');
    signal carry_out_int  : std_logic := '0';
    signal overflow_int   : std_logic := '0';
    signal state_out_int  : std_logic_vector(1 downto 0) := "00";
    
begin

    -- Map internal signals to output ports
    leds      <= leds_int;
    carry_out <= carry_out_int;
    overflow  <= overflow_int;
    state_out <= state_out_int;

    -- Button edge detection
    process(clk)
    begin
        if rising_edge(clk) then
            btn_edge <= button and not btn_prev;
            btn_prev <= button;
        end if;
    end process;

    -- FSM process
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- synchronous reset block
                A             <= (others => '0');
                B             <= (others => '0');
                sum           <= (others => '0');
                leds_int      <= (others => '0');
                carry_out_int <= '0';
                overflow_int  <= '0';
                state_out_int <= "00";
                state         <= IDLE;
            else
                case state is
                    when IDLE =>
                        if btn_edge = '1' then
                            A     <= signed(switches);
                            state <= LOAD_B;
                            state_out_int <= "01";
                        end if;

                    when LOAD_B =>
                        if btn_edge = '1' then
                            B     <= signed(switches);
                            state <= SHOW_RESULT;
                            state_out_int <= "10";
                        end if;

                    when SHOW_RESULT =>
                        sum <= resize(A, 5) + resize(B, 5);
                        leds_int <= std_logic_vector(sum(3 downto 0));
                        carry_out_int <= sum(4);
                        overflow_int <= (A(3) and B(3) and not sum(3)) or
                                        (not A(3) and not B(3) and sum(3));

                    when others =>
                        state <= RESET_STATE;
                        state_out_int <= "00";
                end case;
            end if;
        end if;
    end process;

end Behavioral;
