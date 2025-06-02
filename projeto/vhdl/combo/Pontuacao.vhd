library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Basta o clock da pontuação ser o mesmo da transição de estados que não haverá problema do combo ser incrementado
-- várias vezes em um mesmo ciclo de clock.

entity Pontuacao is
  port (
    clk             : in std_logic;
    rst             : in std_logic;
    comp_ok         : in unsigned(15 downto 0);
    combo           : out std_logic_vector(3 downto 0);
    total           : out std_logic_vector(11 downto 0);
    vidas           : out std_logic_vector(5 downto 0)
  ) ;
end Pontuacao;

architecture behavioral of Pontuacao is

    signal combo_int        : integer range 0 to 15 := 0;
    signal acertos          : integer range 0 to 15 := 0;
    signal total_int        : integer range 0 to 999 := 0;
    signal vidas_int        : integer range 0 to 6 := 5;

begin

    acertos <= to_integer(unsigned(comp_ok(15 downto 15))) + to_integer(unsigned(comp_ok(14 downto 14))) +
               to_integer(unsigned(comp_ok(13 downto 13))) + to_integer(unsigned(comp_ok(12 downto 12))) +
               to_integer(unsigned(comp_ok(11 downto 11))) + to_integer(unsigned(comp_ok(10 downto 10))) +
               to_integer(unsigned(comp_ok(9 downto 9))) + to_integer(unsigned(comp_ok(8 downto 8))) +
               to_integer(unsigned(comp_ok(7 downto 7))) + to_integer(unsigned(comp_ok(6 downto 6))) +
               to_integer(unsigned(comp_ok(5 downto 5))) + to_integer(unsigned(comp_ok(4 downto 4))) +
               to_integer(unsigned(comp_ok(3 downto 3))) + to_integer(unsigned(comp_ok(2 downto 2))) +
               to_integer(unsigned(comp_ok(1 downto 1))) + to_integer(unsigned(comp_ok(0 downto 0)));


    --vidas   <= std_logic_vector(to_unsigned(vidas_int, 6));
    total   <= std_logic_vector(to_unsigned(total_int, 12));
    combo   <= std_logic_vector(to_unsigned(combo_int, 4));
	 with vidas_int select vidas <=
				"000001" when 1,
				"000011" when 2,
				"000111" when 3,
				"001111" when 4,
				"011111" when 5,
				"111111" when 6,
				"000000" when others;


    process(clk, rst)
    begin
        if rst = '1' then
            combo_int     <= 0;
            total_int     <= 0;
            vidas_int     <= 6;
        elsif rising_edge(clk) then
            if acertos = 0 then
                -- É melhor usar quant_acertos porque isso simplifica a parte síncrona, caso contrário, seria necessário
                -- uma máquina de estados ou um process mais complexo, pois para mais de um acerto, o combo deveria se manter
                -- constante e seria necessário mais sinais de controle para saber se devo incrementar o combo ou não. É mais
                -- simples apenas passar o valor de quant_acertos e incrementar o combo se houver acertos no final da maquina de estados
                -- da comparação.
                combo_int   <= 1 + combo_int;
                total_int   <= total_int + combo_int*acertos*50;
                vidas_int   <= vidas_int; -- Incrementa a vida a cada acerto  
                if combo_int > 15 then
                    combo_int <= 15; -- Limita o valor máximo do combo
                end if;
            else
                total_int   <= total_int/2;
                combo_int   <= 1; -- Reseta o combo se não houver acertos
                vidas_int   <= vidas_int - 1; -- Reseta a vida se não houver acertos
            end if;
		  end if;
	 end process;
end behavioral; -- Pontuacao