--RSR: registrador que recebe os bits da entrada serial e os armazena
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity rsr is
	port(
		clock, reset, load : in std_logic;
		serial_in : in std_logic;
		parallel_out : out std_logic_vector(7 downto 0) := (others => '0');
		counter_viewer : out unsigned(3 downto 0)
	);
end entity;

architecture arch of rsr is
	signal to_parallel_out : std_logic_vector(7 downto 0) := "00000000";
	signal count : unsigned(3 downto 0) := "0000";
	signal counter_ok : std_logic := '0';
	
	begin	
		process(clock, reset, load)
		begin
			if reset = '1' then
				to_parallel_out <= (others => '0');
				count <= (others => '0');
			elsif rising_edge(clock) then
				
				if load = '1' then
					--report("load = 1");
					if count < "1111" then
						count <= count + 1;
						counter_ok <= '0';
					else 
						count <= "0000";
						counter_ok <= '1';
					end if;
					
					if count = "0111" then -- deslocamento no meio do sinal
						--report("deslocamento no registrador");
						to_parallel_out <= serial_in & to_parallel_out(7 downto 1);
					end if;
				
				else
					count <= (others => '0');
				end if;
				
			end if;
			
			
		end process;
		parallel_out <= to_parallel_out;
		counter_viewer <= count;
end architecture;