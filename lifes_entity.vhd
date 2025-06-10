library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity lifes_entity is
    port(
        clock, reset, preparing_game : in std_logic;
        lose_a_life : in std_logic;
        failure_detector : out std_logic;
        lifes_out : out std_logic_vector(5 downto 0)
    );
end entity;

architecture behav of lifes_entity is
    signal current_lifes : std_logic_vector(5 downto 0);
    signal counter : unsigned(2 downto 0) := "110";

    begin
        process(clock, reset, preparing_game)
        begin
            if reset = '1' or preparing_game = '1' then
                counter <= "110";
            elsif rising_edge(clock) then
                if lose_a_life = '1' then
                    counter <= counter - 1;
                end if;
            end if;
        end process;

    current_lifes <= "111111" when counter = "110" else
                        "111110" when counter = "101" else
                        "111100" when counter = "100" else
                        "111000" when counter = "011" else
                        "110000" when counter = "010" else
                        "100000" when counter = "001" else
                        "000000";
    failure_detector <= not(current_lifes(5) or current_lifes(4) or current_lifes(3) or
                            current_lifes(2) or current_lifes(1) or current_lifes(0));
    lifes_out <= current_lifes;
end architecture;
