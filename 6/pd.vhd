-- Parity detector

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity pd is
	port(
		enable : in std_logic;
		parallel_in : in std_logic_vector(7 downto 0);
		received_parity_bit : in std_logic;
		parity_led : out std_logic := '0' -- =1 se houver erro de paridade
	);
end entity;

architecture arch of pd is
	signal parity_of_parallel_in : std_logic := '0';
	
	begin
		process(enable, parallel_in)
		begin
			if enable = '1' then
				
				parity_of_parallel_in <= parallel_in(7) xor parallel_in(6) xor parallel_in(5) xor parallel_in(4) xor parallel_in(3) xor parallel_in(2) xor parallel_in(1) xor parallel_in(0);
				report "Valor de parallel_in= " & integer'image(to_integer(unsigned(parallel_in)));
				if parity_of_parallel_in = '1' then
					report(" parity_of_parallel_in = 1");
				else
					report(" parity_of_parallel_in = 0");
				end if;
				
				if received_parity_bit = '1' then
					report("received_parity_bit = 1");
				else
					report("received_parity_bit = 0");
				end if;
				
				
				--parity_led <= parity_of_parallel_in xor  received_parity_bit;
				parity_led <= (parallel_in(7) xor parallel_in(6) xor parallel_in(5) xor parallel_in(4) xor parallel_in(3) xor parallel_in(2) xor parallel_in(1) xor parallel_in(0)) xor received_parity_bit;
				
			end if;	
		end process;
end architecture;