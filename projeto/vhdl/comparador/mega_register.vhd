--mega registrador de 128 bits, com entrada paralela e saída serial

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity mega_register is
    port(
        clock, reset, load, transmission_on : in std_logic;
        data_in : in std_logic_vector(127 downto 0);
        serial_out : out std_logic := '1';
        transmission_ok_out : out std_logic := '0';
        counter_value : out unsigned(6 downto 0) := (others => '0');
        parallel_out : out std_logic_vector(127 downto 0)
    );
end entity;

architecture behav of mega_register is
    component simple_counter is
    port(
        clock, reset : in std_logic;
        start_count : in std_logic;
        count_ok : out std_logic;
        count_value : out unsigned(6 downto 0)
    );
    end component;

    signal loaded_data : std_logic_vector(127 downto 0) := (others => '0');
    signal transmission_ok : std_logic := '0';

    begin
        counter : simple_counter port map(clock, reset, transmission_on, transmission_ok, counter_value);

        load_data : process(clock, reset, load)
        begin
            if reset = '1' then
                serial_out <= '1';

            elsif rising_edge(clock) then
                if load = '1' then
                    loaded_data <= data_in;
                end if;
            end if;
        end process;
        transmission_ok_out <= transmission_ok;
        parallel_out <= loaded_data;
    end architecture;
