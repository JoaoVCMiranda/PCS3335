library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity transmitter_timing_control is
	port(
	    clock : in std_logic;
	    reset : in std_logic;
	    parity : in std_logic;
	    start  : in std_logic;
	    regControl : out std_logic_vector(1 downto 0);
	    serial_i : out std_logic
	);
end transmitter_timing_control;

architecture arch_ttc of transmitter_timing_control is
	type states is (S,A,B,C,D); 
	signal state : states := S; 
	signal rc: std_logic_vector(1 downto 0) := "00";
	signal si: std_logic;
	signal timeToChange: std_logic;
	signal r : std_logic;
	signal en:std_logic;
	signal mode: std_logic := '0';
	signal counter_value: std_logic_vector(4 downto 0);
	signal stt : std_logic_vector(1 downto 0);
	component simple_counter is
		generic(
			WIDTH: natural := 16);
		port(
			clock, reset: in std_logic;
			enable: in std_logic;
			data_o: out std_logic_vector(WIDTH -1 downto 0)
		);
	end component;
begin 

	counter : simple_counter
	generic map(WIDTH=>5)
	port map(clock=>clock, reset=>r, enable=>en, data_o=>counter_value);
	en <= '1';


	regControl <= rc;
	serial_i   <= si;

	process(clock, reset)
	begin
		if reset = '1' then
			r <= '0';
			state <= S;
		else
			if falling_edge(clock) then
				case state is
				when S =>
					-- no inicio o contador deve estar "1111111"
					rc <= "00";
					if start = '1' then
						state <= A;
						mode <= '0';
					end if;
				-- Start bit
				when A =>
					si <= '0';
					stt<= "00";
					rc <= "10";
					state <= B;
					--r <= '1';
					-- Manter o reset desativado
					--r <='0';
					--mode <= '0';
					--stt <= "00";
					-- deslocamento para esquerda
					--rc <= "10";
					-- low for start
					--si <= '0';
					-- no shiftReg temos 11111110
					--if timeToChange = '1' then
					--	r <= '1';
					--	state <= B;
					--end if;
				-- load
				when B =>
					rc <= "11";
					stt<= "01";
					state <= C;
					-- Manter o reset desativado
					--r <='0';
					--mode <= '0';
					--stt <= "01";
					-- carregar os dados em paralelo
					--rc <= "11";
					-- no shiftReg temos QQQQQQQQ
					--mode <= '0';
					--if timeToChange = '1' then
					--	r <= '1';
					--	state <= C;
					--end if;
				-- parity append
				when C =>
					rc<="01";
					stt <= "10";
					si <= parity;
					state <= D;
					-- Resetar o contador
					r <= '1';
					-- Manter o reset desativado
					--r <='0';
					--mode <= '0'; 
					--stt <= "10";
					-- deslocamento para direita (transmitir os dados) + append paridade
					--rc <= "01";
					--si <= parity;
					-- no shiftReg temos 1QQQQQQQ -> 11QQQQQQ -> ...
					---mode <= '0';
					--if timeToChange = '1' then
					--	r <= '1';
					--	state <= D;
					--end if;
				-- append end bit + transfer + offset
				when D =>
					-- Manter o reset desativado
					r <='0';
					mode <= '1';
					stt <= "11";
					-- transmitir dados e 
					rc <= "01";
					si <= '1';
					if timeToChange = '1' then
						r <= '1'; 
						state <= S;
					end if;
				when others =>
					r <= '1';
					rc <= "00";
				end case;
			end if;
		end if;
		case mode is
		when '0' =>
			if counter_value="00001" then 
				timeToChange <= '1';
			else
				timeToChange <= '0';
			end if;
		when '1' =>
			if counter_value="11100" then
				timeToChange <= '1';
			else 
				timeToChange <= '0';
			end if;
		when others =>
			timeToChange <= '0';
		end case;
	end process;
end arch_ttc;
