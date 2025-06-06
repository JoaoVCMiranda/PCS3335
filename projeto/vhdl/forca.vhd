library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forca is
	port(
		clock : in std_logic;
		reset : in std_logic;
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		btn_start : in std_logic;
		btn_select : in std_logic;
		vidas : out std_logic_vector(5 downto 0);
		display_pontos : out std_logic_vector(27 downto 0);
		tx_out : out std_logic
	);
end entity;

architecture arch_forca of forca is

component ip_pll_2 is
	port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		locked   : out std_logic         --  locked.export
	);
end component ip_pll_2;

component banco_palavras is
	port(
        next_word : in std_logic;
		lvl : in std_logic_vector(1 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0);
		word_size : out std_logic_vector(15 downto 0)
    );
end component;

component simple_comparator is
	port(
		guess : in std_logic_vector(7 downto 0);
        word : in std_logic_vector(127 downto 0);
		word_size : in std_logic_vector(15 downto 0);
        gravar : in std_logic := '0';
		palpites_anteriores : out std_logic_vector(127 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0);
        bad_guess : out std_logic := '0';
		visible_word : out std_logic_vector(127 downto 0);
		win : out std_logic := '0'
    );
end component;

component tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(255 downto 0);
	    sout  : out std_logic
	);
end component;

component telas is
	port(
        sel : in std_logic_vector(2 downto 0);
		palpite : in std_logic_vector(7 downto 0);
		word : in std_logic_vector(127 downto 0);
		tip : in std_logic_vector(127 downto 0);
		palpites_anteriores : in std_logic_vector(127 downto 0);
		screen : out std_logic_vector(255 downto 0)
    );
end component;


component simple_fsm is
    port(
        reset : in std_logic;
        start_bt, select_bt : in std_logic;
        sel_diff : out std_logic;  -- sinal para selecionar a dificuldade
        start_game : out std_logic;  -- sinal para iniciar o jogo
        lvl : in std_logic_vector(1 downto 0);
        contabilizar_rodada : out std_logic;
        -- pulso para quando deve ser feita a contabilização da rodada
        -- vidas
        -- pontuação e combo
        -- comparação e atualização da palavra visível

        vidas : in std_logic_vector(5 downto 0);
        win : in std_logic;
        tela : out std_logic_vector(2 downto 0)
    );
end component;

component simple_alphabet is
    port(
        seta_esquerda : in std_logic;
        seta_direita : in std_logic;
        letra_selecionada : out std_logic_vector(7 downto 0) := (others => '0');
        -- Sinal para indicar a letra selecionada
        reset : in std_logic
        -- Sinal de reset para reiniciar a seleção
    );
end component;

component simple_diff_sel is
	port(
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		dificuldade_selecionada : out std_logic_vector(1 downto 0) := "01";
		-- Sinal para indicar a dificuldade selecionada
		reset : in std_logic
		-- Sinal de reset para reiniciar a seleção
	);
end component;


-- OUT CLOCK
signal out_clk : std_logic;

-- Sinais do banco de palavras
signal tip :  std_logic_vector(127 downto 0);
signal word : std_logic_vector(127 downto 0);
signal lvl : std_logic_vector(1 downto 0);
signal word_size : std_logic_vector(15 downto 0);

-- Controle do comparador
signal palpite : std_logic_vector(7 downto 0);
signal palpites_anteriores : std_logic_vector(127 downto 0);
signal comparison_ok : unsigned(15 downto 0);
signal comparison_saved : std_logic_vector(15 downto 0);
signal visible_word : std_logic_vector(127 downto 0);


-- Telas
signal sel : std_logic_vector(2 downto 0) := "000";
signal screen : std_logic_vector(255 downto 0);

-- Sinais do sistema de pontuação
signal combo : std_logic_vector(3 downto 0);
signal total_pontos : std_logic_vector(11 downto 0);

-- Debug
signal fsm_main_current_state: std_logic_vector(4 downto 0);

-- Sinais da máquina de estados principal
signal contabilizar_rodada : std_logic := '0'; -- sinal para gravar o palpite

signal start_game : std_logic := '0'; -- sinal para iniciar o jogo

signal bad_guess: std_logic; 		-- o palpite não corresponde a nenhuma das letras da palavra

signal win : std_logic; -- sinal de vitória para a máquina de estados principal

begin

	pll : ip_pll
	port map(clock, reset, out_clk);
	--out_clk <= clock;

	db: banco_palavras
	port map(start_game, lvl,tip, word, word_size);

	tela : telas
	port map(sel, palpite, visible_word, tip, palpites_anteriores, screen);

	transmissor : tx
	port map(out_clk, reset, '1', screen, tx_out);

	comparador : simple_comparator
	port map(
		palpite,
		word,
		word_size,
		contabilizar_rodada,
		palpites_anteriores,
		comparison_ok,
		comparison_saved,
		bad_guess,
		visible_word,
		win
	);

	fsm_main: simple_fsm
	port map(
		reset,
		btn_start,
		btn_select,
		start_game,
		lvl,
		contabilizar_rodada,
		vidas,
		win,
		sel
	);
	letras : simple_alphabet
	port map(
		seta_esquerda,
		seta_direita,
		palpite,
		reset
	);

	dificulty_sel: simple_diff_sel
	port map(
		seta_esquerda,
		seta_direita,
		lvl,
		reset
	);


end architecture;