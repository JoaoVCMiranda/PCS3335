--Contador para obter os 9600 bps

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity clock_div_counter is
	port(
		clock, reset : in std_logic;
		clock_out : out std_logic := '0' --Para obter o baud rate de 9600 bps
	);
end entity;

architecture behav of clock_div_counter is
	signal count : unsigned(3 downto 0) := "0000"; 
	signal clk_div : std_logic := '0';
	begin
		process(clock, reset)
		begin
			if reset = '1' then
				count <= "0000";
				clk_div <= '0';
			elsif rising_edge(clock) then
				if count = "1111" then
					count <=  "0000";
					clk_div <= not clk_div;
				else
					count <= count + 1;
				end if;
			end if;
		end process;
		
		clock_out <= clk_div;
end architecture;