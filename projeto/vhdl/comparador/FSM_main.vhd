library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity FSM_main is
    port(
        clock, reset : in std_logic;
        start_bt, select_bt, cursor_left, cursor_right : in std_logic;
        transmission_on : out std_logic := '0';
        transmission_ok : in std_logic;
        victory_AND : in std_logic;
        failure_NOR : in std_logic;
        bad_guess : in std_logic;
        lvl       : in std_logic_vector(1 downto 0);
        send_underlines : out std_logic;
        current_state : out std_logic_vector(4 downto 0);
        prepare_simple_regs : out std_logic;
        game_ready : out std_logic;
        load_mega_register : out std_logic;
        current_difficulty : out std_logic_vector(1 downto 0);
        lose_life, fill_lifes : out std_logic
    );
end entity;

architecture behav of FSM_main is
    type state_type is(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25);
    signal state : state_type;
    signal dificuldade : std_logic_vector(1 downto 0);

    begin
        process(clock, reset, state)
        begin
            if reset = '1' then
                state <= q0;
            elsif rising_edge(clock) then
                case state is
                    when q0 => --Aguarda jogador apertar start
                        if start_bt = '0' then
                            state <= q1;
                        else
                            state <= q0;
                        end if;

                    when q1 => --Aguarda jogador soltar o start
                        if start_bt = '1' then
                            state <= q2;
                        else
                            state <= q1;
                        end if;

                    --seleção de dificuldade:
                    when q2 => --dificuldade fácil
                        if cursor_right = '0' then --active low na FPGA!!!
                            state <= q3;
                        elsif cursor_left = '0' then
                            state <= q8;
                        elsif select_bt = '0' then
                            state <= q11;
                        else
                            state <= q2;
                        end if;

                    when q3 => --freio fácil -> médio
                        if cursor_right = '1' then
                            state <= q4;
                        else
                            state <= q3;
                        end if;

                    when q4 => -- dificuldade média
                        if cursor_right = '0' then
                            state <= q5;
                        elsif cursor_left = '0' then
                            state <= q10;
                        elsif select_bt = '0' then
                            state <= q11;
                        else
                            state <= q4;
                        end if;

                    when q5 => --freio médio -> difícil
                        if cursor_right = '1' then
                            state <= q6;
                        else
                            state <= q5;
                        end if;

                    when q6 => --dificuldade politécnica
                        if cursor_right = '0' then
                            state <= q7;
                        elsif cursor_left = '0' then
                            state <= q9;
                        elsif select_bt = '0' then
                            state <= q11;
                        else
                            state <= q6;
                        end if;

                    when q7 => --freio difícil -> fácil
                       if cursor_right = '1' then
                            state <= q2;
                        else
                            state <= q7;
                        end if;

                    when q8 => --freio fácil -> difícil
                        if cursor_left = '1' then
                            state <= q6;
                        else
                            state <= q8;
                        end if;

                    when q9 => --freio difícil -> médio
                        if cursor_left = '1' then
                            state <= q4;
                        else
                            state <= q9;
                        end if;

                    when q10 => --freio médio -> fácil
                        if cursor_left = '1' then
                            state <= q2;
                        else
                            state <= q10;
                        end if;


                    when q11 => --Aguarda jogador soltar o select
                        if select_bt = '1' then
                            state <= q12;
                        else
                            state <= q11;
                        end if;

                    when q12 => --Banco de palavras recebe um sinal para colocar na sua saída uma sequência de underlines
                        state <= q13;

                    when q13 => --O registrador de transmissão (mega_register) recebe os underlines
                        state <= q14;

                    when q14 => --Transmissão dos underlines e da palavra-dica para a Raspberry
                        if transmission_ok = '1' then
                            state <= q15;
                        else
                            state <= q14;
                        end if;

                    when q15 => -- Os simple_registers, que ficam entre a saída do banco de palavras e o mega_register, recebem a palavra a ser descoberta
                        state <= q16;


                    when q16 => --Estado que aguarda o palpite a ser feito pelo jogador
                        if select_bt = '0' then
                            state <= q17;
                        else
                            state <= q16;
                        end if;

                    when q17 => --Aguarda que o jogador solte o select
                        if select_bt <= '1' then
                            state <= q18;
                        else
                            state <= q17;
                        end if;

                    when q18 => --Estado de comparação palpite/simple_registers
                        if bad_guess = '1' then
                            state <= q22;
                        else
                            state <= q19;
                        end if;

                    when q19 => --Ao menos uma das letras da palavra foi descoberta - mega_register atualizado
                        state <= q20;

                    when q20 => --Transmissão do mega_register atualizado para a Raspberry
                        if transmission_ok = '1' then
                            state <= q21;
                        else
                            state <= q20;
                        end if;

                    when q21 => --Verifica o detector de vitória
                        if victory_AND = '1' then
                            state <= q24;
                        else
                            state <= q16;
                        end if;

                    when q22 => --Nenhuma letra foi descoberta, e o jogador perde uma vida
                        state <= q23;

                    when q23 => --Ainda há vidas restantes?
                        if failure_NOR = '1' then
                            state <= q25;
                        else
                            state <= q16;
                        end if;

                    when q24 => --O jogador venceu o jogo
                        if select_bt = '0' then
                            state <= q0;
                        else
                            state <= q24;
                        end if;

                    when q25 => --Game over
                        if select_bt = '0' then
                            state <= q0;
                        else
                            state <= q25;
                        end if;

                end case;
            end if;
        end process;

        process(clk, state)
        begin
            if rising_edge(clk) then
                if select_btn = '0' then
                    current_difficulty <= dificuldade;
                end if;
            end if;
        end process;

        -- TELAS
        process(clk, state)
        begin
            if rising_edge(clk) then
                if state = q0 then
                    tela <= "000"; -- inicio
                elsif state = q1 then
                    tela <= "000";-- inicio
                elsif state = q2 then
                    tela <= "011"; --dificuldade
                elsif state = q3 then
                    tela <= "011";--dificuldade
                elsif state = q4 then
                    tela <= "100";--dificuldade
                elsif state = q5 then
                    tela <= "100";--dificuldade
                elsif state = q6 then
                    tela <= "101";--dificuldade
                elsif state = q7 then
                    tela <= "101";--dificuldade
                elsif state = q8 then
                    tela <= "011";--dificuldade
                elsif state = q9 then
                    tela <= "101";--dificuldade
                elsif state = q10 then
                    tela <= "100";--dificuldade
                elsif state = q11 then
                    tela <= "110";--palpite
                elsif state = q12 then
                    tela <= "110";--palpite
                elsif state = q13 then
                    tela <= "110";--palpite
                elsif state = q14 then
                    tela <= "110";--palpite
                elsif state = q15 then
                    tela <= "110";--palpite
                elsif state = q16 then
                    if select_btn = '0' then
                        tela <= "111";
                    else
                        tela <= "110";--palpite
                elsif state = q17 then
                    tela <= "110";--palpite
                elsif state = q18 then
                    tela <= "110";--palpite
                elsif state = q19 then
                    tela <= "110";--palpite
                elsif state = q20 then
                    tela <= "110";--palpite
                elsif state = q21 then
                    tela <= "110";--palpite
                elsif state = q22 then
                    tela <= "110";--palpite
                elsif state = q23 then
                    tela <= "110";--palpite
                elsif state = q24 then
                    tela <= "001";--venceu
                elsif state = q25 then
                    tela <= "010";--perdeu
                end if;

        with state select transmission_on <=
            '1' when q6,
            '1' when q13,
            '0' when others;

        with state select load_mega_register <=
            '1' when q13,
            '1' when q19,
            '0' when others;

        with state select send_underlines <=
            '1' when q1,
            '1' when q2,
            '1' when q11,
            '1' when q12,
            '1' when q13,
            '0' when others;


        with state select current_state <=
            "00000" when q0,
            "00001" when q1,
            "00010" when q2,
            "00011" when q3,
            "00100" when q4,
            "00101" when q5,
            "00110" when q6,
            "00111" when q7,
            "01000" when q8,
            "01001" when q9,
            "01010" when q10,
            "01011" when q11,
            "01100" when q12,
            "01101" when q13,
            "01110" when q14,
            "01111" when q15,
            "10000" when q16,
            "10001" when q17,
            "10010" when q18,
            "10011" when q19,
            "10100" when q20,
            "10101" when q21,
            "10110" when q22,
            "10111" when q23,
            "11000" when q24,
            "11001" when q25,
            "11111" when others;

        with state select prepare_simple_regs <=
            '1' when q1,
            '1' when q2,
            '1' when q11,
            '1' when q12,
            '1' when q13,
            '1' when q15,
            '0' when others;

        with state select game_ready <=
            '1' when q15,
            '1' when q16,
            '1' when q17,
            '1' when q18,
            '1' when q19,
            '1' when q20,
            '1' when q21,
            '1' when q22,
            '1' when q23,
            '0' when others;

        with state select dificuldade <=
            "01" when q2,
            "01" when q3,
            "01" when q8,
            "10" when q4,
            "10" when q5,
            "10" when q10,
            "11" when q6,
            "11" when q7,
            "11" when q9,
            "00" when others;

        with state select lose_life <=
            '1' when q22,
            '0' when others;

        with state select fill_lifes <=
            '1' when q15,
            '0' when others;


    end architecture;



