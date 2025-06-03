--Seletor de dificuldade
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity difficulty_selector is
    port(
        clock, reset, select_bt, cursor_left, cursor_right : in std_logic;
        chosen_diff : out std_logic_vector(1 downto 0);
        current_difficulty : in std_logic_vector(1 downto 0)
    );
end entity;

architecture behav of difficulty_selector is

    process(select_bt)
    begin
        if select_bt = '1' and current_difficulty /= "00" then
            chosen_diff <= current_difficulty;
        end if;
    end process;

end architecture;