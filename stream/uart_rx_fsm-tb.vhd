LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UART_RX_FSM_TB IS
END UART_RX_FSM_TB;
 
ARCHITECTURE behavior OF UART_RX_FSM_TB IS 
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal running : boolean := true;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    UUT: ENTITY work.UART_RX_FSM PORT MAP (
        CLK => clk,
        RST => rst,
        A => A,
        B => B,
        C => C,
        D => D,
        E => E
    );
 
    -- Clock generator
    clk_process: process
    begin
        while running loop
            wait for 2 ns;
            clk <= not clk;
        end loop;
        wait;
    end process;

   -- Stimulus process
   stim_proc: process
   begin		
    wait for 100 ns;
    rst <='0';

    assert D='0' report "s1";
    assert E='0' report "s2";
    wait for 5 ns;
    A <= '1';
    wait for 5 ns;
    assert D='1' report "s3";
    assert E='0' report "s4";

    wait for 5 ns;

    B <= '1';
    wait for 5 ns;
    assert D='0' report "s5";
    assert E='1' report "s6";

    wait for 5 ns;

    C <= '1';
    wait for 5 ns;
    assert D='0' report "s7";
    assert E='0' report "s8";

    running <= false;
    wait;
   end process;

END;