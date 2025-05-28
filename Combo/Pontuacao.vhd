library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Basta o clock da pontuação ser o mesmo da transição de estados que não haverá problema do combo ser incrementado
-- várias vezes em um mesmo ciclo de clock.

entity Pontuacao is
  port (
    clk             : in std_logic;
    rst             : in std_logic;
    comp_ok         : in std_logic_vector(15 downto 0);
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

    acertos <= to_integer(comp_ok(15) + comp_ok(14) + comp_ok(13) + comp_ok(12) +
               comp_ok(11) + comp_ok(10) + comp_ok(9) + comp_ok(8) +
               comp_ok(7) + comp_ok(6) + comp_ok(5) + comp_ok(4) +
               comp_ok(3) + comp_ok(2) + comp_ok(1) + comp_ok(0));


    vidas   <= std_logic_vector(to_unsigned(vidas_int, 3));
    total   <= std_logic_vector(to_unsigned(total_int, 12));
    combo   <= std_logic_vector(to_unsigned(combo_int, 4));

    vidas   <= "000001" when vidas_int = 1 else
               "000011" when vidas_int = 2 else
               "000111" when vidas_int = 3 else
               "001111" when vidas_int = 4 else
               "011111" when vidas_int = 5 else
               "111111" when vidas_int = 6 else
               "000000"


    process(clk, rst)
    begin
        if rst = '1' then
            combo_int     <= 0;
            total_int     <= 0;
            vidas_int     <= 6;
        elsif rising_edge(clk) then
            if quant_acertos /= "000" then
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