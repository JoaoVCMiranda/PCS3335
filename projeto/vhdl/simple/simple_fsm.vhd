library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity simple_fsm is
    port(
        reset : in std_logic;
        start_bt, select_bt : in std_logic;
        sel_diff : out std_logic := '0';  -- sinal para selecionar a dificuldade
        start_game : out std_logic := '0';  -- sinal para iniciar o jogo
        lvl : in std_logic_vector(1 downto 0);
        contabilizar_rodada : out std_logic := '0';
        -- pulso para quando deve ser feita a contabilização da rodada
        -- vidas
        -- pontuação e combo
        -- comparação e atualização da palavra visível

        vidas : in std_logic_vector(5 downto 0);
        won : in std_logic := '0';
        tela : out std_logic_vector(2 downto 0)
    );
end entity;
architecture fsm of simple_fsm is

    type states is (idle, select_difficulty, play, win, lose);

    signal state : states;
begin

    process(reset, start_bt, select_bt)
    begin
        if reset = '1' then
            state <= idle;
        elsif rising_edge(start_bt) then
            case state is
                when idle =>
                    state <= select_difficulty;
                    sel_diff <= '0';
                    start_game <= '1';  -- Signal to start the game
                    tela <= "000";  -- TELA INICIAL
                when select_difficulty =>
                    state <= play;
                    sel_diff <= '1';
                    -- AJUSTAR SELEÇÃO DE TELAS
                when play =>
                    sel_diff <= '0';
                    contabilizar_rodada <= '1';  -- Trigger round accounting
                    tela <= "110";  -- TELA DE JOGO
                    -- Para inserir a lógica do palpite no select
                    -- separar o rising_edge do select e trocar o valor da tela enquanto ele estiver pressionado
                when win =>
                    tela <= "001";  -- TELA DE VITÓRIA
                    state <= idle;  -- Reset to idle after winning
                when lose =>
                    tela <= "010";  -- TELA DE DERROTA
                    state <= idle;  -- Reset to idle after losing
                end case;
        elsif falling_edge(start_bt) then
            case state is
                when select_difficulty =>
                    start_game <= '0';  
                when play =>
                    sel_diff <= '0';  
                    start_game <= '0';  
                    contabilizar_rodada <= '0';  
                    if won = '1' then
                        state <= win;
                    elsif vidas = "000000" then
                        state <= lose;
                    end if;
                when others =>
                    -- No action needed for other states
                    null;
            end case;
        end if;

    end process;


end architecture fsm;