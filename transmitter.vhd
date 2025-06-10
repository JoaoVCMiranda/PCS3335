library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

--top level do transmissor do projeto
entity transmitter is
    port(
        clock, reset : in std_logic;
        serial_out : out std_logic;
        data_in : in std_logic_vector(255 downto 0);

        --debug:
        transm_current_state : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behav of transmitter is
    
    component serial_tx is
    port(
        clock, reset : in std_logic;
        serial_out : out std_logic;
        data_in : in std_logic_vector(255 downto 0);

        --debug:
        transm_current_state : out std_logic_vector(3 downto 0)
    );
    end component;

    component BRG is
	port(
		clock_in, reset : in std_logic;
		clock_out : out std_logic := '0';
		divisor : in std_logic_vector(15 downto 0) --Se divisor for um n ímpar, a divisão do clock será de fator n - 1
	);
    end component;

    component clock_div_counter is
	port(
		clock, reset : in std_logic;
		clock_out : out std_logic := '0' --Para obter o baud rate de 9600 bps
	);
    end component;

    signal clock_pre_brg2, clock_post_brg2 : std_logic;

    begin
        baudrate1 : brg port map(clock, reset, clock_pre_brg2, "0000000000001100");
        baudrate2 : brg port map(clock_pre_brg2, reset, clock_post_brg2,"0000000000010000");
        s_tx : serial_tx port map(clock_post_brg2, reset, serial_out, data_in, transm_current_state);
end architecture;