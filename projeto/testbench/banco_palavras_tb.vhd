library ieee;
use ieee.std_logic_1164.all;

-- A entidade do testbench não possui portas, pois é um ambiente de teste autocontido.
entity banco_palavras_tb is
end entity banco_palavras_tb;

architecture behavioral of banco_palavras_tb is

    -- Declaração do componente que será testado (Unit Under Test - UUT)
    component banco_palavras is
        port(
            clock       : in std_logic;
            en          : in std_logic;
            lvl         : in std_logic_vector(1 downto 0);
            binary_tip  : out std_logic_vector(127 downto 0);
            binary_word : out std_logic_vector(127 downto 0)
        );
    end component;

    -- Constantes para a geração do clock
    constant CLOCK_FREQ_MHZ    : real := 1.843198; -- Frequência do clock em MHz
    constant CLOCK_PERIOD      : time := 1.0 / CLOCK_FREQ_MHZ * 1 us; -- Período do clock em us
    constant CLOCK_HALF_PERIOD : time := CLOCK_PERIOD / 2;           -- Meio período do clock

    -- Sinais internos do testbench que se conectarão aos portos do UUT
    signal tb_clock       : std_logic := '0'; -- Sinal de clock, inicializado em '0'
    signal tb_en          : std_logic := '0'; -- Sinal de enable
    signal tb_lvl         : std_logic_vector(1 downto 0) := (others => '0'); -- Sinal de nível

    -- Sinais de saída do UUT (observados no testbench)
    signal tb_binary_tip  : std_logic_vector(127 downto 0);
    signal tb_binary_word : std_logic_vector(127 downto 0);

begin

    -- Instanciação do componente 'banco_palavras' (UUT)
    uut: banco_palavras
    port map (
        clock       => tb_clock,
        en          => tb_en,
        lvl         => tb_lvl,
        binary_tip  => tb_binary_tip,
        binary_word => tb_binary_word
    );

    -- Processo de Geração de Clock
    -- Gera um sinal de clock contínuo com o período calculado.
    clock_gen_process : process
    begin
        loop
            tb_clock <= '0';
            wait for CLOCK_HALF_PERIOD; -- Espera por meio período
            tb_clock <= '1';
            wait for CLOCK_HALF_PERIOD; -- Espera por meio período
        end loop;
    end process clock_gen_process;

    -- Processo de Estímulo
    -- Aplica valores de entrada ao UUT para testar seu comportamento.
    stimulus_process : process
    begin
        -- Estado inicial: en desabilitado, lvl em "00"
        tb_en <= '0';
        tb_lvl <= "01";
        wait for CLOCK_PERIOD * 5; -- Espera 5 ciclos de clock para estabilização

        -- Teste 1: Habilita e muda o nível
        report "Aplicando EN = '1', LVL = '01'" severity note;
        tb_en <= '1';
        wait for CLOCK_PERIOD * 3;
        tb_en <= '0';

        report "Mudando LVL para '10'" severity note;
        tb_lvl <= "10";
        wait for CLOCK_PERIOD * 3;

        report "Mudando LVL para '11'" severity note;
        tb_lvl <= "11";
        wait for CLOCK_PERIOD * 3;

        -- Teste 3: Muda para próxima palavra
        report "Aplicando EN = '1', LVL = '11'" severity note;
        tb_en <= '1';
        wait for CLOCK_PERIOD * 5;
        tb_en <= '0';

        wait for CLOCK_PERIOD * 1;
        tb_en <= '1';

        wait for CLOCK_PERIOD * 6;
        tb_en <= '0';
        wait for CLOCK_PERIOD * 6;
        tb_en <= '1';

        -- Fim da simulação
        report "Simulação do banco_palavras_tb concluída." severity note;
        wait; -- Mantém o processo parado, finalizando a simulação.
    end process stimulus_process;

end architecture behavioral;