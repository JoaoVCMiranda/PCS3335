
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity lifes_entity is
    port(
        clock, reset, fill_lifes, lose_life : in std_logic;
        current_lifes : out std_logic_vector(5 downto 0);
        failure_NOR : out std_logic
    );
end entity;

architecture behav of lifes_entity is
    
    signal counter : unsigned(3 downto 0) := "0110";
    signal current_lifes_signal : std_logic_vector(5 downto 0);
    begin
        process(clock, reset)
        begin
            if reset = '1' then
                current_lifes_signal <= "111111";
                counter <= "0110";
            elsif rising_edge(clock) then
                if fill_lifes = '1' then
                    current_lifes_signal <= "111111";
                    counter <= "0110";
                else
                    current_lifes_signal(5 downto 0) <=
                        "111111" when counter = "0110" else
                        "111110" when counter = "0101" else
                        "111100" when counter = "0100" else
                        "111000" when counter = "0011" else
                        "110000" when counter = "0010" else
                        "100000" when counter = "0001" else
                        "000000";
                end if;

                if lose_life = '1' and counter > "0000" then
                    counter <= counter - 1;
                end if;

            end if;
        end process;


        failure_NOR <= not (current_lifes_signal(5) or current_lifes_signal(4) or current_lifes_signal(3) or current_lifes_signal(2) or 
                            current_lifes_signal(1) or current_lifes_signal(0));
        current_lifes <= current_lifes_signal;
    end architecture;