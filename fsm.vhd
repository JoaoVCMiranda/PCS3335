library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity fsm is
    port(
        clock, reset : in std_logic;
        start_bt, select_bt : in std_logic; --sinais de entrada após o detector de borda. Aqui, eles já são active high
        bad_guess : in std_logic;
        victory_detector, failure_detector : in std_logic;
        preparing_game, space_as_choose, lose_a_life, pontos, clear_stored_comparisons, guess_unlocked : out std_logic;
        initial_screen_adjust, transmitter_mux_sel : out std_logic_vector(1 downto 0);

        --para debug:
        current_state : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behav of fsm is

    type state_type is(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14);
    signal state : state_type;

    begin
        process(clock, reset, state)
        begin
            if reset = '1' then
                state <= q0;

            elsif rising_edge(clock) then
                case state is
                    when q0 =>
                        if start_bt = '1' then
                            state <= q1;
                        else
                            state <= q0;
                        end if;

                    when q1 =>
                        if select_bt = '1' then
                            state <= q2;
                        else 
                            state <= q1;
                        end if;

                    when q2 =>
                        state <= q3;
                    
                    when q3 => 
                        state <= q4;
                    
                    when q4 =>
                        state <= q5;

                    when q5 =>
                        state <= q6;

                    when q6 =>
                        state <= q7;

                    when q7 =>
                        if select_bt = '1' then
                            state <= q8;
                        else
                            state <= q7;
                        end if;

                    
                    when q8 =>
                        if bad_guess = '0' then
                            state <= q9;
                        else
                            state <= q11;
                        end if;

                    when q9 =>
                        state <= q10;

                    when q10 =>
                        if victory_detector = '1' then
                            state <= q13;
                        
                        else 
                            state <= q7;
                        end if;

                    when q11 => 
                        state <= q12;
                    
                    when q12 =>
                        if failure_detector = '1' then
                            state <= q14;
                        else
                            state <= q7;
                        end if;

                    when q13 =>
                        if select_bt = '1' then
                            state <= q0;
                        else
                            state <= q13;
                        end if;

                    when q14 =>
                        if select_bt = '1' then
                            state <= q0;
                        else
                            state <= q14;
                        end if;

                    when others =>
                        state <= q0;

                end case;
            end if;
        end process;

    with state select preparing_game <=
        '1' when q2,
        '0' when others;

    with state select initial_screen_adjust <=
        "10" when q0,
        "01" when others;

    with state select space_as_choose <=
        '1' when q5,
        '1' when q6,
        '0' when others;

    with state select lose_a_life <=
        '1' when q11,
        '0' when others;

    with state select pontos <= 
        '1' when q9,
        '0' when others;

    with state select transmitter_mux_sel <=
        "00" when q0,
        "00" when q1,
        "00" when q2,
        "00" when q3,
        "00" when q4,
        "01" when q5,
        "01" when q6,
        "01" when q7,
        "01" when q8,
        "01" when q9,
        "01" when q10,
        "01" when q11,
        "01" when q12,
        "10" when q13,
        "11" when q14,
        "00" when others;

    with state select clear_stored_comparisons <=
        '1' when q3,
        '0' when others;

    with state select guess_unlocked <=
        '1' when q6,
        '1' when q8,
        '1' when q9,
        '0' when others;

    --debug:
    with state select current_state <=
        "0000" when q0,
        "0001" when q1,
        "0010" when q2,
        "0011" when q3,
        "0100" when q4,
        "0101" when q5,
        "0110" when q6,
        "0111" when q7,
        "1000" when q8,
        "1001" when q9,
        "1010" when q10,
        "1011" when q11,
        "1100" when q12,
        "1101" when q13,
        "1110" when q14,
        "1111" when others;

    end architecture;