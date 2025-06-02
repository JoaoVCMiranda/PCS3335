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
			done	: out std_logic;
			current_state : out std_logic_vector(3 downto 0)
	);
end transmitter_timing_control;

architecture arch_ttc of transmitter_timing_control is
	type states is (IDLE,START_BIT,D7,D6,D5,D4,D3,D2,D1,D0,END_BIT);
	signal state : states := IDLE;
	signal rc : std_logic_vector(1 downto 0);
begin

	regControl <= rc;
	with state select -- Substitua 'your_state_variable' pela sua variável de estado enumerada (e.g., present_state)
			current_state <= "0000" when IDLE, --0
											"0001" when START_BIT, --1
											"0010" when D0, --2
											"0011" when D1,
											"0100" when D2,
											"0101" when D3,
											"0110" when D4,
											"0111" when D5,
											"1000" when D6,
											"1001" when D7, --9
											"1010" when END_BIT, -- 10
											"XXXX" when others;

	process(clock, reset)
	begin
		if reset = '1' then
			state <= IDLE;
		elsif falling_edge(clock) then
				case state is
				when IDLE =>
					-- no inicio o contador deve estar "1111111"
					rc <= "00";
						done <= '0';

					if start = '1' then
						state <= START_BIT;
					end if;
				-- Start bit
				when START_BIT =>
					rc <= "10";
					serial_i <= '0';
					state <= D0;
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
					state <= END_BIT;
				when END_BIT =>
					rc <= "00";
					done <= '1';
					if start = '1' then
						state <= IDLE;
					end if;
				when others =>
					rc <= "00";
				end case;
		end if;
	end process;
end arch_ttc;
