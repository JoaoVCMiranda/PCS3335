library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forca is
	port(
		clock : in std_logic;
		reset : in std_logic;
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		seg_up : out std_logic_vector(6 downto 0);
		seg_down : out std_logic_vector(6 downto 0);
		vidas : out std_logic_vector(9 downto 0);
		tx : out std_logic;
		rx : in std_logic
);
end entity;

architecture arch_forca of forca is 
-- OUT CLOCK
signal out_clk : std_logic;
-- Letra signal
--signal letra_seg_up : out std_logic_vector(6 downto 0);
--signal letra_seg_down : out std_logic_vector(6 downto 0);


component display_letra is
	port(
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		seg_up : out std_logic_vector(6 downto 0);
		seg_down : out std_logic_vector(6 downto 0)
	);
end component;

component ip_pll is
	port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		locked   : out std_logic         --  locked.export
	);
end component ip_pll;

component not_uart is
	port(
		clock : in std_logic;
		reset : in std_logic;
		baudout : out std_logic;
		D : 	in std_logic_vector(7 downto 0);
		rd: in std_logic;
		-- WR
		wr: in std_logic;
		-- Tem uma nova mensagem pra vc!
		rxrdy: out std_logic;
		-- Mensagem enviada!
		txrdy: out std_logic;
		-- SIN
		rx: in std_logic;
		-- SOUT
		tx: out std_logic
	);
end component;

begin
	ippll : ip_pll
	port map(clock, reset, out_clk);

	letra : display_letra 
	port map(seta_esquerda, seta_direita, seg_up, seg_down);

end architecture;