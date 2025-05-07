--TB do Top level do receptor pré-experiência 7
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture arch of tb is
	component exp6 is
	port(
		pre_BRG_clock, reset : in std_logic;
		serial_in : in std_logic;
		uc_currentState : out unsigned(3 downto 0);
		sevensegment_left, sevensegment_right : out std_logic_vector(6 downto 0);
		uc_counter_viewer : out unsigned(3 downto 0);
		rsr_counter_viewer : out unsigned(3 downto 0);
		parity_led : out std_logic;
		BRG_clock_out_viewer : out std_logic;
		parallel_out : out std_logic_vector(7 downto 0)		
	);
	end component;
	
	signal pre_BRG_clock_tb : std_logic := '0';
	signal reset_tb : std_logic := '0';
	signal serial_in_tb : std_logic := '1';
	signal uc_currentState_tb : unsigned(3 downto 0) := (others => '0');
	signal sevensegment_left_tb : std_logic_vector(6 downto 0) := (others => '0');
	signal sevensegment_right_tb: std_logic_vector(6 downto 0) := (others => '0');
	signal uc_counter_viewer_tb : unsigned(3 downto 0);
	signal rsr_counter_viewer_tb : unsigned(3 downto 0);
	signal parity_led_tb : std_logic := '0';
	signal BRG_clock_out_viewer_tb : std_logic := '0';
	signal parallel_out_tb : std_logic_vector(7 downto 0);
	
	
	signal keepSimulating : std_logic := '0';
	
	begin
		DUT : exp6 port map(pre_BRG_clock_tb, reset_tb, serial_in_tb, uc_currentState_tb, sevensegment_left_tb, sevensegment_right_tb, uc_counter_viewer_tb, rsr_counter_viewer_tb, parity_led_tb, BRG_clock_out_viewer_tb, parallel_out_tb);
		pre_BRG_clock_tb <= keepSimulating and not pre_BRG_clock_tb after 271 ns; -- frequência aprox. 1,84502 MHz
		
		tests : process
		begin
			keepSimulating <= '1';
			wait for 10 us;
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '1';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us;
			serial_in_tb <= '1';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us;
			serial_in_tb <= '0';
			
			wait for 104 us; 
			serial_in_tb <= '1';
			
			wait for 104 us; --stop bit
			
			wait for 1 ms;
			
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '1';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '1';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '1';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '1';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '0';
			
			wait for 104 us; --16 ciclos de clock
			serial_in_tb <= '0';
			
			wait for 104 us; --stop bit
			serial_in_tb <= '1';
			wait for 1 ms;
			report("Ok");
			keepSimulating <= '0';
			wait;
		end process;
end architecture;
			
		