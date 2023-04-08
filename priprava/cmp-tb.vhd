LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY cmp_tb IS
END cmp_tb;
 
ARCHITECTURE behavior OF cmp_tb IS 
   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';
   signal EN : std_logic := '0';
   signal cmp1 : std_logic_vector(1 downto 0) := (others => '0');
   signal cmp2 : std_logic_vector(1 downto 0) := (others => '0');
   signal running : boolean := true;

 	--Outputs
    signal test_out : std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   UUT: ENTITY work.cmp PORT MAP (
            CLK => CLK,
            RST => RST,
            EN => EN,
            cmp1 => cmp1,
            cmp2 => cmp2,
            sig_out => test_out
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
    -- hold reset state for 100 ns.
    wait for 100 ns;	
    RST <= '0';
    EN <= '1';

    wait for 10 ns;

    --assert test_out = '0';
    
    running <= false;
    wait;
   end process;

END;
