library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_palavras is
	port(
        next_word : in std_logic;
        lvl : in std_logic_vector(1 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0);
        word_size : out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch_banco_palavras of banco_palavras is

component banco_lvl1 is
	port(
        binary_select: in std_logic_vector(6 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0)
    );
end component;

component banco_lvl2 is
	port(
        binary_select: in std_logic_vector(6 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0)
    );
end component;

component banco_lvl3 is
	port(
        binary_select: in std_logic_vector(5 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0)
    );
end component;

component pseudo_rand is
	generic(
        number_range: natural := 4
    );
    port(
        next_word : in std_logic;
        rand_output : out std_logic_vector(number_range-1 downto 0)
    );
end component;
signal lvl1_word_index : std_logic_vector(6 downto 0);
signal lvl2_word_index : std_logic_vector(6 downto 0);
signal lvl3_word_index : std_logic_vector(5 downto 0);

signal word_lvl1 : std_logic_vector(127 downto 0);
signal tip_lvl1 : std_logic_vector(127 downto 0);

signal word_lvl2 : std_logic_vector(127 downto 0);
signal tip_lvl2 : std_logic_vector(127 downto 0);

signal word_lvl3 : std_logic_vector(127 downto 0);
signal tip_lvl3 : std_logic_vector(127 downto 0);

--signal lvl_signal : std_logic_vector(1 downto 0) := "01";

begin
    ---para escolher qual palavra usar----
    lvl1_rand_gen : pseudo_rand
    generic map(7)
    port map(next_word, lvl1_word_index);
    lvl2_rand_gen : pseudo_rand
    generic map(7)
    port map(next_word, lvl2_word_index);
    lvl3_rand_gen : pseudo_rand
    generic map(6)
    port map(next_word, lvl3_word_index);
    --------------------------------------
    lvl1 : banco_lvl1
    port map(lvl1_word_index, tip_lvl1, word_lvl1);
    lvl2 : banco_lvl2
    port map(lvl2_word_index, tip_lvl2, word_lvl2);
    lvl3 : banco_lvl3
    port map(lvl3_word_index, tip_lvl3, word_lvl3);



    with lvl select binary_word <=
        word_lvl1 when "01",
        word_lvl2 when "10",
        word_lvl3 when "11",
        (others => '0') when others;

    with lvl select binary_tip <=
        tip_lvl1 when "01",
        tip_lvl2 when "10",
        tip_lvl3 when "11",
        (others => '0') when others;

    word_size(15) <=
        word_lvl1(127) or
        word_lvl2(126) or
        word_lvl3(125) or
        word_lvl1(124) or
        word_lvl2(123) or
        word_lvl3(122) or
        word_lvl1(121) or
        word_lvl2(120);
    
    word_size(14) <= 
        word_lvl1(119) or
        word_lvl2(118) or
        word_lvl3(117) or
        word_lvl1(116) or
        word_lvl2(115) or
        word_lvl3(114) or
        word_lvl1(113) or
        word_lvl2(112);

    word_size(13) <=
        word_lvl1(111) or
        word_lvl2(110) or
        word_lvl3(109) or
        word_lvl1(108) or
        word_lvl2(107) or
        word_lvl3(106) or
        word_lvl1(105) or
        word_lvl2(104);
    word_size(12) <=
        word_lvl1(103) or
        word_lvl2(102) or
        word_lvl3(101) or
        word_lvl1(100) or
        word_lvl2(99) or
        word_lvl3(98) or
        word_lvl1(97) or
        word_lvl2(96);
    word_size(11) <=
        word_lvl1(95) or
        word_lvl2(94) or
        word_lvl3(93) or
        word_lvl1(92) or
        word_lvl2(91) or
        word_lvl3(90) or
        word_lvl1(89) or
        word_lvl2(88);
    word_size(10) <=
        word_lvl1(87) or
        word_lvl2(86) or
        word_lvl3(85) or
        word_lvl1(84) or
        word_lvl2(83) or
        word_lvl3(82) or
        word_lvl1(81) or
        word_lvl2(80);
    word_size(9) <=
        word_lvl1(79) or
        word_lvl2(78) or
        word_lvl3(77) or
        word_lvl1(76) or
        word_lvl2(75) or
        word_lvl3(74) or
        word_lvl1(73) or
        word_lvl2(72);
    word_size(8) <=
        word_lvl1(71) or
        word_lvl2(70) or
        word_lvl3(69) or
        word_lvl1(68) or
        word_lvl2(67) or
        word_lvl3(66) or
        word_lvl1(65) or
        word_lvl2(64);
    word_size(7) <=
        word_lvl1(63) or
        word_lvl2(62) or
        word_lvl3(61) or
        word_lvl1(60) or
        word_lvl2(59) or
        word_lvl3(58) or
        word_lvl1(57) or
        word_lvl2(56);
    word_size(6) <=
        word_lvl1(55) or
        word_lvl2(54) or
        word_lvl3(53) or
        word_lvl1(52) or
        word_lvl2(51) or
        word_lvl3(50) or
        word_lvl1(49) or
        word_lvl2(48);
    word_size(5) <=
        word_lvl1(47) or
        word_lvl2(46) or
        word_lvl3(45) or
        word_lvl1(44) or
        word_lvl2(43) or
        word_lvl3(42) or
        word_lvl1(41) or
        word_lvl2(40);
    word_size(4) <=
        word_lvl1(39) or
        word_lvl2(38) or
        word_lvl3(37) or
        word_lvl1(36) or
        word_lvl2(35) or
        word_lvl3(34) or
        word_lvl1(33) or
        word_lvl2(32);
    word_size(3) <=
        word_lvl1(31) or
        word_lvl2(30) or
        word_lvl3(29) or
        word_lvl1(28) or
        word_lvl2(27) or
        word_lvl3(26) or
        word_lvl1(25) or
        word_lvl2(24);
    word_size(2) <=
        word_lvl1(23) or
        word_lvl2(22) or
        word_lvl3(21) or
        word_lvl1(20) or
        word_lvl2(19) or
        word_lvl3(18) or
        word_lvl1(17) or
        word_lvl2(16);
    word_size(1) <=
        word_lvl1(15) or
        word_lvl2(14) or
        word_lvl3(13) or
        word_lvl1(12) or
        word_lvl2(11) or
        word_lvl3(10) or
        word_lvl1(9) or
        word_lvl2(8);
    word_size(0) <=
        word_lvl1(7) or
        word_lvl2(6) or
        word_lvl3(5) or
        word_lvl1(4) or
        word_lvl2(3) or
        word_lvl3(2) or
        word_lvl1(1) or
        word_lvl2(0);
end architecture;