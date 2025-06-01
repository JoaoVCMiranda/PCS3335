library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic;
		done: out std_logic
	);
end control_unit_tx;

architecture arch_tx of control_unit_tx is
	component baud_rate_generator is
	port(
	    clock : in std_logic;
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
    	);
	end component;
	component transmitter_timing_control is
		port(
			clock : in std_logic;
			reset : in std_logic;
			start  : in std_logic;
			regControl : out std_logic_vector(1 downto 0);
			serial_i : out std_logic;
			done	: out std_logic
		);
	end component;
	component shift_reg is
		generic(WIDTH:natural:=8);
		port(
			clock,reset : in std_logic;	
			loadOrShift : in std_logic_vector(1 downto 0);
			serial_i: 	in  std_logic;				 
			data_i:		in  std_logic_vector(WIDTH - 1 downto 0);
			serial_o_r:	out std_logic;				 
			serial_o_l:	out std_logic
		);
	end component;

	signal brg_clock 	: std_logic;
	signal super_clock	: std_logic;
	signal loadOrShift 	: std_logic_vector(1 downto 0);
	signal dados_tx		: std_logic;
	signal serial_i 	: std_logic;

	------------ Alterar o BaudRate aqui caso seja necessário ------------
	signal div 		: integer := 11;
	signal div_vector	: std_logic_vector(15 downto 0);
begin
	--- Saida principal
	sout <= dados_tx;

	--- Instâncias de componentes
	--- Conexões de controle
	div_vector <= std_logic_vector(to_unsigned(div, 16));
	BGR: baud_rate_generator
	port map(clock=>clock, reset=>reset, divisor=>div_vector, baudOut_n=>brg_clock);
	--- Superamostargem
	super: baud_rate_generator
	port map(clock=>brg_clock, reset=>reset, divisor=>"0000000000001111", baudOut_n=>super_clock);

	TTC: transmitter_timing_control
	port map(clock=>super_clock, reset=>reset, regControl=>loadOrShift, serial_i=>serial_i, start=>start, done=>done);
	
	REG: shift_reg
	port map(clock=>super_clock, reset=>reset, loadOrShift=>loadOrShift, serial_i=>serial_i, data_i=>dados, serial_o_r=>dados_tx);

end arch_tx;