library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baud_rate_generator is
	port (
	    clock : in std_logic; -- Recebe o sinal Phase Lock Loop 
	    -- IP Catalog > Library > Clocks > PLLs and Resets > PLL > PLL Intel FPGA > vhdl
	    -- Base/Ref clock : 50MHz 
	    -- Desired clock: 1.8432MHz
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
	);
end baud_rate_generator;

architecture arch_bgr of baud_rate_generator is
	-- O coração
	component simple_counter is
	generic(WIDTH: natural := 16);
	port(
		clock, reset: in std_logic;
		enable: in std_logic;
		data_o: out std_logic_vector(WIDTH -1 downto 0)
	);
	end component;	
	-- A mente
	signal c : std_logic_vector(15 downto 0);
	signal r : std_logic := '0';
	signal bgr_clock : std_logic := '0';
begin
	-- O resultado
	baudOut_n <= bgr_clock;

	-- O processo
	cnt : simple_counter
	generic map (WIDTH=>16)
	port map(clock=>clock, reset=>r, enable=>'1',data_o=>c);

	process(clock, reset)
	begin
		-- pois o contador começa em 0
		if(unsigned(c) = unsigned(divisor)-1) then
			bgr_clock<= not bgr_clock; 
			r <= '1';
		else
			r <= '0';
		end if;
	end process;
	-- Filosofia vhdl
end arch_bgr;
