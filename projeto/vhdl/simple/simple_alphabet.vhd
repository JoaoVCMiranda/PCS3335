library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity simple_alphabet is
    port(
        seta_esquerda : in std_logic;
        seta_direita : in std_logic;
        letra_selecionada : out std_logic_vector(7 downto 0) := (others => '0');
        -- Sinal para indicar a letra selecionada
        reset : in std_logic
        -- Sinal de reset para reiniciar a seleção
    );
end entity;

architecture Behavioral of simple_alphabet is
    type states is (A, B, C, D, E, F, G, H, I, J, K, L, M,
                    N, O, P, Q, R, S, T, U, V, W, X, Y, Z);
    signal state : states := A;  -- Estado inicial é A
    signal letra : std_logic_vector(7 downto 0);
    -- Sinal para armazenar a letra selecionada
    begin
    letra_selecionada <= letra;  -- Atualiza a letra selecionada

    process(seta_esquerda, seta_direita, reset)
        begin
            if reset = '1' then
                state <= A;  -- Reinicia para o estado A
                letra <= "01000001";  -- Reinicia a letra selecionada
            elsif falling_edge(seta_direita) then
                case state is
                    when A => 
                        state <= B; 
                        letra <= "01000001";  -- A
                    when B => 
                        state <= C; 
                        letra <= "01000010";  -- B
                    when C => 
                        state <= D; 
                        letra <= "01000011";  -- C
                    when D => 
                        state <= E; 
                        letra <= "01000100";  -- D
                    when E => 
                        state <= F; 
                        letra <= "01000101";  -- E
                    when F => 
                        state <= G; 
                        letra <= "01000110";  -- F
                    when G => 
                        state <= H; 
                        letra <= "01000111";  -- G
                    when H => 
                        state <= I; 
                        letra <= "01001000";  -- H
                    when I => 
                        state <= J; 
                        letra <= "01001001";  -- I
                    when J => 
                        state <= K; 
                        letra <= "01001010";  -- J
                    when K => 
                        state <= L; 
                        letra <= "01001011";  -- K
                    when L => 
                        state <= M; 
                        letra <= "01001100";  -- L
                    when M => 
                        state <= N; 
                        letra <= "01001101";  -- M
                    when N => 
                        state <= O; 
                        letra <= "01001110";  -- N
                    when O => 
                        state <= P; 
                        letra <= "01001111";  -- O
                    when P => 
                        state <= Q; 
                        letra <= "01010000";  -- P
                    when Q => 
                        state <= R; 
                        letra <= "01010001";  -- Q
                    when R => 
                        state <= S; 
                        letra <= "01010010";  -- R
                    when S => 
                        state <= T; 
                        letra <= "01010011";  -- S
                    when T => 
                        state <= U; 
                        letra <= "01010100";  -- T
                    when U => 
                        state <= V; 
                        letra <= "01010101";  -- U
                    when V => 
                        state <= W; 
                        letra <= "01010110";  -- V
                    when W => 
                        state <= X; 
                        letra <= "01010111";  -- W
                    when X => 
                        state <= Y; 
                        letra <= "01011000";  -- X
                    when Y => 
                        state <= Z; 
                        letra <= "01011001";  -- Y
                    when Z => 
                        state <= A; 
                        letra <= "01011010";
                end case;
            elsif  falling_edge(seta_esquerda) then
                case    state is
                        when A => 
                        state <= Z; 
                        letra <= "01011010";  -- Z
                    when B => 
                        state <= A; 
                        letra <= "01000001";  -- A
                    when C => 
                        state <= B; 
                        letra <= "01000010";  -- B
                    when D => 
                        state <= C; 
                        letra <= "01000011";  -- C
                    when E => 
                        state <= D; 
                        letra <= "01000100";  -- D
                    when F => 
                        state <= E; 
                        letra <= "01000101";  -- E
                    when G => 
                        state <= F; 
                        letra <= "01000110";  -- F
                    when H => 
                        state <= G; 
                        letra <= "01000111";  -- G
                    when I => 
                        state <= H; 
                        letra <= "01001000";  -- H
                    when J => 
                        state <= I; 
                        letra <= "01001001";  -- I
                    when K => 
                        state <= J; 
                        letra <= "01001010";  -- J
                    when L => 
                        state <= K; 
                        letra <= "01001011";  -- K
                    when M => 
                        state <= L; 
                        letra <= "01001100";  -- L
                    when N => 
                        state <= M; 
                        letra <= "01001101";  -- M
                    when O => 
                        state <= N; 
                        letra <= "01001110";  -- N
                    when P => 
                        state <= O; 
                        letra <= "01001111";  -- O
                    when Q => 
                        state <= P; 
                        letra <= "01010000";  -- P
                    when R => 
                        state <= Q; 
                        letra <= "01010001";  -- Q
                    when S => 
                        state <= R; 
                        letra <= "01010010";  -- R
                    when T => 
                        state <= S; 
                        letra <= "01010011";  -- S
                    when U => 
                        state <= T; 
                        letra <= "01010100";  -- T
                    when V => 
                        state <= U; 
                        letra <= "01010101";  -- U
                    when W => 
                        state <= V; 
                        letra <= "01010110";  -- V
                    when X => 
                        state <= W; 
                        letra <= "01010111";  -- W
                    when Y => 
                        state <= X; 
                        letra <= "01011000";  -- X
                    when Z => 
                        state <= Y; 
                        letra <= "01011001";  -- Y
                end case;
            end if;
        end process;
            
end architecture Behavioral;