library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity transmitter_timing_control is
	port(
	    clock : in std_logic;
	    reset : in std_logic;
	    parity : in std_logic;
	    regControl : out std_logic_vector(1 downto 0);
	    serial_i : out std_logic
	);
end transmitter_timing_control;

architecture arch_ttc of transmitter_timing_control is
	type states is (A,B,C,D); 
	signal state : states; 
	signal rc: std_logic_vector(1 downto 0);
	signal si: std_logic;
	signal timeToChange: std_logic;
	signal r : std_logic;
	signal en:std_logic;
	signal mode: std_logic := '0';
	signal counter_value: std_logic_vector(4 downto 0);
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

	-- Para aumentar o tempo do contador em 16
	-- gerar um contador auxiliar de WIDTH=>4
	-- en <= "AND todos os bits data_o" 
	en <= '1';
	


	regControl <= rc;
	serial_i   <= si;

	process(clock)
	begin
		if rising_edge(clock)then
			case state is
			when A =>
				-- deslocamento para esquerda
				rc <= "10";
				-- low for start
				si <= '0';
				-- no shiftReg temos XXXXXXX0
				r <= '1';
				mode <= '0';
				if timeToChange = '1' then
					state <= B;
				end if;
			when B =>
				-- carregar os dados em paralelo
				rc <= "11";
				-- no shiftReg temos QQQQQQQQ
				r <= '1';
				mode <= '0';
				if timeToChange = '1' then
					state <= C;
				end if;
			when C =>
				-- deslocamento para direita (transmitir os dados) + append paridade
				rc <= "01";
				si <= parity;
				-- no shiftReg temos 1QQQQQQQ -> 11QQQQQQ -> ...
				r <= '1';
				mode <= '0';
				if timeToChange = '1' then
					state <= D;
				end if;
			when D =>
				-- transmitir dados e 
				rc <= "01";
				si <= '1';
				mode <= '1';
				if timeToChange = '1' then
					state <= A;
				end if;
			when others =>
				rc <= "00";
			end case;
		end if;
		case mode is
		when '0' =>
			-- Eu sei que deve haver um jeito mais bonito de fazer...
			if counter_value="00001" then 
				timeToChange <= '1';
			else
				timeToChange <= '0';
			end if;
		when '1' =>
			if counter_value="11110" then
				timeToChange <= '1';
			else 
				timeToChange <= '0';
			end if;
		when others =>
			timeToChange <= '0';
		end case;
	end process;
end arch_ttc;
