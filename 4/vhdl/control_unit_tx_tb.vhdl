library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tx_tb is
end control_unit_tx_tb;

architecture arch_testbench of control_unit_tx_tb is
	component control_unit_tx is
	port (
	    -- Verificar o clock
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic;
	    -- DEBUG
	    -- SAIDA DO BAUD_GATE (BDS)
	    out_clock : out std_logic
	    -- SAIDA DO TRANSMISSOR TSMC
	    -- clock de debug
	);
	end component;
	signal refclk: std_logic := '0';
	signal clock : std_logic;
	signal reset : std_logic := '0';
	signal start : std_logic;
	signal dados : std_logic_vector(7 downto 0);
	signal sout  : std_logic;

	---------- Configurações do clock ----------
	constant clockPeriod : time := 2 us; -- para 50MHz
	signal keep_simulating : std_logic := '1';

begin
	refclk <= (not refclk) after clockPeriod/2 when keep_simulating = '1' else '0';
	--PLL : ip_pll
	--port map(refclk=>refclk, rst=>reset, outclk_0=>clock);
	CTX : control_unit_tx
	port map(clock=>refclk, reset=>reset, start=>start, dados=>dados, sout=>sout);
	--port map(clock=>clock, reset=>reset, start=>start, dados=>dados, sout=>sout);

	process is
	begin
    		assert false report "--- INITESTBENCH ---" severity note;
		---------- ZERAR  ----------
		--reset <= '0';
		---------- CASO 1 ----------  
		-- Carregar os dados
		wait for 1714 us;
		dados <= "01001010";
		-- Mandar o pulso de inicio
		start <= '1';
		wait for 2 us;
		start <= '0';
		wait for 60110 us;
		dados<= "01101111";
		wait for 77 ms;

		reset <= '1';
	        wait for 2 us;
		reset <= '0';
	        wait for 30 us;
		keep_simulating <= '0';
    		assert false report "--- FIMTESTBENCH ---" severity note;
		wait;
	end process;

end arch_testbench;

