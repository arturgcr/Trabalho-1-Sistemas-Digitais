library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main_tb is
end Main_tb;

architecture Behavioral of Main_tb is
    -- Signals to connect to the DUT (Device Under Test)
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal button     : std_logic := '0';
    signal switches   : std_logic_vector(3 downto 0) := (others => '0');
    signal Y          : std_logic_vector(3 downto 0);
    signal carry_out  : std_logic;
    signal overflow   : std_logic;

    -- Signals for the operation codes and operands
    signal op_code    : std_logic_vector(3 downto 0) := (others => '0');
    signal operand_A  : std_logic_vector(3 downto 0) := (others => '0');
    signal operand_B  : std_logic_vector(3 downto 0) := (others => '0');

    -- Clock period constant
    constant CLK_PERIOD : time := 20 ns;
	 constant WAIT_TIME : time :=15 ms;

    -- Procedure to load operation and operands
    procedure load_and_execute(signal button : inout std_logic;
                           signal switches : inout std_logic_vector(3 downto 0);
                           signal operation_code : in std_logic_vector(3 downto 0);
                           signal operand_A : in std_logic_vector(3 downto 0);
                           signal operand_B : in std_logic_vector(3 downto 0);
                           signal reset : inout std_logic) is
		begin
			 -- Load operation code
			 switches <= operation_code;
			 wait for WAIT_TIME;
			 button <= '1';
			 wait for WAIT_TIME;
			 button <= '0';
			 wait for WAIT_TIME;

			 -- Load operand A
			 switches <= operand_A;
			 wait for WAIT_TIME;
			 button <= '1';
			 wait for WAIT_TIME;
			 button <= '0';
			 wait for WAIT_TIME;

			 -- Load operand B only if operation_code is not "0100" or "1100"
			 if (operation_code /= "0100") and (operation_code /= "1100") then
				  switches <= operand_B;
				  wait for WAIT_TIME;
				  button <= '1';
				  wait for WAIT_TIME;
				  button <= '0';
				  wait for WAIT_TIME;
			 end if;
			 
			 wait for 2*WAIT_TIME;  -- Wait for result
			 
			 reset <= '1';
			 wait for WAIT_TIME;
			 reset <= '0';
			 wait for WAIT_TIME;
		end procedure;


begin
    -- Instantiate the DUT
    uut: entity work.Main
        port map (
            clk        => clk,
            reset      => reset,
            button     => button,
            switches   => switches,
            Y          => Y,
            carry_out  => carry_out,
            overflow   => overflow
        );

    -- Clock process
    clk_process :process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        reset <= '1';
        wait for WAIT_TIME;
        reset <= '0';
        wait for WAIT_TIME;

        -- Prepare signals for AND operation
        op_code <= "0011";  -- AND operation code
        operand_A <= "1010";
        operand_B <= "1100";
        wait for WAIT_TIME;
        -- Execute AND operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);

        op_code <= "0110";  -- OR operation code
        operand_A <= "0101";
        operand_B <= "0011";
        wait for WAIT_TIME;  
        -- Execute OR operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);

        op_code <= "0000";  -- ADD operation code
        operand_A <= "0101";
        operand_B <= "1101";
        wait for WAIT_TIME;
        -- Execute ADD operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);

        op_code <= "1100";  -- Absolute operation code
        operand_A <= "1100";  -- Negative value for absolute
        operand_B <= "0000";  -- Not used for this operation
        wait for WAIT_TIME;
        -- Execute ABS operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);
		  
        op_code <= "0101";  -- SHIFT operation code
        operand_A <= "1001";  -- Operand to be shifted
        operand_B <= "0001";  -- Shift count (1 bit shift)
        wait for WAIT_TIME;
        -- Execute SHIFT operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);
		  
		  op_code <= "0111";  -- XOR operation code
        operand_A <= "1001";
        operand_B <= "0001"; 
        wait for WAIT_TIME;
        -- Execute XOR operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);
		  
		  op_code <= "0001";  -- subtraction operation code
        operand_A <= "1101";
        operand_B <= "1011"; 
        wait for WAIT_TIME;
        -- Execute subtraction operation
        load_and_execute(button, switches, op_code, operand_A, operand_B, reset);

        -- End simulation
        wait;
    end process;

end Behavioral;
