--screens_register2: armazena a segunda linha da vitória e da derrota
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity screens_register2 is
    port(
        victory_detector, failure_detector : in std_logic;
        code_out : out std_logic_vector(127 downto 0)
    );
end entity;

architecture behav of screens_register2 is
    begin
        code_out <= "0010000000100000001000000100011001001001010011010010000001000100" &
                    "0100010100100000010010100100111101000111010011110010000000100000" when failure_detector = '1' else
                    
                    "0010000000100000010101100100111101000011010001010010000001010110" &
                    "0100010101001110010000110100010101010101001000010010000000100000" when victory_detector = '1' else

                    "0000000000000000000000000000000000000000000000000000000000000000" &
                    "0000000000000000000000000000000000000000000000000000000000000000";
end architecture;
