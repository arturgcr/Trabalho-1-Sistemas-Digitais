library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        button   : in  std_logic;
        switches : in  std_logic_vector(3 downto 0);
        Y        : out std_logic_vector(3 downto 0);
        carry_out : out std_logic;
        overflow  : out std_logic
    );
end Main;

architecture Behavioral of Main is
    type state_type is (RESET_STATE, LOAD_OPERATION, LOAD_A, LOAD_B, SHOW_RESULTS);

    signal state        : state_type := RESET_STATE;
    signal btn_prev     : std_logic := '0';
    signal btn_edge     : std_logic := '0';

    signal operation    : std_logic_vector(3 downto 0) := (others => '0');
    signal A, B         : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs as internal signals
    signal Y_reg        : std_logic_vector(3 downto 0) := (others => '0');
    signal carry_out_reg: std_logic := '0';
    signal overflow_reg : std_logic := '0';

    -- Signals to connect modules
    signal add_Y        : std_logic_vector(3 downto 0);
    signal and_Y        : std_logic_vector(3 downto 0);
    signal or_Y         : std_logic_vector(3 downto 0);
    signal add_carry_out: std_logic;
    signal add_overflow : std_logic;
	 signal absolute_Y : std_logic_vector(3 downto 0);
	 signal shift_Y : std_logic_vector(3 downto 0);

begin

    Y         <= Y_reg;
    carry_out <= carry_out_reg;
    overflow  <= overflow_reg;

    add_inst : entity work.addition
        port map (
            A => A,
            B => B,
            Y => add_Y,
            carry_out => add_carry_out,
            overflow  => add_overflow
        );

    and_inst : entity work.andOperation
        port map (
            A => A,
            B => B,
            Y => and_Y
        );

    or_inst : entity work.orOperation
        port map (
            A => A,
            B => B,
            Y => or_Y
        );
	
	 absolute_inst : entity work.absolute
		  port map (
				A => A,
				Y => absolute_Y
		  );
		  
	 shift_inst : entity work.shift
    port map (
        clk => clk,
        A   => A,
        B   => B, 
        Y   => shift_Y
    );

    -- Button edge detection
    process(clk)
    begin
        if rising_edge(clk) then
            btn_edge <= button and not btn_prev;
            btn_prev <= button;
        end if;
    end process;

    -- State Transition Logic
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Immediate reset: clear everything
                state         <= RESET_STATE;
                A             <= (others => '0');
                B             <= (others => '0');
                operation     <= (others => '0');
                Y_reg         <= (others => '0');
                carry_out_reg <= '0';
                overflow_reg  <= '0';
            else
                case state is
                    when RESET_STATE =>
                        state <= LOAD_OPERATION;

                    when LOAD_OPERATION =>
                        if btn_edge = '1' then
                            operation <= switches;
                            state <= LOAD_A;
                        end if;

                    when LOAD_A =>
							 if btn_edge = '1' then
								  A <= switches;
								  case operation is
										when "0001" | "0010" | "0011" | "0101" =>
											 state <= LOAD_B;         -- These need two operands
										when "0100" =>
											 state <= SHOW_RESULTS;   -- Single operand operations
										when others =>
											 state <= RESET_STATE;
								  end case;
							 end if;

                    when LOAD_B =>
                        if btn_edge = '1' then
                            B <= switches;
                            state <= SHOW_RESULTS;
                        end if;

							when SHOW_RESULTS =>
							  case operation is
									when "0001" => -- AND
										 Y_reg <= and_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0010" => -- OR
										 Y_reg <= or_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0011" => -- ADD
										 Y_reg <= add_Y;
										 carry_out_reg <= add_carry_out;
										 overflow_reg <= add_overflow;
									when "0100" => -- absolute
										 Y_reg <= absolute_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0101" => -- Shift
										Y_reg <= shift_Y;
										carry_out_reg <= '0';
										overflow_reg <= '0';
									when others =>
										 Y_reg <= (others => '0');
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
							  end case;

                    when others =>
                        state <= RESET_STATE;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
