LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity cmp is
    port(
        CLK     : in std_logic;
        RST     : in std_logic;
        EN      : in std_logic;
        cmp1  : in std_logic_vector(1 downto 0);
        cmp2  : in std_logic_vector(1 downto 0);
        sig_out : out std_logic
    );
end entity;

architecture behavioral of cmp is
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            sig_out <= '0';
        elsif rising_edge(CLK) then
            if EN = '1' then
                if cmp1 = cmp2 then
                    sig_out <= '1';
                else
                    sig_out <= '0';
                end if;
            end if;
        end if;
    end process;
end behavioral;