-- Control Unit
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity uc is
	port(
		clock, reset, serial_in : in std_logic;
		load_for_rsr : out std_logic;
		currentState : out unsigned(3 downto 0);
		counter_viewer : out unsigned(3 downto 0);
		parity_bit_time, parity_bit : out std_logic
	);
end entity;

architecture arch of uc is

	component uc_counter is
	port(
		clock, reset : in std_logic;
		start : in std_logic;
		ok : out std_logic := '0';
		countValue : out unsigned(3 downto 0)
	);
	end component;
	
	type state_type is(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11);
	signal state : state_type;
	signal start_count, stop_count : std_logic;
	
	begin
		contador : uc_counter port map(clock, reset, start_count, stop_count, counter_viewer);
	
		process(clock, reset, state)
		begin
			if reset = '1' then
				state <= q0;
			elsif rising_edge(clock) then
				
				case state is
					when q0 => -- aguardo do start bit
						if serial_in = '0' then
							state <= q1;
						else
							state <= q0;
						end if;
					when q1 =>  --start bit
						if stop_count = '1' then
							state <= q2;
						else 
							state <= q1;
						end if;
					when q2 =>
						if stop_count = '1' then
							state <= q3;
						else 
							state <= q2;
						end if;
					when q3 =>
						if stop_count = '1' then
							state <= q4;
						else 
							state <= q3;
						end if;
					when q4 =>
						if stop_count = '1' then
							state <= q5;
						else 
							state <= q4;
						end if;
					when q5 =>
						if stop_count = '1' then
							state <= q6;
						else 
							state <= q5;
						end if;
					when q6 =>
						if stop_count = '1' then
							state <= q7;
						else 
							state <= q6;
						end if;
					when q7 =>
						if stop_count = '1' then
							state <= q8;
						else 
							state <= q7;
						end if;
					when q8 =>
						if stop_count = '1' then
							state <= q9;
						else 
							state <= q8;
						end if;
					
					when q9 =>
						if stop_count = '1' then
							state <= q10;
						else 
							state <= q9;
						end if;
						
					when q10 => --parity bit
						if stop_count = '1' then
							state <= q11;
						else 
							state <= q10;
						end if;
					
					when q11 => --stop bit
						if stop_count = '1' then
							state <= q0;
						else 
							state <= q11;
						end if;
					
		
					when others =>
						state <= q0;
						
				end case;
			end if;
			
		end process;
		
		with state select currentState <= 
			"0000" when q0,
			"0001" when q1,
			"0010" when q2,
			"0011" when q3,
			"0100" when q4,
			"0101" when q5,
			"0110" when q6,
			"0111" when q7,
			"1000" when q8,
			"1001" when q9,
			"1010" when q10,
			"1011" when q11,
			"0000" when others;
			
		with state select start_count <=
			'0' when q0,
			'1' when others;
			
		with state select load_for_rsr <=
			'0' when q0,
			'0' when q1,
			'0' when q10,
			'0' when q11,
			'1' when others;
			
		with state select parity_bit_time <=
			'1' when q10,
			'0' when others;
		
		parity_bit <= serial_in;
		
end architecture;
			
			
-- Contador de 4 bits para manter cada leitura de bit ativa por 16 ciclos de clock
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity uc_counter is
	port(
		clock, reset : in std_logic;
		start : in std_logic;
		ok : out std_logic := '0';
		countValue : out unsigned(3 downto 0)
	);
end entity;

architecture arch of uc_counter is
	signal count : unsigned(3 downto 0) := (others => '0');
	
	begin
		process(clock, reset)
		begin
			if reset = '1' then
				count <= (others => '0');
			elsif rising_edge(clock) then
				if start = '1' then
					if count < "1111" then
						count <= count + 1;
					else
						count <= (others => '0');
					end if;
					
					if count = "1110" then
						ok <= '1';
					else 
						ok <= '0';
					end if;
				else
					count <= (others => '0');
				end if;
			end if;
		end process;
		countValue <= count;
end architecture;