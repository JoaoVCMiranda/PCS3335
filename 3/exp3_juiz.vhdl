library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity semaforo is
	port(
		clk : in std_logic;
		rst : in std_logic;
		vermelho: out std_logic;
		amarelo : out std_logic;
		verde   : out std_logic);
end semaforo;

architecture semaforo_behav of semaforo is
	component counter is
		port(
		clock : in std_logic;
		reset : in std_logic;
		data_o : out unsigned(2 downto 0);
		mode : in unsigned(1 downto 0);
		time_to_change : out std_logic);
	end component;
	
	type state_type is (q0, q1, q2);
	signal state : state_type;
	signal count : unsigned(2 downto 0) := (others => '0');
	signal mode : unsigned(1 downto 0);
	signal timeToChange : std_logic := '0';
	
	begin
		contador: counter port map(clk, rst, count, mode, timeToChange);
		process(clk, rst, timeToChange)
		begin
			if rst = '1' then
				state <= q0;
				
			elsif rising_edge(clk) or timeToChange = '1' then
				case state is
					when q0 => 
						if timeToChange = '1' then
							state <= q1;
							
						else
							state <= q0;
						end if;
						
					when q1 => 
						if timeToChange = '1' then
							state <= q2;
						else
							state <= q1;

						end if;
						
					when q2 => 
						if timeToChange = '1' then
							state <= q0;
						else
							state <= q2;
						end if;
					
					when others =>
						state <= q0;
						
				end case;
			end if;
		end process;
		
		with state select vermelho <=
			'1' when q0,
			'0' when others;
			
		with state select verde <=
			'1' when q1,
			'0' when others;
			
		with state select amarelo <=
			'1' when q2,
			'0' when others;
		
		with state select mode <=
			"01" when q0,
			"10" when q1,
			"11" when q2,
			"00" when others;
			
end architecture;

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity counter is
	port(
	clock : in std_logic;
	reset : in std_logic;
	data_o : out unsigned(2 downto 0);
	mode : in unsigned(1 downto 0);
	time_to_change : out std_logic);
end entity;

architecture behav of counter is
	
	signal count : unsigned(2 downto 0) := (others => '0');
	begin
	process(clock, reset, count)
	begin
		if reset = '1' then
			count <= (others => '0');
		elsif rising_edge(clock) then
			count <= count + 1;
			
		end if;
		
		if((mode = "01" or mode = "10") and count = "101") or (mode = "11" and count = "010") then
				count <= (others => '0');
				time_to_change <= '1';
			else
				time_to_change <= '0';
		
			

			
		end if;
	end process;
	data_o <= count;
end architecture;