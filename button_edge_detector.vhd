library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity button_edge_detector is
    port(
        clock : in std_logic;
        button_in : in std_logic;
        button_out : out std_logic
    );
end entity;

architecture behav of button_edge_detector is
    type state_type is (q0, q1, q2);
    signal state : state_type;

    begin
        process(clock, state)
        begin
            if rising_edge(clock) then
                case state is
                    --implementação com button_in sendo active low
                    when q0 =>
                        if button_in = '0' then
                            state <= q1;
                        else
                            state <= q0;
                        end if;
                    
                    when q1 =>
                        state <= q2;

                    when q2 =>
                        if button_in = '1' then
                            state <= q0;
                        else
                            state <= q2;
                        end if;

                    when others =>
                        state <= q0;
                end case;
            end if;
        end process;

    with state select button_out <=
        '1' when q1,
        '0' when others;
end architecture;