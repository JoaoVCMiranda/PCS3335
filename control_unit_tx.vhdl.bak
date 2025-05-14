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
	    out_clock : out std_logic
	);
end control_unit_tx;

architecture arch_tx of control_unit_tx is
	component ip_pll is
	port(
		refclk	: in std_logic := '0';
		rst	: in std_logic := '0';
		outclk_0: out std_logic;
		locked	: out std_logic
	);
	end component;
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
	    parity : in std_logic;
	    start  : in std_logic;
	    regControl : out std_logic_vector(1 downto 0);
	    serial_i : out std_logic
	);
	end component;
	component shift_reg is
	generic (WIDTH : natural := 8);
	port(
	    clock,reset : in std_logic;
	    loadOrShift : in std_logic_vector(1 downto 0);
	    serial_i: 	in  std_logic;				 
	    data_i:		in  std_logic_vector(WIDTH - 1 downto 0);
	    data_o:		out std_logic_vector(WIDTH-1 downto 0);	 
	    serial_o_r:	out std_logic;				 
	    serial_o_l:	out std_logic
	);
	end component;
	signal pll_clock	: std_logic;
	signal brg_clock 	: std_logic;
	signal super_clock	: std_logic;
	signal loadOrShift 	: std_logic_vector(1 downto 0);
	signal serial_i 	: std_logic;
	signal dados_tx		: std_logic;
	signal parity		: std_logic;
	------------ Alterar o BaudRate aqui caso seja necessário ------------ 
	signal div 		: integer := 12;
	signal div_vector	: std_logic_vector(15 downto 0);
begin
	out_clock <= brg_clock;
	--- Superamostargem
	super: baud_rate_generator
	port map(clock=>brg_clock, reset=>reset, divisor=>"0000000000010000", baudOut_n=>super_clock);
	--- Conexões de controle
	parity <= dados(0) xor 
		  dados(1) xor 
		  dados(2) xor 
		  dados(3) xor 
		  dados(4) xor 
		  dados(5) xor 
		  dados(6) xor 
		  dados(7);
	div_vector <= std_logic_vector(to_unsigned(div, 16));
	--- Saida principal
	sout <= dados_tx;
	--- Instâncias de componentes
	pll: ip_pll
	port map(refclk=>clock, rst=>reset, outclk_0=>pll_clock);
	BGR: baud_rate_generator
	port map(clock=>pll_clock, reset=>reset, divisor=>div_vector, baudOut_n=>brg_clock);
	TTC: transmitter_timing_control
	port map(clock=>super_clock, reset=>reset, parity=>parity, regControl=>loadOrShift, serial_i=>serial_i, start=>start);
	REG: shift_reg
	port map(clock=>super_clock, reset=>reset, loadOrShift=>loadOrShift, serial_i=>serial_i, data_i=>dados, serial_o_r=>dados_tx);
	
end arch_tx;
