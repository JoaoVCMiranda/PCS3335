library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forca is
	port(
		clock : in std_logic;
		reset : in std_logic;
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		start : in std_logic;
		seg_up : out std_logic_vector(6 downto 0);
		seg_down : out std_logic_vector(6 downto 0);
		vidas : out std_logic_vector(5 downto 0);
		tx : out std_logic;
		rx : in std_logic
);
end entity;

architecture arch_forca of forca is 
-- OUT CLOCK
signal out_clk : std_logic;

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

component banco_palavras is
	port(
        clock : in std_logic;
        en : in std_logic;
        lvl : in std_logic_vector(1 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0)
    );
end component;

component reg_and_comp_system is
	port(
		clock, reset, clear : in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		guess : in std_logic_vector(7 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0)
    );
end component;

component fsm_ascii_alphabet is
    Port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        switch_let  : in  std_logic;
        sel         : in  std_logic;
        ascii       : out std_logic_vector(7 downto 0)
    );
end component;

component Pontuacao is
  port (
    clk             : in std_logic;
    rst             : in std_logic;
    comp_ok         : in std_logic_vector(15 downto 0);
    combo           : out std_logic_vector(3 downto 0);
    total           : out std_logic_vector(11 downto 0);
    vidas           : out std_logic_vector(5 downto 0)
  ) ;
end component;

signal lvl : std_logic_vector(1 downto 0);

signal tip : out std_logic_vector(127 downto 0);
signal word : out std_logic_vector(127 downto 0)

signal proxima : std_logic := '0';

signal palpite : std_logic(7 downto 0);

signal comparison_ok : std_logic_vector(15 downto 0);
signal compariton_saved : std_logic_vector(15 downto 0);

signal combo : std_logic_vector(3 downto 0);
signal total_pontos : std_logic_vector(11 downto 0);


begin
	pll : ip_pll
	port map(clock, reset, out_clk);

	db: banco_palavras
	port map(out_clk, proxima, lvl,tip, word);

	comparador : reg_and_comp_system
	port map(out_clk, reset, proxima, word, comparison_ok, comparison_saved);

	seletor_letras : fsm_ascii_alphabet
	port map(out_clk, reset, seta_direita , start , palpite);

	pontos : Pontuacao
	port map(out_clk, reset, comparison_ok, combo, total_pontos,vidas);

end architecture;