library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity transmitter_timing_control is
	port(
	    clock : in std_logic;
	    reset : in std_logic;
	    start  : in std_logic;
	    regControl : out std_logic_vector(1 downto 0);
	    serial_i : out std_logic;
			done	: out std_logic
	);
end transmitter_timing_control;

architecture arch_ttc of transmitter_timing_control is
	type states is (S,D7,D6,D5,D4,D3,D2,D1,D0);
	signal state : states := S;
	signal rc: std_logic_vector(1 downto 0) := "00";
	signal si: std_logic;
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
				-- load
				when B =>
					rc <= "11";
					stt<= "01";
					state <= C;
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
	end process;
end arch_ttc;
