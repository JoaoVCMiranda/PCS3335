library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity FSM_main is
    port(
        clock, reset : in std_logic;
        start_bt, select_bt : in std_logic;
        transmission_on : out std_logic := '0';
        transmission_ok : in std_logic;
        victory_AND : in std_logic;
        failure_NAND : in std_logic;
        bad_guess : in std_logic;
        send_underlines, empty_guess : out std_logic
    );
end entity;

architecture behav of FSM_main is
    type state_type is(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18);
    signal state : state_type;

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

                    when q2 => --Aguarda jogador selecionar dificuldade, apertando select
                        if select_bt <= '0' then
                            state <= q3;
                        else
                            state <= q2;
                        end if;

                    when q3 => --Aguarda jogador soltar o select
                        if select_bt <= '1' then
                            state <= q4;
                        else
                            state <= q3;
                        end if;

                    when q4 => --Banco de registradores recebe um sinal para colocar na sua saída uma sequência de underlines
                        state <= q5;

                    when q5 => --O registrador de transmissão (mega_register) recebe os underlines
                        state <= q6;

                    when q6 => --Transmissão dos underlines e da palavra-dica para a Raspberry
                        if transmission_ok = '1' then
                            state <= q7;
                        else
                            state <= q6;
                        end if;

                    when q7 => -- Os simple_registers, que ficam entre a saída do banco de palavras e o mega_register, recebem a palavra a ser descoberta
                        state <= q8;

                    when q8 => --Feito palpite inicial nulo para que os registradores não usados não afetem a detecção de vitória
                               --Aqui, a entidade de vidas recebe seis vidas
                        state <= q9;

                    when q9 => --Estado que aguarda o palpite a ser feito pelo jogador
                        if select_bt = '0' then
                            state <= q10;
                        else
                            state <= q9;
                        end if;

                    when q10 => --Aguarda que o jogador solte o select
                        if select_bt <= '1' then
                            state <= q11;
                        else
                            state <= q10;
                        end if;

                    when q11 => --Estado de comparação palpite/simple_registers
                        if bad_guess = '1' then
                            state <= q15;
                        else
                            state <= q12;
                        end if;

                    when q12 => --Ao menos uma das letras da palavra foi descoberta - mega_register atualizado
                        state <= q13;
                    
                    when q13 => --Transmissão do mega_register atualizado para a Raspberry
                        if transmission_ok = '1' then
                            state <= q14;
                        else
                            state <= q13;
                        end if;
                    
                    when q14 => --Verifica o detector de vitória
                        if victory_AND = '1' then
                            state <= q17;
                        else
                            state <= q9;
                        end if;

                    when q15 => --Nenhuma letra foi descoberta, e o jogador perde uma vida
                        state <= q16;

                    when q16 => --Ainda há vidas restantes?
                        if failure_NAND = '1' then
                            state <= q18;
                        else
                            state <= q9;
                        end if;

                    when q17 => --O jogador venceu o jogo
                        if select_bt = '0' then
                            state <= q0;
                        else
                            state <= q17;
                        end if;

                    when q18 => --Game over
                        if select_bt = '0' then
                            state <= q0;
                        else
                            state <= q18;
                        end if;
                    
                end case;
            end if;
        end process;
            
        with state select transmission_on <=
            '1' when q6,
            '1' when q13,
            '0' when others;

        with state select send_underlines <=
            '1' when q4,
            '0' when others;

        with state select empty_guess <=
            '1' when q8,
            '0' when others;


    end architecture;
                        
                        

