library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture behav of tb is
	component exp6 is
		port(
		clock, reset : in std_logic;
		serial_in : in std_logic;
		seg_out : out std_logic_vector(6 downto 0);
		parity_error_bit : out std_logic;
		LCR : out std_logic_vector(7 downto 0);
		stateValue : out std_logic_vector(1 downto 0)
	);
	end component;
	
	signal clock_tb : std_logic := '0'; 
	signal reset_tb : std_logic := '0';
	signal serial_in_tb : std_logic := '1';
	signal parity_error_bit_tb : std_logic := '0';
	signal seg_out_tb : std_logic_vector(6 downto 0) := (others => '0'); 
	signal LCR_tb :  std_logic_vector(7 downto 0) := (others => '0'); 
	signal statevalue_tb : std_logic_vector(1 downto 0) := "00";
	signal keep_simulating : std_logic := '0';
	
	
	begin
		DUT: exp6 port map(clock_tb, reset_tb, serial_in_tb, seg_out_tb, parity_error_bit_tb,  LCR_tb);
		clock_tb <= keep_simulating and not clock_tb after 1085 ns; -- Simulando a saída do IP-PLL
		
		tests : process
		begin
			keep_simulating <= '1';
			-- 93 = 01011101
			-- palavra : "01011101011"
			-- Esperado : word = 01011101 parity_bit = 1 (erro detectado) 
			
			serial_in_tb <= '1';
			wait for 10 us;
			serial_in_tb <= '0';
			wait for 100 us;
			keep_simulating <= '0';
			wait;
		end process;
end architecture;