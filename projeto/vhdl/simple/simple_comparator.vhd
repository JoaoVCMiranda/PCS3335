-- Sistema de comparação simples
-- Este sistema compara um vetor de 128 bits com um palpite de 8 bits.
-- Se o palpite corresponder a um dos 16 blocos de 8 bits do vetor, o bit correspondente no vetor de comparação será '1'.
-- O sistema também possui um registro mega que armazena os dados de entrada e permite a transmissão serial.
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity simple_comparator is
	port(
		guess : in std_logic_vector(7 downto 0);
        word : in std_logic_vector(127 downto 0);
        word_size : in std_logic_vector(15 downto 0);      
        gravar : in std_logic := '0';
        new_game : in std_logic := '0';
        palpites_anteriores : out std_logic_vector(127 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0);
        bad_guess : out std_logic := '0';
        visible_word : out std_logic_vector(127 downto 0);
        win : out std_logic := '0'
    );
end entity;

architecture behav of simple_comparator is
    signal comps_saved : std_logic_vector(15 downto 0) := (others => '0');
    signal comp_OK : std_logic_vector(15 downto 0);
    -- Registrador de 128 bits
    signal reg128 : std_logic_vector(127 downto 0) := "00111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111"; 
    signal visible_word_internal : std_logic_vector(127 downto 0) := "01011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111";
    
    begin
       process(new_game)
        begin
            if falling_edge(new_game) then
                reg128 <= "00111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111001111110011111100111111";
                
                comps_saved <= (others => '0');
                visible_word_internal(127 downto 120) <=('0' and word_size(15)) & 
                                                        ('1' and word_size(15)) & 
                                                        ('0' and word_size(15)) & 
                                                        ('1' and word_size(15)) & 
                                                        ('1' and word_size(15)) & 
                                                        ('1' and word_size(15)) & 
                                                        ('1' and word_size(15)) & 
                                                        ('1' and word_size(15));

                visible_word_internal(119 downto 112) <=('0' and word_size(14)) & 
                                                        ('1' and word_size(14)) & 
                                                        ('0' and word_size(14)) & 
                                                        ('1' and word_size(14)) & 
                                                        ('1' and word_size(14)) & 
                                                        ('1' and word_size(14)) & 
                                                        ('1' and word_size(14)) & 
                                                        ('1' and word_size(14));

                visible_word_internal(111 downto 104) <=('0' and word_size(13)) & 
                                                        ('1' and word_size(13)) & 
                                                        ('0' and word_size(13)) & 
                                                        ('1' and word_size(13)) & 
                                                        ('1' and word_size(13)) & 
                                                        ('1' and word_size(13)) & 
                                                        ('1' and word_size(13)) & 
                                                        ('1' and word_size(13));

                visible_word_internal(103 downto 96) <= ('0' and word_size(12)) & 
                                                        ('1' and word_size(12)) & 
                                                        ('0' and word_size(12)) & 
                                                        ('1' and word_size(12)) & 
                                                        ('1' and word_size(12)) & 
                                                        ('1' and word_size(12)) & 
                                                        ('1' and word_size(12)) & 
                                                        ('1' and word_size(12));

                visible_word_internal(95 downto 88) <=  ('0' and word_size(11)) & 
                                                        ('1' and word_size(11)) & 
                                                        ('0' and word_size(11)) & 
                                                        ('1' and word_size(11)) & 
                                                        ('1' and word_size(11)) & 
                                                        ('1' and word_size(11)) & 
                                                        ('1' and word_size(11)) & 
                                                        ('1' and word_size(11));

                visible_word_internal(87 downto 80) <=  ('0' and word_size(10)) & 
                                                        ('1' and word_size(10)) & 
                                                        ('0' and word_size(10)) & 
                                                        ('1' and word_size(10)) & 
                                                        ('1' and word_size(10)) & 
                                                        ('1' and word_size(10)) & 
                                                        ('1' and word_size(10)) & 
                                                        ('1' and word_size(10));

                visible_word_internal(79 downto 72) <=  ('0' and word_size(9)) & 
                                                        ('1' and word_size(9)) & 
                                                        ('0' and word_size(9)) & 
                                                        ('1' and word_size(9)) & 
                                                        ('1' and word_size(9)) & 
                                                        ('1' and word_size(9)) & 
                                                        ('1' and word_size(9)) & 
                                                        ('1' and word_size(9));

                visible_word_internal(71 downto 64) <=  ('0' and word_size(8)) & 
                                                        ('1' and word_size(8)) & 
                                                        ('0' and word_size(8)) & 
                                                        ('1' and word_size(8)) & 
                                                        ('1' and word_size(8)) & 
                                                        ('1' and word_size(8)) & 
                                                        ('1' and word_size(8)) & 
                                                        ('1' and word_size(8));

                visible_word_internal(63 downto 56) <=  ('0' and word_size(7)) & 
                                                        ('1' and word_size(7)) & 
                                                        ('0' and word_size(7)) & 
                                                        ('1' and word_size(7)) & 
                                                        ('1' and word_size(7)) & 
                                                        ('1' and word_size(7)) & 
                                                        ('1' and word_size(7)) & 
                                                        ('1' and word_size(7));

                visible_word_internal(55 downto 48) <=  ('0' and word_size(6)) & 
                                                        ('1' and word_size(6)) & 
                                                        ('0' and word_size(6)) & 
                                                        ('1' and word_size(6)) & 
                                                        ('1' and word_size(6)) & 
                                                        ('1' and word_size(6)) & 
                                                        ('1' and word_size(6)) & 
                                                        ('1' and word_size(6));

                visible_word_internal(47 downto 40) <=  ('0' and word_size(5)) & 
                                                        ('1' and word_size(5)) & 
                                                        ('0' and word_size(5)) & 
                                                        ('1' and word_size(5)) & 
                                                        ('1' and word_size(5)) & 
                                                        ('1' and word_size(5)) & 
                                                        ('1' and word_size(5)) & 
                                                        ('1' and word_size(5));

                visible_word_internal(39 downto 32) <=  ('0' and word_size(4)) & 
                                                        ('1' and word_size(4)) & 
                                                        ('0' and word_size(4)) & 
                                                        ('1' and word_size(4)) & 
                                                        ('1' and word_size(4)) & 
                                                        ('1' and word_size(4)) & 
                                                        ('1' and word_size(4)) & 
                                                        ('1' and word_size(4));

                visible_word_internal(31 downto 24) <=  ('0' and word_size(3)) & 
                                                        ('1' and word_size(3)) & 
                                                        ('0' and word_size(3)) & 
                                                        ('1' and word_size(3)) & 
                                                        ('1' and word_size(3)) & 
                                                        ('1' and word_size(3)) & 
                                                        ('1' and word_size(3)) & 
                                                        ('1' and word_size(3));

                visible_word_internal(23 downto 16) <=  ('0' and word_size(2)) & 
                                                        ('1' and word_size(2)) & 
                                                        ('0' and word_size(2)) & 
                                                        ('1' and word_size(2)) & 
                                                        ('1' and word_size(2)) & 
                                                        ('1' and word_size(2)) & 
                                                        ('1' and word_size(2)) & 
                                                        ('1' and word_size(2));

                visible_word_internal(15 downto 8) <=   ('0' and word_size(1)) & 
                                                        ('1' and word_size(1)) & 
                                                        ('0' and word_size(1)) & 
                                                        ('1' and word_size(1)) & 
                                                        ('1' and word_size(1)) & 
                                                        ('1' and word_size(1)) & 
                                                        ('1' and word_size(1)) & 
                                                        ('1' and word_size(1));

                visible_word_internal(7 downto 0) <=    ('0' and word_size(0)) & 
                                                        ('1' and word_size(0)) & 
                                                        ('0' and word_size(0)) & 
                                                        ('1' and word_size(0)) & 
                                                        ('1' and word_size(0)) & 
                                                        ('1' and word_size(0)) & 
                                                        ('1' and word_size(0)) & 
                                                        ('1' and word_size(0));

            end if;
        end process;

        process(gravar)
        begin
            if rising_edge(gravar) then
                reg128 <= reg128(119 downto 0) & guess; -- Desloca 8 bits para a esquerda e insere guess nos LSBs
                -- Atualiza o vetor de comparação
                comps_saved <= 
                    (comp_OK(15) or comps_saved(15)) &
                    (comp_OK(14) or comps_saved(14)) &
                    (comp_OK(13) or comps_saved(13)) &
                    (comp_OK(12) or comps_saved(12)) &
                    (comp_OK(11) or comps_saved(11)) &
                    (comp_OK(10) or comps_saved(10)) &
                    (comp_OK(9) or comps_saved(9)) &
                    (comp_OK(8) or comps_saved(8)) &
                    (comp_OK(7) or comps_saved(7)) &
                    (comp_OK(6) or comps_saved(6)) &
                    (comp_OK(5) or comps_saved(5)) &
                    (comp_OK(4) or comps_saved(4)) &
                    (comp_OK(3) or comps_saved(3)) &
                    (comp_OK(2) or comps_saved(2)) &
                    (comp_OK(1) or comps_saved(1)) &
                    (comp_OK(0) or comps_saved(0));

                visible_word_internal(127 downto 120) <=((comp_OK(15) and (guess(7) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(127)))) & 
                                                        ((comp_OK(15) and (guess(6) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(126)))) & 
                                                        ((comp_OK(15) and (guess(5) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(125)))) & 
                                                        ((comp_OK(15) and (guess(4) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(124)))) & 
                                                        ((comp_OK(15) and (guess(3) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(123)))) & 
                                                        ((comp_OK(15) and (guess(2) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(122)))) & 
                                                        ((comp_OK(15) and (guess(1) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(121)))) & 
                                                        ((comp_OK(15) and (guess(0) and comp_OK(15))) or (not (comp_OK(15) and visible_word_internal(120))));

                visible_word_internal(119 downto 112) <= ((comp_OK(14) and (guess(7) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(119)))) &
                                                          ((comp_OK(14) and (guess(6) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(118)))) &
                                                          ((comp_OK(14) and (guess(5) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(117)))) &
                                                          ((comp_OK(14) and (guess(4) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(116)))) &
                                                          ((comp_OK(14) and (guess(3) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(115)))) &
                                                          ((comp_OK(14) and (guess(2) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(114)))) &
                                                          ((comp_OK(14) and (guess(1) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(113)))) &
                                                          ((comp_OK(14) and (guess(0) and comp_OK(14))) or (not (comp_OK(14) and visible_word_internal(112))));

                visible_word_internal(111 downto 104) <= ((comp_OK(13) and (guess(7) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(111)))) &
                                                          ((comp_OK(13) and (guess(6) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(110)))) &
                                                          ((comp_OK(13) and (guess(5) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(109)))) &
                                                          ((comp_OK(13) and (guess(4) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(108)))) &
                                                          ((comp_OK(13) and (guess(3) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(107)))) &
                                                          ((comp_OK(13) and (guess(2) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(106)))) &
                                                          ((comp_OK(13) and (guess(1) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(105)))) &
                                                          ((comp_OK(13) and (guess(0) and comp_OK(13))) or (not (comp_OK(13) and visible_word_internal(104))));

                visible_word_internal(103 downto 96) <= ((comp_OK(12) and (guess(7) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(103)))) &
                                                         ((comp_OK(12) and (guess(6) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(102)))) &
                                                         ((comp_OK(12) and (guess(5) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(101)))) &
                                                         ((comp_OK(12) and (guess(4) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(100)))) &
                                                         ((comp_OK(12) and (guess(3) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(99)))) &
                                                         ((comp_OK(12) and (guess(2) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(98)))) &
                                                         ((comp_OK(12) and (guess(1) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(97)))) &
                                                         ((comp_OK(12) and (guess(0) and comp_OK(12))) or (not (comp_OK(12) and visible_word_internal(96))));

                visible_word_internal(95 downto 88) <= ((comp_OK(11) and (guess(7) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(95)))) &
                                                        ((comp_OK(11) and (guess(6) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(94)))) &
                                                        ((comp_OK(11) and (guess(5) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(93)))) &
                                                        ((comp_OK(11) and (guess(4) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(92)))) &
                                                        ((comp_OK(11) and (guess(3) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(91)))) &
                                                        ((comp_OK(11) and (guess(2) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(90)))) &
                                                        ((comp_OK(11) and (guess(1) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(89)))) &
                                                        ((comp_OK(11) and (guess(0) and comp_OK(11))) or (not (comp_OK(11) and visible_word_internal(88))));

                visible_word_internal(87 downto 80) <= ((comp_OK(10) and (guess(7) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(87)))) &
                                                        ((comp_OK(10) and (guess(6) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(86)))) &
                                                        ((comp_OK(10) and (guess(5) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(85)))) &
                                                        ((comp_OK(10) and (guess(4) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(84)))) &
                                                        ((comp_OK(10) and (guess(3) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(83)))) &
                                                        ((comp_OK(10) and (guess(2) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(82)))) &
                                                        ((comp_OK(10) and (guess(1) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(81)))) &
                                                        ((comp_OK(10) and (guess(0) and comp_OK(10))) or (not (comp_OK(10) and visible_word_internal(80))));

                visible_word_internal(79 downto 72) <= ((comp_OK(9) and (guess(7) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(79)))) &
                                                       ((comp_OK(9) and (guess(6) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(78)))) &
                                                       ((comp_OK(9) and (guess(5) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(77)))) &
                                                       ((comp_OK(9) and (guess(4) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(76)))) &
                                                       ((comp_OK(9) and (guess(3) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(75)))) &
                                                       ((comp_OK(9) and (guess(2) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(74)))) &
                                                       ((comp_OK(9) and (guess(1) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(73)))) &
                                                       ((comp_OK(9) and (guess(0) and comp_OK(9))) or (not (comp_OK(9) and visible_word_internal(72))));

                visible_word_internal(71 downto 64) <= ((comp_OK(8) and (guess(7) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(71)))) &
                                                       ((comp_OK(8) and (guess(6) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(70)))) &
                                                       ((comp_OK(8) and (guess(5) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(69)))) &
                                                       ((comp_OK(8) and (guess(4) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(68)))) &
                                                       ((comp_OK(8) and (guess(3) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(67)))) &
                                                       ((comp_OK(8) and (guess(2) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(66)))) &
                                                       ((comp_OK(8) and (guess(1) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(65)))) &
                                                       ((comp_OK(8) and (guess(0) and comp_OK(8))) or (not (comp_OK(8) and visible_word_internal(64))));

                visible_word_internal(63 downto 56) <= ((comp_OK(7) and (guess(7) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(63)))) &
                                                       ((comp_OK(7) and (guess(6) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(62)))) &
                                                       ((comp_OK(7) and (guess(5) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(61)))) &
                                                       ((comp_OK(7) and (guess(4) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(60)))) &
                                                       ((comp_OK(7) and (guess(3) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(59)))) &
                                                       ((comp_OK(7) and (guess(2) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(58)))) &
                                                       ((comp_OK(7) and (guess(1) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(57)))) &
                                                       ((comp_OK(7) and (guess(0) and comp_OK(7))) or (not (comp_OK(7) and visible_word_internal(56))));

                visible_word_internal(55 downto 48) <= ((comp_OK(6) and (guess(7) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(55)))) &
                                                       ((comp_OK(6) and (guess(6) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(54)))) &
                                                       ((comp_OK(6) and (guess(5) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(53)))) &
                                                       ((comp_OK(6) and (guess(4) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(52)))) &
                                                       ((comp_OK(6) and (guess(3) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(51)))) &
                                                       ((comp_OK(6) and (guess(2) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(50)))) &
                                                       ((comp_OK(6) and (guess(1) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(49)))) &
                                                       ((comp_OK(6) and (guess(0) and comp_OK(6))) or (not (comp_OK(6) and visible_word_internal(48))));

                visible_word_internal(47 downto 40) <= ((comp_OK(5) and (guess(7) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(47)))) &
                                                       ((comp_OK(5) and (guess(6) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(46)))) &
                                                       ((comp_OK(5) and (guess(5) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(45)))) &
                                                       ((comp_OK(5) and (guess(4) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(44)))) &
                                                       ((comp_OK(5) and (guess(3) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(43)))) &
                                                       ((comp_OK(5) and (guess(2) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(42)))) &
                                                       ((comp_OK(5) and (guess(1) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(41)))) &
                                                       ((comp_OK(5) and (guess(0) and comp_OK(5))) or (not (comp_OK(5) and visible_word_internal(40))));

                visible_word_internal(39 downto 32) <= ((comp_OK(4) and (guess(7) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(39)))) &
                                                       ((comp_OK(4) and (guess(6) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(38)))) &
                                                       ((comp_OK(4) and (guess(5) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(37)))) &
                                                       ((comp_OK(4) and (guess(4) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(36)))) &
                                                       ((comp_OK(4) and (guess(3) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(35)))) &
                                                       ((comp_OK(4) and (guess(2) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(34)))) &
                                                       ((comp_OK(4) and (guess(1) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(33)))) &
                                                       ((comp_OK(4) and (guess(0) and comp_OK(4))) or (not (comp_OK(4) and visible_word_internal(32))));

                visible_word_internal(31 downto 24) <= ((comp_OK(3) and (guess(7) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(31)))) &
                                                       ((comp_OK(3) and (guess(6) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(30)))) &
                                                       ((comp_OK(3) and (guess(5) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(29)))) &
                                                       ((comp_OK(3) and (guess(4) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(28)))) &
                                                       ((comp_OK(3) and (guess(3) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(27)))) &
                                                       ((comp_OK(3) and (guess(2) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(26)))) &
                                                       ((comp_OK(3) and (guess(1) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(25)))) &
                                                       ((comp_OK(3) and (guess(0) and comp_OK(3))) or (not (comp_OK(3) and visible_word_internal(24))));

                visible_word_internal(23 downto 16) <= ((comp_OK(2) and (guess(7) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(23)))) &
                                                       ((comp_OK(2) and (guess(6) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(22)))) &
                                                       ((comp_OK(2) and (guess(5) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(21)))) &
                                                       ((comp_OK(2) and (guess(4) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(20)))) &
                                                       ((comp_OK(2) and (guess(3) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(19)))) &
                                                       ((comp_OK(2) and (guess(2) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(18)))) &
                                                       ((comp_OK(2) and (guess(1) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(17)))) &
                                                       ((comp_OK(2) and (guess(0) and comp_OK(2))) or (not (comp_OK(2) and visible_word_internal(16))));

                visible_word_internal(15 downto 8) <= ((comp_OK(1) and (guess(7) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(15)))) &
                                                      ((comp_OK(1) and (guess(6) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(14)))) &
                                                      ((comp_OK(1) and (guess(5) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(13)))) &
                                                      ((comp_OK(1) and (guess(4) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(12)))) &
                                                      ((comp_OK(1) and (guess(3) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(11)))) &
                                                      ((comp_OK(1) and (guess(2) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(10)))) &
                                                      ((comp_OK(1) and (guess(1) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(9)))) &
                                                      ((comp_OK(1) and (guess(0) and comp_OK(1))) or (not (comp_OK(1) and visible_word_internal(8))));

                visible_word_internal(7 downto 0) <= ((comp_OK(0) and (guess(7) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(7)))) &
                                                     ((comp_OK(0) and (guess(6) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(6)))) &
                                                     ((comp_OK(0) and (guess(5) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(5)))) &
                                                     ((comp_OK(0) and (guess(4) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(4)))) &
                                                     ((comp_OK(0) and (guess(3) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(3)))) &
                                                     ((comp_OK(0) and (guess(2) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(2)))) &
                                                     ((comp_OK(0) and (guess(1) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(1)))) &
                                                     ((comp_OK(0) and (guess(0) and comp_OK(0))) or (not (comp_OK(0) and visible_word_internal(0))));
                
            end if;
        end process;

        palpites_anteriores <= reg128;
        comps_saved_out <= comps_saved;
        comp_OK_out <= unsigned(comp_OK);
        visible_word <= visible_word_internal;
        
        ----------------------------------------------------------------------------------------------------
        comp_OK(15) <= 
            (guess(7) xnor word(127)) and
            (guess(6) xnor word(126)) and
            (guess(5) xnor word(125)) and
            (guess(4) xnor word(124)) and
            (guess(3) xnor word(123)) and
            (guess(2) xnor word(122)) and
            (guess(1) xnor word(121)) and
            (guess(0) xnor word(120));

        comp_OK(14) <= 
            (guess(7) xnor word(119)) and
            (guess(6) xnor word(118)) and
            (guess(5) xnor word(117)) and
            (guess(4) xnor word(116)) and
            (guess(3) xnor word(115)) and
            (guess(2) xnor word(114)) and
            (guess(1) xnor word(113)) and
            (guess(0) xnor word(112));

        comp_OK(13) <= 
            (guess(7) xnor word(111)) and
            (guess(6) xnor word(110)) and
            (guess(5) xnor word(109)) and
            (guess(4) xnor word(108)) and
            (guess(3) xnor word(107)) and
            (guess(2) xnor word(106)) and
            (guess(1) xnor word(105)) and
            (guess(0) xnor word(104));

        comp_OK(12) <= 
            (guess(7) xnor word(103)) and
            (guess(6) xnor word(102)) and
            (guess(5) xnor word(101)) and
            (guess(4) xnor word(100)) and
            (guess(3) xnor word(99)) and
            (guess(2) xnor word(98)) and
            (guess(1) xnor word(97)) and
            (guess(0) xnor word(96));

        comp_OK(11) <= 
            (guess(7) xnor word(95)) and
            (guess(6) xnor word(94)) and
            (guess(5) xnor word(93)) and
            (guess(4) xnor word(92)) and
            (guess(3) xnor word(91)) and
            (guess(2) xnor word(90)) and
            (guess(1) xnor word(89)) and
            (guess(0) xnor word(88));

        comp_OK(10) <= 
            (guess(7) xnor word(87)) and
            (guess(6) xnor word(86)) and
            (guess(5) xnor word(85)) and
            (guess(4) xnor word(84)) and
            (guess(3) xnor word(83)) and
            (guess(2) xnor word(82)) and
            (guess(1) xnor word(81)) and
            (guess(0) xnor word(80));

        comp_OK(9)  <= 
            (guess(7) xnor word(79)) and
            (guess(6) xnor word(78)) and
            (guess(5) xnor word(77)) and
            (guess(4) xnor word(76)) and
            (guess(3) xnor word(75)) and
            (guess(2) xnor word(74)) and
            (guess(1) xnor word(73)) and
            (guess(0) xnor word(72));

        comp_OK(8)  <= 
            (guess(7) xnor word(71)) and
            (guess(6) xnor word(70)) and
            (guess(5) xnor word(69)) and
            (guess(4) xnor word(68)) and
            (guess(3) xnor word(67)) and
            (guess(2) xnor word(66)) and
            (guess(1) xnor word(65)) and         
            (guess(0) xnor word(64));

        comp_OK(7)  <= 
            (guess(7) xnor word(63)) and
            (guess(6) xnor word(62)) and
            (guess(5) xnor word(61)) and
            (guess(4) xnor word(60)) and
            (guess(3) xnor word(59)) and
            (guess(2) xnor word(58)) and
            (guess(1) xnor word(57)) and         
            (guess(0) xnor word(56));

        comp_OK(6)  <= 
            (guess(7) xnor word(55)) and
            (guess(6) xnor word(54)) and
            (guess(5) xnor word(53)) and
            (guess(4) xnor word(52)) and
            (guess(3) xnor word(51)) and
            (guess(2) xnor word(50)) and
            (guess(1) xnor word(49)) and         
            (guess(0) xnor word(48));

        comp_OK(5)  <= 
            (guess(7) xnor word(47)) and
            (guess(6) xnor word(46)) and
            (guess(5) xnor word(45)) and
            (guess(4) xnor word(44)) and
            (guess(3) xnor word(43)) and
            (guess(2) xnor word(42)) and
            (guess(1) xnor word(41)) and         
            (guess(0) xnor word(40));

        comp_OK(4)  <= 
            (guess(7) xnor word(39)) and
            (guess(6) xnor word(38)) and
            (guess(5) xnor word(37)) and
            (guess(4) xnor word(36)) and
            (guess(3) xnor word(35)) and
            (guess(2) xnor word(34)) and
            (guess(1) xnor word(33)) and         
            (guess(0) xnor word(32));

        comp_OK(3)  <= 
            (guess(7) xnor word(31)) and
            (guess(6) xnor word(30)) and
            (guess(5) xnor word(29)) and
            (guess(4) xnor word(28)) and
            (guess(3) xnor word(27)) and
            (guess(2) xnor word(26)) and
            (guess(1) xnor word(25)) and         
            (guess(0) xnor word(24));

        comp_OK(2)  <= 
            (guess(7) xnor word(23)) and
            (guess(6) xnor word(22)) and
            (guess(5) xnor word(21)) and
            (guess(4) xnor word(20)) and
            (guess(3) xnor word(19)) and
            (guess(2) xnor word(18)) and
            (guess(1) xnor word(17)) and         
            (guess(0) xnor word(16));

        comp_OK(1)  <= 
            (guess(7) xnor word(15)) and
            (guess(6) xnor word(14)) and
            (guess(5) xnor word(13)) and
            (guess(4) xnor word(12)) and
            (guess(3) xnor word(11)) and
            (guess(2) xnor word(10)) and
            (guess(1) xnor word(9))  and 
            (guess(0) xnor word(8));

        comp_OK(0)  <= 
            (guess(7) xnor word(7)) and
            (guess(6) xnor word(6)) and
            (guess(5) xnor word(5)) and
            (guess(4) xnor word(4)) and
            (guess(3) xnor word(3)) and
            (guess(2) xnor word(2)) and
            (guess(1) xnor word(1)) and
            (guess(0) xnor word(0));
        -- Atualiza o vetor de comparação com os resultados
        ----------------------------------------------------------------------------------------------------
        bad_guess <=not(comp_OK(0) or 
                        comp_OK(1) or 
                        comp_OK(2) or 
                        comp_OK(3) or 
                        comp_OK(4) or 
                        comp_OK(5) or 
                        comp_OK(6) or 
                        comp_OK(7) or 
                        comp_OK(8) or
                        comp_OK(9) or 
                        comp_OK(10) or 
                        comp_OK(11) or 
                        comp_OK(12) or 
                        comp_OK(13) or 
                        comp_OK(14) or 
                        comp_OK(15));
        ----------------------------------------------------------------------------------------------------
        win <= (
            (comps_saved(0)  xnor word_size(0)) and
            (comps_saved(1)  xnor word_size(1)) and
            (comps_saved(2)  xnor word_size(2)) and
            (comps_saved(3)  xnor word_size(3)) and
            (comps_saved(4)  xnor word_size(4)) and
            (comps_saved(5)  xnor word_size(5)) and
            (comps_saved(6)  xnor word_size(6)) and
            (comps_saved(7)  xnor word_size(7)) and
            (comps_saved(8)  xnor word_size(8)) and
            (comps_saved(9)  xnor word_size(9)) and
            (comps_saved(10) xnor word_size(10)) and 
            (comps_saved(11) xnor word_size(11)) and 
            (comps_saved(12) xnor word_size(12)) and 
            (comps_saved(13) xnor word_size(13)) and 
            (comps_saved(14) xnor word_size(14)) and 
            (comps_saved(15) xnor word_size(15))
            );
        
end architecture;

