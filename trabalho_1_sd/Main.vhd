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

    signal operation    : std_logic_vector(3 downto 0) := (others => '1');
    signal A, B         : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs as internal signals
    signal Y_reg        : std_logic_vector(3 downto 0) := (others => '0');
    signal carry_out_reg: std_logic := '0';
    signal overflow_reg : std_logic := '0';

    -- Signals to connect modules
    signal add_Y        : std_logic_vector(3 downto 0);
	 signal subtract_Y        : std_logic_vector(3 downto 0);
    signal and_Y        : std_logic_vector(3 downto 0);
    signal or_Y         : std_logic_vector(3 downto 0);
    signal add_carry_out: std_logic;
    signal add_overflow : std_logic;
	 signal subtract_borrow_out: std_logic;
    signal subtract_overflow : std_logic;
	 signal absolute_Y : std_logic_vector(3 downto 0);
	 signal shift_Y : std_logic_vector(3 downto 0);
	 signal xor_Y         : std_logic_vector(3 downto 0);
	 signal debounced_btn : STD_LOGIC;
	 signal debounced_reset : STD_LOGIC;

begin

    Y         <= Y_reg;
    carry_out <= carry_out_reg;
    overflow  <= overflow_reg;
	
	 debouncer_btn_inst : entity work.debouncer
        port map (
            clk     => clk,
            btn_in  => button,
            btn_out => debounced_btn
        );
		  
	 debouncer_reset_inst : entity work.debouncer
	  port map (
			clk     => clk,
			btn_in  => reset,
			btn_out => debounced_reset
	  );
		
    add_inst : entity work.addition
        port map (
            A => A,
            B => B,
            Y => add_Y,
            carry_out => add_carry_out,
            overflow  => add_overflow
        );
		  
	 subtract_inst : entity work.subtraction
        port map (
            A => A,
            B => B,
            Y => subtract_Y,
            borrow_out => subtract_borrow_out,
            overflow  => subtract_overflow
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
	 
	 xor_inst : entity work.xorOperation
    port map (
        A   => A,
        B   => B, 
        Y   => xor_Y
    );

    -- State Transition Logic
    process(clk)
    begin
        if rising_edge(clk) then
            if debounced_reset = '1' then
                state         <= RESET_STATE;
                A             <= (others => '0');
                B             <= (others => '0');
                operation     <= (others => '1');
                Y_reg         <= (others => '0');
                carry_out_reg <= '0';
                overflow_reg  <= '0';
            else
                case state is
                    when RESET_STATE =>
                        state <= LOAD_OPERATION;

                    when LOAD_OPERATION =>
                        if debounced_btn = '1' then
                            operation <= switches;
                            state <= LOAD_A;
                        end if;

                    when LOAD_A =>
							 if debounced_btn = '1' then
								  A <= switches;
								  case operation is
										when "0000" | "0001" | "0011" | "0010" | "0110" | "0111" | "0101"  =>
											 state <= LOAD_B;         -- These need two operands
										when "0100" | "1100" =>
											 state <= SHOW_RESULTS;   -- Single operand operations
										when others =>
											 state <= RESET_STATE;
								  end case;
							 end if;

                    when LOAD_B =>
                        if debounced_btn = '1' then
                            B <= switches;
                            state <= SHOW_RESULTS;
                        end if;

							when SHOW_RESULTS =>
							  case operation is
								  when "0000" => -- ADD
										 Y_reg <= add_Y;
										 carry_out_reg <= add_carry_out;
										 overflow_reg <= add_overflow;
									when "0001" => -- SUBTRACT
										 Y_reg <= subtract_Y;
										 carry_out_reg <= subtract_borrow_out;
										 overflow_reg <= subtract_overflow;
									when "0011" => -- AND
										 Y_reg <= and_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0110" => -- OR
										 Y_reg <= or_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0111" => -- XOR
										 Y_reg <= xor_Y;
										 carry_out_reg <= '0';
										 overflow_reg <= '0';
									when "0101" => -- Shift
										Y_reg <= shift_Y;
										carry_out_reg <= '0';
										overflow_reg <= '0';
									when "1100" => -- absolute
										 Y_reg <= absolute_Y;
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
