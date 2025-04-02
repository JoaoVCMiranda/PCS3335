library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tx_tb is
end control_unit_tx_tb;

architecture arch_testbench of control_unit_tx_tb is
	component ip_pll is
	port (
	    refclk 	: in std_logic;
	    rst 	: in std_logic;
	    outclk_0	: out std_logic;
	    locked 	: out std_logic
	);
	end component;
	
	component tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic
	);
	end component;
	signal refclk: std_logic;
	signal clock : std_logic;
	signal reset : std_logic;
	signal start : std_logic;
	signal dados : std_logic_vector(7 downto 0);
	signal sout  : std_logic;

	---------- Configurações do clock ----------
	constant clockPeriod : time := 2 us; -- para 50MHz

begin
	refclk <= (not refclk) after clockPeriod/2;
	PLL : ip_pll
	port map(refclk=>refclk, rst=>reset, outclk_0=>clock);
	CTX : tx
	port map(clock=>clock, reset=>reset, start=>start, dados=>dados, sout=>sout);

	process is
	begin
    		assert false report "--- TESTBENCH ---" severity note;
    		--keep_simulating <= '1';
		---------- CASO 1 ----------  
		-- Enviar o seguinte bit vector 
		-- "01001010"
		dados <= "01001010";
		start <= '1';
		wait for 300 us;
    		--keep_simulating <= '0';

    		assert false report "--- FIMTESTBENCH ---" severity note;
	end process;

end arch_testbench;

