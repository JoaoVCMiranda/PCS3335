library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Basta o clock da pontuação ser o mesmo da transição de estados que não haverá problema do combo ser incrementado
-- várias vezes em um mesmo ciclo de clock.

entity Pontuacao is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    successful_comparisons  : in unsigned(15 downto 0);
    preparing_game          : in std_logic; -- Sinal que indica que o jogo está sendo preparado
    pontos                  : in std_logic;
    lose_a_life             : in std_logic; -- Sinal que indica que o jogador perdeu uma vida
    combo                   : out std_logic_vector(3 downto 0);
    total                   : out std_logic_vector(11 downto 0)
  ) ;
end Pontuacao;

architecture behavioral of Pontuacao is

    signal combo_int        : integer range 0 to 15 := 0;
    signal acertos          : integer range 0 to 15 := 0;
    signal total_int        : integer range 0 to 999 := 0;

begin

    acertos <= to_integer(unsigned(successful_comparisons(15 downto 15))) + to_integer(unsigned(successful_comparisons(14 downto 14))) +
               to_integer(unsigned(successful_comparisons(13 downto 13))) + to_integer(unsigned(successful_comparisons(12 downto 12))) +
               to_integer(unsigned(successful_comparisons(11 downto 11))) + to_integer(unsigned(successful_comparisons(10 downto 10))) +
               to_integer(unsigned(successful_comparisons(9 downto 9))) + to_integer(unsigned(successful_comparisons(8 downto 8))) +
               to_integer(unsigned(successful_comparisons(7 downto 7))) + to_integer(unsigned(successful_comparisons(6 downto 6))) +
               to_integer(unsigned(successful_comparisons(5 downto 5))) + to_integer(unsigned(successful_comparisons(4 downto 4))) +
               to_integer(unsigned(successful_comparisons(3 downto 3))) + to_integer(unsigned(successful_comparisons(2 downto 2))) +
               to_integer(unsigned(successful_comparisons(1 downto 1))) + to_integer(unsigned(successful_comparisons(0 downto 0)));


    --vidas   <= std_logic_vector(to_unsigned(vidas_int, 6));
    total   <= std_logic_vector(to_unsigned(total_int, 12));
    combo   <= std_logic_vector(to_unsigned(combo_int, 4));

    process(clk, rst)
    begin
        if rst = '1' or preparing_game = '1' then
            combo_int     <= 1;
            total_int     <= 0;
        elsif rising_edge(clk) then
            if pontos = '1' then
                combo_int   <= 1 + combo_int;
                total_int   <= total_int + combo_int*acertos*50; 
                if combo_int > 15 then
                    combo_int <= 15; -- Limita o valor máximo do combo
                end if;
            elsif lose_a_life = '1' then
                combo_int <= 1; -- Reseta o combo se não houver acertos
            else
                total_int <= total_int; -- Mantém o total se não houver acertos
                combo_int <= combo_int; -- Mantém o combo se não houver acertos
            end if;
		  end if;
	 end process;
end behavioral; -- Pontuacao