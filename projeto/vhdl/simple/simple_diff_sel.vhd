library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity simple_diff_sel is
    port(
        seta_esquerda : in std_logic;
        seta_direita : in std_logic;
        dificuldade_selecionada : out std_logic_vector(1 downto 0) := "01";
        -- Sinal para indicar a dificuldade selecionada
        reset : in std_logic
        -- Sinal de reset para reiniciar a seleção
    );
end entity;
architecture Behavioral of simple_diff_sel is
    type states is (facil, medio, dificil);
    signal state : states := facil;  -- Estado inicial é A
    signal dificuldade : std_logic_vector(1 downto 0);
    begin
    dificuldade_selecionada <= dificuldade;  -- Atualiza a dificuldade selecionada
        process(seta_esquerda, seta_direita, reset)
        begin
            if reset = '1' then
                state <= facil;  -- Reinicia para o estado A
                dificuldade <= "01";  -- Reinicia a dificuldade selecionada
            elsif falling_edge(seta_direita) then
                case state is
                    when facil => 
                        state <= medio; 
                        dificuldade <= "10";  -- Dificuldade média
                    when medio => 
                        state <= dificil; 
                        dificuldade <= "11";  -- Dificuldade difícil
                    when dificil => 
                        state <= facil; 
                        dificuldade <= "01";  -- Volta para a dificuldade fácil
                end case;
            elsif falling_edge(seta_esquerda) then
                case state is
                    when facil => 
                        state <= dificil; 
                        dificuldade <= "11";  -- Dificuldade difícil
                    when medio => 
                        state <= facil; 
                        dificuldade <= "01";  -- Dificuldade fácil
                    when dificil => 
                        state <= medio; 
                        dificuldade <= "10";  -- Dificuldade média
                end case;
            end if;
        end process;
end architecture Behavioral;