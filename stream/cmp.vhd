library IEEE;
use IEEE.std_logic_1164.all;

entity cmp is
port (
    CLK : in std_logic;
    RST : in std_logic;
    cmp1 : in std_logic;
    cmp2 : in std_logic;
    DOUT : out std_logic );
end cmp;

architecture behav of cmp is
begin
    process (CLK, RST)
    begin
        if (RST = '1') then
            DOUT <= '0';
        elsif rising_edge(CLK) then
            if cmp1 = cmp2 then
                DOUT <= '1';
            else
                DOUT <= '0';
            end if;
        end if;
    end process;
end behav;