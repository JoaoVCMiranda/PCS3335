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
	type states is (S,A,B,D7,D6,D5,D4,D3,D2,D1,D0,E);
	signal state : states := S;
	signal rc : std_logic_vector(1 downto 0);
begin

	regControl <= rc;

	process(clock, reset)
	begin
		if reset = '1' then
			state <= S;
		elsif falling_edge(clock) then
				case state is
				when S =>
					-- no inicio o contador deve estar "1111111"
					rc <= "00";
					done <= '0';
					if start = '1' then
						state <= A;
					end if;
				-- Start bit
				when A =>
					rc <= "10";
					serial_i <= '0';
					state <= B;
				-- load
				when D0 =>
					rc <= "11";
					state <= D1;
				when D1 =>
					rc <= "01";
					serial_i <= '1';
					state <= D2;
				when D2 =>
					rc <= "01";
					serial_i <= '1';
					state <= D3;
				when D3 =>
					rc <= "01";
					serial_i <= '1';
					state <= D4;
				when D4 =>
					rc <= "01";
					serial_i <= '1';
					state <= D5;
				when D5 =>
					rc <= "01";
					serial_i <= '1';
					state <= D6;
				when D6 =>
					rc <= "01";
					serial_i <= '1';
					state <= D7;
				when D7 =>
					rc <= "01";
					serial_i <= '1';
					state <= E;
				when E =>
					rc <= "00";
					done <= '1';
					if start = '1' then
						state <= D0;
						done <= '0';
					end if;
				when others =>
					rc <= "00";
				end case;
		end if;
	end process;
end arch_ttc;
