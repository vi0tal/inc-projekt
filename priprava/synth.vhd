library ieee;
use ieee.std_logic_1164.all;
entity cmp is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    EN: in std_logic;
    cmp1: in std_logic_vector (1 downto 0);
    cmp2: in std_logic_vector (1 downto 0);
    sig_out: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of cmp is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_EN: std_logic;
  subtype typwrap_cmp1 is std_logic_vector (1 downto 0);
  signal wrap_cmp1: typwrap_cmp1;
  subtype typwrap_cmp2 is std_logic_vector (1 downto 0);
  signal wrap_cmp2: typwrap_cmp2;
  signal wrap_sig_out: std_logic;
  signal n4_o : std_logic;
  signal n7_o : std_logic;
  signal n13_o : std_logic;
  signal n14_q : std_logic;
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_en <= en;
  wrap_cmp1 <= cmp1;
  wrap_cmp2 <= cmp2;
  sig_out <= wrap_sig_out;
  wrap_sig_out <= n14_q;
  -- cmp.vhd:23:25
  n4_o <= '1' when wrap_cmp1 = wrap_cmp2 else '0';
  -- cmp.vhd:23:17
  n7_o <= '0' when n4_o = '0' else '1';
  -- cmp.vhd:21:9
  n13_o <= n14_q when wrap_EN = '0' else n7_o;
  -- cmp.vhd:21:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n14_q <= '0';
    elsif rising_edge (wrap_CLK) then
      n14_q <= n13_o;
    end if;
  end process;
end rtl;
