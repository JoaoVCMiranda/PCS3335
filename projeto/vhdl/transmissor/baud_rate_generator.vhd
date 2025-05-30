library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baud_rate_generator is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
	);
end baud_rate_generator;

architecture Behavioral of baud_rate_generator is
   signal counter : std_logic_vector(15 downto 0) := (others => '0');
	signal out_clock : std_logic := '1';
begin
	process(clock, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
            out_clock <= '1';
        elsif rising_edge(clock) then
            if unsigned(counter) = unsigned('0' & divisor(15 downto 1)) then
                counter <= (others => '0');
                out_clock <= not out_clock;
            else
                counter <= std_logic_vector(unsigned(counter) + 1);
            end if;
        end if;
    end process;
	 baudOut_n <= out_clock;
end Behavioral;
