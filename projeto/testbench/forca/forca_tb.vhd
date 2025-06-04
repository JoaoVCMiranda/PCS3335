library ieee;
use ieee.std_logic_1164.all;

entity forca_tb is
end forca_tb;

architecture behavior of forca_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component forca
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
    end component;

    -- Testbench signals
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal seta_esquerda : std_logic := '0';
    signal seta_direita : std_logic := '0';
    signal select_btn : std_logic := '0';
    signal start : std_logic := '0';
    signal vidas : std_logic_vector(5 downto 0);
    signal tx_out : std_logic;

    -- Clock period (T = 1 / f)
    constant clock_period : time := 1 sec / 1.8432e6;

begin

    clock <= ((not clock) and keep_simulating) after clock_period/2;

    -- Instantiate the Unit Under Test (UUT)
    uut: forca
    port map(
        clock => clock,
        reset => reset,
        seta_esquerda => seta_esquerda,
        seta_direita => seta_direita,
        select_btn => select_btn,
        start => start,
        vidas => vidas,
        tx_out => tx_out
    );

    -- Stimulus process
    stimulus_process: process
    begin
        reset <= '1';
        wait for 1 us;
        reset <= '0';
        start <= '1';
        wait for 1 us;
        start <= '0';
        wait for 1 us;
        select_btn <= '1';
        wait for 1 us;
        selet_btn <= '0';
        wait for 1 us;


        wait;
    end process;

end behavior;
