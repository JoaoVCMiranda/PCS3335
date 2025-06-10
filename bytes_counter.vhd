library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity bytes_counter is
    port(
        clock, reset, clear, plus_one : in std_logic;
        counter_value : out unsigned(5 downto 0)
    );

end entity;

architecture behav of bytes_counter is
    signal count : unsigned(5 downto 0) := "000000";

    begin
        process(clock, clear, reset)
        begin
            if reset = '1' or clear = '1' then
                count <= "000000";
            elsif rising_edge(clock) then
                if plus_one = '1' then
                    count <= count + 1;
                end if;
            end if;
        end process;
    counter_value <= count;
end architecture;
