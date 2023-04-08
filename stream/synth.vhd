library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UART_RX_FSM is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: out std_logic;
    E: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of uart_rx_fsm is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_A: std_logic;
  signal wrap_B: std_logic;
  signal wrap_C: std_logic;
  signal wrap_D: std_logic;
  signal wrap_E: std_logic;
  signal cur_state : std_logic_vector (1 downto 0);
  signal next_state : std_logic_vector (1 downto 0);
  signal n8_q : std_logic_vector (1 downto 0);
  signal n11_o : std_logic;
  signal n13_o : std_logic;
  signal n15_o : std_logic;
  signal n16_o : std_logic_vector (2 downto 0);
  signal n21_o : std_logic;
  signal n27_o : std_logic;
  signal n32_o : std_logic_vector (1 downto 0);
  signal n34_o : std_logic;
  signal n36_o : std_logic_vector (1 downto 0);
  signal n38_o : std_logic;
  signal n40_o : std_logic_vector (1 downto 0);
  signal n42_o : std_logic;
  signal n43_o : std_logic_vector (2 downto 0);
  signal n44_o : std_logic_vector (1 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_a <= a;
  wrap_b <= b;
  wrap_c <= c;
  d <= wrap_d;
  e <= wrap_e;
  wrap_D <= n21_o;
  wrap_E <= n27_o;
  -- uart_rx_fsm.vhd:26:12
  cur_state <= n8_q; -- (signal)
  -- uart_rx_fsm.vhd:27:12
  next_state <= n44_o; -- (signal)
  -- uart_rx_fsm.vhd:33:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n8_q <= "00";
    elsif rising_edge (wrap_CLK) then
      n8_q <= next_state;
    end if;
  end process;
  -- uart_rx_fsm.vhd:43:13
  n11_o <= '1' when cur_state = "00" else '0';
  -- uart_rx_fsm.vhd:46:13
  n13_o <= '1' when cur_state = "01" else '0';
  -- uart_rx_fsm.vhd:49:13
  n15_o <= '1' when cur_state = "10" else '0';
  n16_o <= n15_o & n13_o & n11_o;
  -- uart_rx_fsm.vhd:42:9
  with n16_o select n21_o <=
    '0' when "100",
    '1' when "010",
    '0' when "001",
    '0' when others;
  -- uart_rx_fsm.vhd:42:9
  with n16_o select n27_o <=
    '1' when "100",
    '0' when "010",
    '0' when "001",
    '0' when others;
  -- uart_rx_fsm.vhd:62:17
  n32_o <= cur_state when wrap_A = '0' else "01";
  -- uart_rx_fsm.vhd:61:13
  n34_o <= '1' when cur_state = "00" else '0';
  -- uart_rx_fsm.vhd:66:17
  n36_o <= cur_state when wrap_B = '0' else "10";
  -- uart_rx_fsm.vhd:65:13
  n38_o <= '1' when cur_state = "01" else '0';
  -- uart_rx_fsm.vhd:70:17
  n40_o <= cur_state when wrap_C = '0' else "00";
  -- uart_rx_fsm.vhd:69:13
  n42_o <= '1' when cur_state = "10" else '0';
  n43_o <= n42_o & n38_o & n34_o;
  -- uart_rx_fsm.vhd:60:9
  with n43_o select n44_o <=
    n40_o when "100",
    n36_o when "010",
    n32_o when "001",
    cur_state when others;
end rtl;
