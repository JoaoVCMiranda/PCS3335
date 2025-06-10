--Baud Rate Generator
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity BRG is
	port(
		clock_in, reset : in std_logic;
		clock_out : out std_logic := '0';
		divisor : in std_logic_vector(15 downto 0) --Se divisor for um n ímpar, a divisão do clock será de fator n - 1
	);
end entity;

architecture arch of BRG is
	signal divisor_counter : unsigned(15 downto 0) := (others => '0');
	signal to_clock : std_logic := '0';
	begin
		process(clock_in, reset)
		begin
			if reset = '1' then
				divisor_counter <= (others => '0');
				to_clock <= '0';
			elsif rising_edge(clock_in) then
				if divisor_counter < (unsigned(divisor)/2 - 1) then
					divisor_counter <= divisor_counter + 1;
				else
					divisor_counter <= (others => '0');
					to_clock <= not to_clock;
				end if;
			end if;
		end process;
		clock_out <= to_clock;
end architecture;
			