-- Engineer: Artur, Micaela, Rafael
-- University: UFRJ
-- Project: EEL480 - Practical Assignment 1 (ULA with FSM)
-- Module: debouncer.vhd
-- Description:
--     This module removes bouncing effects from a mechanical button input.
--     When the button is pressed, it filters out the spurious transitions
--     (caused by mechanical contact instability) and produces a clean pulse.
--     The output is a single-cycle pulse (one clock tick) for each valid press.
--     This version assumes a 50 MHz clock and a debounce time of ~10ms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port (
        clk     : in  STD_LOGIC;   -- System clock (e.g., 50 MHz)
        btn_in  : in  STD_LOGIC;   -- Raw button input
        btn_out : out STD_LOGIC    -- Debounced, single-cycle pulse output
			);
end debouncer;

architecture Behavioral of debouncer is

    -- Constants
    constant DEBOUNCE_LIMIT : INTEGER := 500000;  -- ~10ms at 50MHz (50e6 * 0.01)

    -- Internal signals
    signal counter    : INTEGER range 0 to DEBOUNCE_LIMIT := 0;
    signal btn_sync_0 : STD_LOGIC := '0';
    signal btn_sync_1 : STD_LOGIC := '0';
    signal btn_last   : STD_LOGIC := '0';
    signal btn_pulse  : STD_LOGIC := '0';

begin

    -- Synchronize button signal to clock domain to avoid metastability
    process(clk)
    begin
        if rising_edge(clk) then
            btn_sync_0 <= btn_in;
            btn_sync_1 <= btn_sync_0;
        end if;
    end process;

    -- Debounce logic
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_sync_1 = btn_last then
                counter <= 0;  -- No change in state, reset counter
                btn_pulse <= '0';
            else
                counter <= counter + 1;
                if counter >= DEBOUNCE_LIMIT then
                    btn_last <= btn_sync_1;  -- Accept the new stable state
                    btn_pulse <= btn_sync_1; -- Generate a clean pulse
                    counter <= 0;            -- Reset counter
                else
                    btn_pulse <= '0'; -- Still bouncing, no pulse
                end if;
            end if;
        end if;
    end process;

    -- Output is a clean 1-clock-cycle pulse when button is pressed
    btn_out <= btn_pulse;

end Behavioral;