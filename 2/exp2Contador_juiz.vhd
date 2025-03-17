library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	generic(
		WIDTH: natural := 8);
	port(
		clock, reset: in std_logic;
		enable: in std_logic;
		load: in std_logic;
		up: in std_logic;
		data_i : in std_logic_vector(WIDTH - 1 downto 0);
		data_o : out std_logic_vector(WIDTH - 1 downto 0)
		);
end counter;


architecture counter_arch of counter is
	signal count: std_logic_vector(WIDTH-1 downto 0) := (others => '0'); --inicia zerado
	begin
		process(clock)
		begin
			if rising_edge(clock) then
				if reset = '1' then
					count <= (others => '0');
				else
					if load = '1' then
						count <= data_i;
						--report "Valor de data_i: " & integer'image(to_integer(unsigned(data_i)));
						--report "Valor de count: " & integer'image(to_integer(unsigned(count)));
					else
						if enable = '1' then
							if up = '1' then
								count <= std_logic_vector(unsigned(count) + 1);
							else
								count <= std_logic_vector(unsigned(count) - 1);				
							end if;
						end if;
					end if;
				end if;
			end if;
		
	end process;
	data_o <= count;
end counter_arch;
					
		
