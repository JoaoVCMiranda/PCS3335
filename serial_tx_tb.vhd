library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture behav of tb is
    component serial_tx is
    port(
        clock, reset : in std_logic;
        start_transm : in std_logic;
        serial_out : out std_logic;
        current_state : out std_logic_vector(3 downto 0);
        data_in : in std_logic_vector(255 downto 0);
        debug_bytes_counter_value_out : out unsigned(5 downto 0)
    );
    end component;

    signal clock_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';
    signal start_transm_tb : std_logic := '0';
    signal serial_out_tb : std_logic := '0';
    signal current_state_tb : std_logic_vector(3 downto 0) := (others => '0');
    signal data_in_tb : std_logic_vector(255 downto 0) := (others => '0');
    signal debug_bytes_counter_value_out_tb : unsigned(5 downto 0);

    signal keepSimulating : std_logic := '0';

    begin
        clock_tb <= keepSimulating and not clock_tb after 1 us;
        DUT : serial_tx port map(clock_tb, reset_tb, start_transm_tb, serial_out_tb, current_state_tb, data_in_tb, debug_bytes_counter_value_out_tb);

        tests : process
        begin
            keepSimulating <= '1';

            --32 bytes 00001111 em sequência:
            data_in_tb <= "0000111100001111000011110000111100001111000011110000111100001111" &
                          "0000111100001111000011110000111100001111000011110000111100001111" &
                          "0000111100001111000011110000111100001111000011110000111100001111" &
                          "0000111100001111000011110000111100001111000011110000111100001111";
           
            
            wait for 10 us;
            
            start_transm_tb <= '1';
            wait for 5 us;
            --data_in_tb <= "1010101001010101";
            start_transm_tb <= '0';
            wait for 700 us;
            
            wait for 55 us;

            report("Success");
            keepSimulating <= '0';
            wait;
        end process;
    end architecture;