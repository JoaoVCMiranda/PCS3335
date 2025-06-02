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
			done: out std_logic;
			current_state : out std_logic_vector(3 downto 0)
	);
end control_unit_tx;

architecture arch_tx of control_unit_tx is

	component transmitter_timing_control is
		port(
			clock : in std_logic;
			reset : in std_logic;
			start  : in std_logic;
			regControl : out std_logic_vector(1 downto 0);
			serial_i : out std_logic;
			done	: out std_logic;
			current_state : out std_logic_vector(3 downto 0)
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


	signal loadOrShift 	: std_logic_vector(1 downto 0);
	signal dados_tx		: std_logic;
	signal serial_i 	: std_logic;


begin
	--- Saida principal
	sout <= dados_tx;

	TTC: transmitter_timing_control
	port map(clock=>clock, reset=>reset, regControl=>loadOrShift, serial_i=>serial_i, start=>start, done=>done, current_state=>current_state);

	REG: shift_reg
	port map(clock=>clock, reset=>reset, loadOrShift=>loadOrShift, serial_i=>serial_i, data_i=>dados, serial_o_r=>dados_tx);

end arch_tx;