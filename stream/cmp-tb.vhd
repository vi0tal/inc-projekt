LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UART_RX_FSM IS
END UART_RX_FSM;
 
ARCHITECTURE behavior OF UART_RX_FSM IS 
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal test_cmp1 : std_logic := '0';
   signal test_cmp2 : std_logic := '0';
   signal running : boolean := true;

 	--Outputs
    signal test_out :  std_logic := '0';

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    UUT: ENTITY work.cmp PORT MAP (
        CLK => clk,
        RST => rst,
        cmp1 => test_cmp1,
        cmp2 => test_cmp2,
        DOUT => test_out
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
    wait for 5 ns;
    
    assert test_out = '0' report "0 == 0  -> 1" severity ERROR;

    wait for 5 ns;
    test_cmp1 <= '1';
    

    running <= false;
    wait;
   end process;

END;