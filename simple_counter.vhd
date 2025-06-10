library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity simple_counter is
    port(    
        clock, reset, start_count : in std_logic;
        finished_count : out std_logic
    );
end entity;

architecture behav of simple_counter is
    signal count : unsigned(3 downto 0) := "0000";

    begin
        process(clock, reset)
        begin   
            if reset = '1' then
                count <= (others => '0');
            elsif rising_edge(clock) then
                if start_count = '1' then
                    if count < "1111" then
                        count <= count + 1;
                        finished_count <= '0';
                    else
                        count <= "0000";
                        finished_count <= '1';
                    end if;
                end if;
            end if;
        end process;
    end architecture;
