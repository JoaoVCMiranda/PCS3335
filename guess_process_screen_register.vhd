library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity guess_process_screen_register is --guarda o que vai para a segunda linha do LCD no momento de escolha da letra-palpite
    port(
        guess : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(127 downto 0)
    );
end entity;

architecture behav of guess_process_screen_register is
    begin
        data_out <= "0010000001001100011001010111010001110010011000010011101000100000001111000010110100100000" &
                    guess(7 downto 0) & "00100000001011010011111000100000";

                    -- Letra: <- [guess] ->
end architecture;