-- Saída para o 7 segmentos

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity ss_out is
	port(
		reset : in std_logic;
		bits_in : in std_logic_vector(3 downto 0);
		seg_out : out std_logic_vector(6 downto 0)
	);
end entity;
	
architecture arch of ss_out is --Reforçando que a FPGA tem ativo baixo nos 7 segmentos
	
	begin
		seg_out(6 downto 0) <=
			"1111111" when reset = '1' else
			"1111111" when bits_in = "0000" else -- 0
			"1111001" when bits_in = "0001" else -- 1
			"0100100" when bits_in = "0010" else -- 2
			"0110000" when bits_in = "0011" else -- 3
			"0011001" when bits_in = "0100" else -- 4
			"0010010" when bits_in = "0101" else -- 5
			"0000010" when bits_in = "0110" else -- 6
			"1111000" when bits_in = "0111" else -- 7
			"0000000" when bits_in = "1000" else -- 8
			"0010000" when bits_in = "1001" else -- 9
			"0001000" when bits_in = "1010" else -- A
			"0000011" when bits_in = "1011" else -- B
			"1000110" when bits_in = "1100" else -- C
			"0100001" when bits_in = "1101" else -- D
			"0000100" when bits_in = "1110" else -- E
			"0001110" when bits_in = "1111" else -- F
			"1111111";
end architecture;
	