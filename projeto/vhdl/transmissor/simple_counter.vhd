library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_counter is
	generic(
		WIDTH: natural := 16);
	port(
		clock, reset: in std_logic;
		enable: in std_logic;
		data_o: out std_logic_vector(WIDTH -1 downto 0)
		);
end simple_counter;

architecture counter_arch of simple_counter is
	signal count: std_logic_vector(WIDTH-1 downto 0) := (others => '0'); --inicia zerado
	begin
		process(clock,reset)
		begin
			if reset = '1' then
				count <= (others => '0');
			elsif rising_edge(clock) and enable = '1' then
				count <= std_logic_vector(unsigned(count) + 1);
			end if;
		end process;
	data_o <= count;
end counter_arch;
