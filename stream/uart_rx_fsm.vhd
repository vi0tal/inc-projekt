-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
       CLK : in std_logic;
       RST : in std_logic;
       A : in std_logic;
       B : in std_logic;
       C : in std_logic;
       D : out std_logic;
       E : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    type state_type is (XD, XDDD, XXXXDDDD);
    signal cur_state : state_type;
    signal next_state : state_type;
begin
    proc_cstate : process (CLK, RST, next_state)
    begin
        if RST = '1' then
            cur_state <= XD;
        elsif rising_edge(CLK) then
            cur_state <= next_state;
        end if;
    end process proc_cstate;
    
    output_logic : process (cur_state)
    begin
        D <= '0';
        E <= '0';
        case cur_state is
            when XD =>
                D <= '0';
                E <= '0';
            when XDDD =>
                D <= '1';
                E <= '0';
            when XXXXDDDD =>
                D <= '0';
                E <= '1';
            when others =>
                null;
        end case;
    end process output_logic;
    
    nstate_logic : process (cur_state, A, B, C)
    begin
        next_state <= cur_state;
        case cur_state is
            when XD =>
                if A = '1' then
                    next_state <= XDDD;
                end if;
            when XDDD =>
                if B = '1' then
                    next_state <= XXXXDDDD;
                end if;
            when XXXXDDDD =>
                if C = '1' then
                    next_state <= XD;
                end if;
            when others =>
                null;
        end case;
    end process nstate_logic;
end architecture;
