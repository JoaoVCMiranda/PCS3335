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
		tx_out : out std_logic;
		PLL_OUT_CLK : OUT STD_LOGIC
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
        start_bt, select_bt, cursor_left, cursor_right : in std_logic;
        transmission_on : out std_logic;
        transmission_ok : in std_logic;
        victory_AND : in std_logic;
        failure_NOR : in std_logic;
        bad_guess : in std_logic;
        send_underlines : out std_logic;
        current_state : out std_logic_vector(4 downto 0);
        prepare_simple_regs : out std_logic;
        game_ready : out std_logic;
        load_mega_register : out std_logic;
        current_difficulty : out std_logic_vector(1 downto 0);
        lose_life, fill_lifes : out std_logic
    );
end component;

component reg_and_comp_system is
	port(
		clock, reset : in std_logic;
		data_in_main : in std_logic_vector(127 downto 0);
		guess : in std_logic_vector(7 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0);
        bad_guess : out std_logic := '0';
        transmission_start : in std_logic;
        transmission_over : out std_logic;
        serial_out : out std_logic;
        counter_value : out unsigned(6 downto 0);
        mega_reg_parallel_out : out std_logic_vector(127 downto 0);
        prepare_simple_regs : in std_logic;
        game_ready : in std_logic; --sinal enviado pela UC para indicar que os regs estão prontos e o jogo começou
        load_mega_register : in std_logic;
        simple_registers_out : out std_logic_vector(127 downto 0);
        send_underlines : in std_logic;
        victory_AND : out std_logic
    );
end component;

component lifes_entity is
    port(
        clock, reset, fill_lifes, lose_life : in std_logic;
        vidas : out std_logic_vector(5 downto 0);
        failure_NOR : out std_logic
    );
end component;

component difficulty_selector is
    port(
        clock, reset, select_bt, cursor_left, cursor_right : in std_logic;
        chosen_diff : out std_logic_vector(1 downto 0);
        current_difficulty : in std_logic
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
signal sel : std_logic_vector(2 downto 0) := "000";

signal start_tx: std_logic := '0';
signal prepare : std_logic := '0';
signal ready  : std_logic := '0';

signal st_line : std_logic_vector(127 downto 0);
signal nd_line : std_logic_vector(127 downto 0);

signal transmission_on : std_logic; -- Para inicar a transmissão
signal transmission_ok : std_logic; -- Indica que a transmissão foi concluida
signal victory_and : std_logic; -- detector de vitórias
signal failure_NOR : std_logic; -- detector de derrotas
signal fill_lifes: std_logic; 	-- resetar as vidas para total
signal lose_life: std_logic; 		-- ativado diminui uma vida
signal bad_guess: std_logic; 		-- o palpite não corresponde a nenhuma das letras da palavra
signal send_underlines: std_logic; -- setup do registrador de palavra no começo do jogo
signal fsm_main_current_state: std_logic_vector(4 downto 0);
signal deprecated_transmission_start :std_logic;
signal deprecated_transmission_over :std_logic;
signal deprecated_serial_out :std_logic;
signal deprecated_counter_value: std_logic_vector(5 downto 0);
signal debug_mega_reg_pararelo: std_logic_vector(127 downto 0);
signal debug_simple_registers_out : std_logic_vector(127 downto 0);
signal prepare_simple_regs:std_logic;
signal load_mega_register : std_logic;
signal game_ready : std_logic;


begin
	pll : ip_pll
	port map(clock, reset, out_clk);

	db: banco_palavras
	port map(out_clk, proxima, lvl,tip, word);


	seletor_letras : fsm_ascii_alphabet
	port map(out_clk, reset, seta_direita , start , palpite);

	pontos : Pontuacao
	port map(out_clk, reset, comparison_ok, combo, total_pontos,vidas);

	transmissor : tx
	port map(out_clk, reset, transmission_on , screen, tx_out, transmission_ok);

	tela : telas
	port map(sel,st_line, nd_line);

	maquina_estados : FSM_main
	-- mapear reset para chave SW1
	port map(
		out_clk,
		reset,
		start,
		select_btn,
		seta_esquerda,
		seta_direita,
		transmission_on,
		transmission_ok,
		victory_and, -- mapear para o sistema de comparação [check]
		failure_nor, -- mapear para entidade de vidas
		bad_guess,
		send_underlines,
		fsm_main_current_state,
		prepare_simple_regs, -- equivale ao send_underlines
		ready, -- sinal de condicional para ativar os registradores de palavras de acordo com o comp_saved
		load_mega_register, -- enable mega_register quandos os palpites forem feitos
		lvl, -- saida seletor dificuldade
		lose_life,
		fill_lifes
	);

	sistema_comparacao : reg_and_comp_system
	port map(
		out_clk,
		reset,
		word,
		palpite,
		comparison_ok,
		comparison_saved,
		bad_guess,
		deprecated_transmission_start,
		deprecated_transmission_over,
		deprecated_serial_out,
		deprecated_counter_value,
		debug_mega_reg_pararelo,
		prepare_simple_regs,
    game_ready, --sinal enviado pela UC para indicar que os regs estão prontos e o jogo começou
    load_mega_register,
    debug_simple_registers_out,
    send_underlines,
    victory_AND
	);

	contole_vidas: lifes_entity
	port map(
        clock,
				reset,
				fill_lifes,
				lose_life,
        vidas,
        failure_NOR
	);

	seletor_lvl: difficulty_selector
	port map(
		out_clk,
		reset,
		select_btn,
		seta_esquerda,
		seta_direita
	);

end architecture;