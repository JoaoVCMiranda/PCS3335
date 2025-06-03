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
		select_btn : in std_logic; 
		vidas : out std_logic_vector(5 downto 0);
		tx_out : out std_logic
);
end entity;

architecture arch_forca of forca is
-- OUT CLOCK
signal out_clk : std_logic;


component ip_pll is
	port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		locked   : out std_logic         --  locked.export
	);
end component ip_pll;

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
		clock, reset : in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		guess : in std_logic_vector(7 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0);
        bad_guess : out std_logic := '0';
        transmission_start : in std_logic;
        transmission_over : out std_logic;
        serial_out : out std_logic;
        prepare_simple_regs : in std_logic;
        game_ready : in std_logic --sinal enviado pela UC para indicar que os regs estão prontos e o jogo começou
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
    comp_ok         : in unsigned(15 downto 0);
    combo           : out std_logic_vector(3 downto 0);
    total           : out std_logic_vector(11 downto 0);
    vidas           : out std_logic_vector(5 downto 0)
  ) ;
end component;

component tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(255 downto 0);
	    sout  : out std_logic;
      	ok    : out std_logic
	);
end component;

component telas is
	port(
        sel : in std_logic_vector(2 downto 0);
        st_line : out std_logic_vector(127 downto 0);
        nd_line : out std_logic_vector(127 downto 0)
    );
end component;

component FSM_main is
    port(
        clock, reset : in std_logic;
        start_bt, select_bt : in std_logic;
        transmission_on : out std_logic := '0';
        transmission_ok : in std_logic;
        victory_AND : in std_logic;
        failure_NAND : in std_logic;
        bad_guess : in std_logic;
        send_underlines, empty_guess : out std_logic
    );
end component;

component mega_register is
    port(
        clock, reset, load, transmission_on : in std_logic;
        data_in : in std_logic_vector(127 downto 0);
        serial_out : out std_logic := '1';
        transmission_ok_out : out std_logic := '0';
    );
end component;

signal lvl : std_logic_vector(1 downto 0);

signal tip :  std_logic_vector(127 downto 0);
signal word : std_logic_vector(127 downto 0);

signal proxima : std_logic := '0';

signal palpite : std_logic_vector(7 downto 0);

signal comparison_ok : unsigned(15 downto 0);
signal comparison_saved : std_logic_vector(15 downto 0);

signal combo : std_logic_vector(3 downto 0);
signal total_pontos : std_logic_vector(11 downto 0);

signal screen : std_logic_vector(255 downto 0);
signal sel : std_logic_vector(2 downto 0);


begin
	pll : ip_pll
	port map(clock, reset, out_clk);

	db: banco_palavras
	port map(out_clk, proxima, lvl,tip, word);

	comparador : reg_and_comp_system
	port map(out_clk, reset, proxima, word, palpite, comparison_ok, comparison_saved);

	seletor_letras : fsm_ascii_alphabet
	port map(out_clk, reset, seta_direita , start , palpite);

	pontos : Pontuacao
	port map(out_clk, reset, comparison_ok, combo, total_pontos,vidas);

	transmissor : tx
	port map(out_clk, reset, start, screen, tx_out);

	tela : telas
	port map(sel,1st_line, 2nd_line);

	screen <= 1st_line & 2nd_line;

end architecture;