library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity simple_counter is
    port(
        clock, reset : in std_logic;
        start_count : in std_logic;
        count_ok : out std_logic := '0'
    );
end entity;

architecture behav of simple_counter is
    signal count : unsigned(6 downto 0) := (others => '0');
    signal count_ok_signal : std_logic := '0';
    begin
        counting : process(reset, clock, start_count)
        begin
            if reset = '1' then
                count <= (others => '0');
            elsif rising_edge(clock) then
                if start_count = '1' then
                    if count < "1111111" then
                        count <= count + 1;
                        count_ok_signal <= '0';
                    else
                        count <= (others => '0');
                        count_ok_signal <= '1';
                    end if;
                end if;
            end if;
        end process;
    count_ok <= count_ok_signal;
end architecture;
    