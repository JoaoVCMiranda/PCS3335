library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity telas is
	port(
        sel : in std_logic_vector(2 downto 0);
		palpite : in std_logic_vector(7 downto 0);
		word : in std_logic_vector(127 downto 0);
		tip : in std_logic_vector(127 downto 0);
		palpites_anteriores : in std_logic_vector(127 downto 0);
		screen : out std_logic_vector(127 downto 0)
    );
end entity;

architecture arch_telas of telas is
signal st_line, nd_line : std_logic_vector(127 downto 0);

    begin

screen <= st_line & nd_line;
-----------------------------------

----- 1st line SETUP -----
with sel select st_line(127) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(127) when "110",
	word(127) when "111",
	'0' when others;

with sel select st_line(126) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(126) when "110",
	word(126) when "111",
	'0' when others;

with sel select st_line(125) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(125) when "110",
	word(125) when "111",
	'0' when others;

with sel select st_line(124) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(124) when "110",
	word(124) when "111",
	'0' when others;

with sel select st_line(123) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(123) when "110",
	word(123) when "111",
	'0' when others;

with sel select st_line(122) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(122) when "110",
	word(122) when "111",
	'0' when others;

with sel select st_line(121) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(121) when "110",
	word(121) when "111",
	'0' when others;

with sel select st_line(120) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(120) when "110",
	word(120) when "111",
	'0' when others;

with sel select st_line(119) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(119) when "110",
	word(119) when "111",
	'0' when others;

with sel select st_line(118) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(118) when "110",
	word(118) when "111",
	'0' when others;

with sel select st_line(117) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(117) when "110",
	word(117) when "111",
	'0' when others;

with sel select st_line(116) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(116) when "110",
	word(116) when "111",
	'0' when others;

with sel select st_line(115) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(115) when "110",
	word(115) when "111",
	'0' when others;

with sel select st_line(114) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(114) when "110",
	word(114) when "111",
	'0' when others;

with sel select st_line(113) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(113) when "110",
	word(113) when "111",
	'0' when others;

with sel select st_line(112) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(112) when "110",
	word(112) when "111",
	'0' when others;

with sel select st_line(111) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(111) when "110",
	word(111) when "111",
	'0' when others;

with sel select st_line(110) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(110) when "110",
	word(110) when "111",
	'0' when others;

with sel select st_line(109) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(109) when "110",
	word(109) when "111",
	'0' when others;

with sel select st_line(108) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(108) when "110",
	word(108) when "111",
	'0' when others;

with sel select st_line(107) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(107) when "110",
	word(107) when "111",
	'0' when others;

with sel select st_line(106) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(106) when "110",
	word(106) when "111",
	'0' when others;

with sel select st_line(105) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(105) when "110",
	word(105) when "111",
	'0' when others;

with sel select st_line(104) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(104) when "110",
	word(104) when "111",
	'0' when others;

with sel select st_line(103) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(103) when "110",
	word(103) when "111",
	'0' when others;

with sel select st_line(102) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(102) when "110",
	word(102) when "111",
	'0' when others;

with sel select st_line(101) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(101) when "110",
	word(101) when "111",
	'0' when others;

with sel select st_line(100) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(100) when "110",
	word(100) when "111",
	'0' when others;

with sel select st_line(99) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(99) when "110",
	word(99) when "111",
	'0' when others;

with sel select st_line(98) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(98) when "110",
	word(98) when "111",
	'0' when others;

with sel select st_line(97) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(97) when "110",
	word(97) when "111",
	'0' when others;

with sel select st_line(96) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(96) when "110",
	word(96) when "111",
	'0' when others;

with sel select st_line(95) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(95) when "110",
	word(95) when "111",
	'0' when others;

with sel select st_line(94) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(94) when "110",
	word(94) when "111",
	'0' when others;

with sel select st_line(93) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(93) when "110",
	word(93) when "111",
	'0' when others;

with sel select st_line(92) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(92) when "110",
	word(92) when "111",
	'0' when others;

with sel select st_line(91) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(91) when "110",
	word(91) when "111",
	'0' when others;

with sel select st_line(90) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(90) when "110",
	word(90) when "111",
	'0' when others;

with sel select st_line(89) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(89) when "110",
	word(89) when "111",
	'0' when others;

with sel select st_line(88) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(88) when "110",
	word(88) when "111",
	'0' when others;

with sel select st_line(87) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(87) when "110",
	word(87) when "111",
	'0' when others;

with sel select st_line(86) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(86) when "110",
	word(86) when "111",
	'0' when others;

with sel select st_line(85) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(85) when "110",
	word(85) when "111",
	'0' when others;

with sel select st_line(84) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(84) when "110",
	word(84) when "111",
	'0' when others;

with sel select st_line(83) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(83) when "110",
	word(83) when "111",
	'0' when others;

with sel select st_line(82) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(82) when "110",
	word(82) when "111",
	'0' when others;

with sel select st_line(81) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(81) when "110",
	word(81) when "111",
	'0' when others;

with sel select st_line(80) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(80) when "110",
	word(80) when "111",
	'0' when others;

with sel select st_line(79) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(79) when "110",
	word(79) when "111",
	'0' when others;

with sel select st_line(78) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(78) when "110",
	word(78) when "111",
	'0' when others;

with sel select st_line(77) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(77) when "110",
	word(77) when "111",
	'0' when others;

with sel select st_line(76) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(76) when "110",
	word(76) when "111",
	'0' when others;

with sel select st_line(75) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(75) when "110",
	word(75) when "111",
	'0' when others;

with sel select st_line(74) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(74) when "110",
	word(74) when "111",
	'0' when others;

with sel select st_line(73) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(73) when "110",
	word(73) when "111",
	'0' when others;

with sel select st_line(72) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(72) when "110",
	word(72) when "111",
	'0' when others;

with sel select st_line(71) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(71) when "110",
	word(71) when "111",
	'0' when others;

with sel select st_line(70) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(70) when "110",
	word(70) when "111",
	'0' when others;

with sel select st_line(69) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(69) when "110",
	word(69) when "111",
	'0' when others;

with sel select st_line(68) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(68) when "110",
	word(68) when "111",
	'0' when others;

with sel select st_line(67) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(67) when "110",
	word(67) when "111",
	'0' when others;

with sel select st_line(66) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(66) when "110",
	word(66) when "111",
	'0' when others;

with sel select st_line(65) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(65) when "110",
	word(65) when "111",
	'0' when others;

with sel select st_line(64) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(64) when "110",
	word(64) when "111",
	'0' when others;

with sel select st_line(63) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(63) when "110",
	word(63) when "111",
	'0' when others;

with sel select st_line(62) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(62) when "110",
	word(62) when "111",
	'0' when others;

with sel select st_line(61) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(61) when "110",
	word(61) when "111",
	'0' when others;

with sel select st_line(60) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(60) when "110",
	word(60) when "111",
	'0' when others;

with sel select st_line(59) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(59) when "110",
	word(59) when "111",
	'0' when others;

with sel select st_line(58) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(58) when "110",
	word(58) when "111",
	'0' when others;

with sel select st_line(57) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(57) when "110",
	word(57) when "111",
	'0' when others;

with sel select st_line(56) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(56) when "110",
	word(56) when "111",
	'0' when others;

with sel select st_line(55) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(55) when "110",
	word(55) when "111",
	'0' when others;

with sel select st_line(54) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(54) when "110",
	word(54) when "111",
	'0' when others;

with sel select st_line(53) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(53) when "110",
	word(53) when "111",
	'0' when others;

with sel select st_line(52) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(52) when "110",
	word(52) when "111",
	'0' when others;

with sel select st_line(51) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(51) when "110",
	word(51) when "111",
	'0' when others;

with sel select st_line(50) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(50) when "110",
	word(50) when "111",
	'0' when others;

with sel select st_line(49) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(49) when "110",
	word(49) when "111",
	'0' when others;

with sel select st_line(48) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(48) when "110",
	word(48) when "111",
	'0' when others;

with sel select st_line(47) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(47) when "110",
	word(47) when "111",
	'0' when others;

with sel select st_line(46) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(46) when "110",
	word(46) when "111",
	'0' when others;

with sel select st_line(45) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(45) when "110",
	word(45) when "111",
	'0' when others;

with sel select st_line(44) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(44) when "110",
	word(44) when "111",
	'0' when others;

with sel select st_line(43) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(43) when "110",
	word(43) when "111",
	'0' when others;

with sel select st_line(42) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(42) when "110",
	word(42) when "111",
	'0' when others;

with sel select st_line(41) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(41) when "110",
	word(41) when "111",
	'0' when others;

with sel select st_line(40) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(40) when "110",
	word(40) when "111",
	'0' when others;

with sel select st_line(39) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(39) when "110",
	word(39) when "111",
	'0' when others;

with sel select st_line(38) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(38) when "110",
	word(38) when "111",
	'0' when others;

with sel select st_line(37) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(37) when "110",
	word(37) when "111",
	'0' when others;

with sel select st_line(36) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(36) when "110",
	word(36) when "111",
	'0' when others;

with sel select st_line(35) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(35) when "110",
	word(35) when "111",
	'0' when others;

with sel select st_line(34) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(34) when "110",
	word(34) when "111",
	'0' when others;

with sel select st_line(33) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(33) when "110",
	word(33) when "111",
	'0' when others;

with sel select st_line(32) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(32) when "110",
	word(32) when "111",
	'0' when others;

with sel select st_line(31) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(31) when "110",
	word(31) when "111",
	'0' when others;

with sel select st_line(30) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(30) when "110",
	word(30) when "111",
	'0' when others;

with sel select st_line(29) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(29) when "110",
	word(29) when "111",
	'0' when others;

with sel select st_line(28) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(28) when "110",
	word(28) when "111",
	'0' when others;

with sel select st_line(27) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(27) when "110",
	word(27) when "111",
	'0' when others;

with sel select st_line(26) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(26) when "110",
	word(26) when "111",
	'0' when others;

with sel select st_line(25) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(25) when "110",
	word(25) when "111",
	'0' when others;

with sel select st_line(24) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(24) when "110",
	word(24) when "111",
	'0' when others;

with sel select st_line(23) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(23) when "110",
	word(23) when "111",
	'0' when others;

with sel select st_line(22) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(22) when "110",
	word(22) when "111",
	'0' when others;

with sel select st_line(21) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(21) when "110",
	word(21) when "111",
	'0' when others;

with sel select st_line(20) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(20) when "110",
	word(20) when "111",
	'0' when others;

with sel select st_line(19) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(19) when "110",
	word(19) when "111",
	'0' when others;

with sel select st_line(18) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(18) when "110",
	word(18) when "111",
	'0' when others;

with sel select st_line(17) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(17) when "110",
	word(17) when "111",
	'0' when others;

with sel select st_line(16) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(16) when "110",
	word(16) when "111",
	'0' when others;

with sel select st_line(15) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(15) when "110",
	word(15) when "111",
	'0' when others;

with sel select st_line(14) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(14) when "110",
	word(14) when "111",
	'0' when others;

with sel select st_line(13) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(13) when "110",
	word(13) when "111",
	'0' when others;

with sel select st_line(12) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(12) when "110",
	word(12) when "111",
	'0' when others;

with sel select st_line(11) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(11) when "110",
	word(11) when "111",
	'0' when others;

with sel select st_line(10) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(10) when "110",
	word(10) when "111",
	'0' when others;

with sel select st_line(9) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(9) when "110",
	word(9) when "111",
	'0' when others;

with sel select st_line(8) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(8) when "110",
	word(8) when "111",
	'0' when others;

with sel select st_line(7) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(7) when "110",
	word(7) when "111",
	'0' when others;

with sel select st_line(6) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(6) when "110",
	word(6) when "111",
	'0' when others;

with sel select st_line(5) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	word(5) when "110",
	word(5) when "111",
	'0' when others;

with sel select st_line(4) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(4) when "110",
	word(4) when "111",
	'0' when others;

with sel select st_line(3) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(3) when "110",
	word(3) when "111",
	'0' when others;

with sel select st_line(2) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(2) when "110",
	word(2) when "111",
	'0' when others;

with sel select st_line(1) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(1) when "110",
	word(1) when "111",
	'0' when others;

with sel select st_line(0) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	word(0) when "110",
	word(0) when "111",
	'0' when others;

-----------------------------------

----- 2nd line SETUP -----
with sel select nd_line(127) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpite(7) when "110",
	tip(127) when "111",
	'0' when others;

with sel select nd_line(126) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpite(6) when "110",
	tip(126) when "111",
	'0' when others;

with sel select nd_line(125) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpite(5) when "110",
	tip(125) when "111",
	'0' when others;

with sel select nd_line(124) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpite(4) when "110",
	tip(124) when "111",
	'0' when others;

with sel select nd_line(123) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpite(3) when "110",
	tip(123) when "111",
	'0' when others;

with sel select nd_line(122) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpite(2) when "110",
	tip(122) when "111",
	'0' when others;

with sel select nd_line(121) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpite(1) when "110",
	tip(121) when "111",
	'0' when others;

with sel select nd_line(120) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpite(0) when "110",
	tip(120) when "111",
	'0' when others;

with sel select nd_line(119) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(119) when "110",
	tip(119) when "111",
	'0' when others;

with sel select nd_line(118) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(118) when "110",
	tip(118) when "111",
	'0' when others;

with sel select nd_line(117) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(117) when "110",
	tip(117) when "111",
	'0' when others;

with sel select nd_line(116) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(116) when "110",
	tip(116) when "111",
	'0' when others;

with sel select nd_line(115) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(115) when "110",
	tip(115) when "111",
	'0' when others;

with sel select nd_line(114) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(114) when "110",
	tip(114) when "111",
	'0' when others;

with sel select nd_line(113) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(113) when "110",
	tip(113) when "111",
	'0' when others;

with sel select nd_line(112) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(112) when "110",
	tip(112) when "111",
	'0' when others;

with sel select nd_line(111) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(111) when "110",
	tip(111) when "111",
	'0' when others;

with sel select nd_line(110) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(110) when "110",
	tip(110) when "111",
	'0' when others;

with sel select nd_line(109) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(109) when "110",
	tip(109) when "111",
	'0' when others;

with sel select nd_line(108) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(108) when "110",
	tip(108) when "111",
	'0' when others;

with sel select nd_line(107) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(107) when "110",
	tip(107) when "111",
	'0' when others;

with sel select nd_line(106) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(106) when "110",
	tip(106) when "111",
	'0' when others;

with sel select nd_line(105) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(105) when "110",
	tip(105) when "111",
	'0' when others;

with sel select nd_line(104) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(104) when "110",
	tip(104) when "111",
	'0' when others;

with sel select nd_line(103) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(103) when "110",
	tip(103) when "111",
	'0' when others;

with sel select nd_line(102) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(102) when "110",
	tip(102) when "111",
	'0' when others;

with sel select nd_line(101) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(101) when "110",
	tip(101) when "111",
	'0' when others;

with sel select nd_line(100) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(100) when "110",
	tip(100) when "111",
	'0' when others;

with sel select nd_line(99) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(99) when "110",
	tip(99) when "111",
	'0' when others;

with sel select nd_line(98) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(98) when "110",
	tip(98) when "111",
	'0' when others;

with sel select nd_line(97) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(97) when "110",
	tip(97) when "111",
	'0' when others;

with sel select nd_line(96) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(96) when "110",
	tip(96) when "111",
	'0' when others;

with sel select nd_line(95) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(95) when "110",
	tip(95) when "111",
	'0' when others;

with sel select nd_line(94) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(94) when "110",
	tip(94) when "111",
	'0' when others;

with sel select nd_line(93) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(93) when "110",
	tip(93) when "111",
	'0' when others;

with sel select nd_line(92) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(92) when "110",
	tip(92) when "111",
	'0' when others;

with sel select nd_line(91) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(91) when "110",
	tip(91) when "111",
	'0' when others;

with sel select nd_line(90) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(90) when "110",
	tip(90) when "111",
	'0' when others;

with sel select nd_line(89) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(89) when "110",
	tip(89) when "111",
	'0' when others;

with sel select nd_line(88) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(88) when "110",
	tip(88) when "111",
	'0' when others;

with sel select nd_line(87) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(87) when "110",
	tip(87) when "111",
	'0' when others;

with sel select nd_line(86) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(86) when "110",
	tip(86) when "111",
	'0' when others;

with sel select nd_line(85) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(85) when "110",
	tip(85) when "111",
	'0' when others;

with sel select nd_line(84) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(84) when "110",
	tip(84) when "111",
	'0' when others;

with sel select nd_line(83) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(83) when "110",
	tip(83) when "111",
	'0' when others;

with sel select nd_line(82) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(82) when "110",
	tip(82) when "111",
	'0' when others;

with sel select nd_line(81) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(81) when "110",
	tip(81) when "111",
	'0' when others;

with sel select nd_line(80) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(80) when "110",
	tip(80) when "111",
	'0' when others;

with sel select nd_line(79) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(79) when "110",
	tip(79) when "111",
	'0' when others;

with sel select nd_line(78) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(78) when "110",
	tip(78) when "111",
	'0' when others;

with sel select nd_line(77) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(77) when "110",
	tip(77) when "111",
	'0' when others;

with sel select nd_line(76) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(76) when "110",
	tip(76) when "111",
	'0' when others;

with sel select nd_line(75) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(75) when "110",
	tip(75) when "111",
	'0' when others;

with sel select nd_line(74) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(74) when "110",
	tip(74) when "111",
	'0' when others;

with sel select nd_line(73) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(73) when "110",
	tip(73) when "111",
	'0' when others;

with sel select nd_line(72) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(72) when "110",
	tip(72) when "111",
	'0' when others;

with sel select nd_line(71) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(71) when "110",
	tip(71) when "111",
	'0' when others;

with sel select nd_line(70) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(70) when "110",
	tip(70) when "111",
	'0' when others;

with sel select nd_line(69) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(69) when "110",
	tip(69) when "111",
	'0' when others;

with sel select nd_line(68) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(68) when "110",
	tip(68) when "111",
	'0' when others;

with sel select nd_line(67) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(67) when "110",
	tip(67) when "111",
	'0' when others;

with sel select nd_line(66) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(66) when "110",
	tip(66) when "111",
	'0' when others;

with sel select nd_line(65) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(65) when "110",
	tip(65) when "111",
	'0' when others;

with sel select nd_line(64) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(64) when "110",
	tip(64) when "111",
	'0' when others;

with sel select nd_line(63) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(63) when "110",
	tip(63) when "111",
	'0' when others;

with sel select nd_line(62) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(62) when "110",
	tip(62) when "111",
	'0' when others;

with sel select nd_line(61) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(61) when "110",
	tip(61) when "111",
	'0' when others;

with sel select nd_line(60) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(60) when "110",
	tip(60) when "111",
	'0' when others;

with sel select nd_line(59) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(59) when "110",
	tip(59) when "111",
	'0' when others;

with sel select nd_line(58) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(58) when "110",
	tip(58) when "111",
	'0' when others;

with sel select nd_line(57) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(57) when "110",
	tip(57) when "111",
	'0' when others;

with sel select nd_line(56) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(56) when "110",
	tip(56) when "111",
	'0' when others;

with sel select nd_line(55) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(55) when "110",
	tip(55) when "111",
	'0' when others;

with sel select nd_line(54) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(54) when "110",
	tip(54) when "111",
	'0' when others;

with sel select nd_line(53) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(53) when "110",
	tip(53) when "111",
	'0' when others;

with sel select nd_line(52) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(52) when "110",
	tip(52) when "111",
	'0' when others;

with sel select nd_line(51) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(51) when "110",
	tip(51) when "111",
	'0' when others;

with sel select nd_line(50) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(50) when "110",
	tip(50) when "111",
	'0' when others;

with sel select nd_line(49) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(49) when "110",
	tip(49) when "111",
	'0' when others;

with sel select nd_line(48) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(48) when "110",
	tip(48) when "111",
	'0' when others;

with sel select nd_line(47) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(47) when "110",
	tip(47) when "111",
	'0' when others;

with sel select nd_line(46) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(46) when "110",
	tip(46) when "111",
	'0' when others;

with sel select nd_line(45) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(45) when "110",
	tip(45) when "111",
	'0' when others;

with sel select nd_line(44) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(44) when "110",
	tip(44) when "111",
	'0' when others;

with sel select nd_line(43) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(43) when "110",
	tip(43) when "111",
	'0' when others;

with sel select nd_line(42) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(42) when "110",
	tip(42) when "111",
	'0' when others;

with sel select nd_line(41) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'1' when "100",
	'0' when "101",
	palpites_anteriores(41) when "110",
	tip(41) when "111",
	'0' when others;

with sel select nd_line(40) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(40) when "110",
	tip(40) when "111",
	'0' when others;

with sel select nd_line(39) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(39) when "110",
	tip(39) when "111",
	'0' when others;

with sel select nd_line(38) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(38) when "110",
	tip(38) when "111",
	'0' when others;

with sel select nd_line(37) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(37) when "110",
	tip(37) when "111",
	'0' when others;

with sel select nd_line(36) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(36) when "110",
	tip(36) when "111",
	'0' when others;

with sel select nd_line(35) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(35) when "110",
	tip(35) when "111",
	'0' when others;

with sel select nd_line(34) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	palpites_anteriores(34) when "110",
	tip(34) when "111",
	'0' when others;

with sel select nd_line(33) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(33) when "110",
	tip(33) when "111",
	'0' when others;

with sel select nd_line(32) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(32) when "110",
	tip(32) when "111",
	'0' when others;

with sel select nd_line(31) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(31) when "110",
	tip(31) when "111",
	'0' when others;

with sel select nd_line(30) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(30) when "110",
	tip(30) when "111",
	'0' when others;

with sel select nd_line(29) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(29) when "110",
	tip(29) when "111",
	'0' when others;

with sel select nd_line(28) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(28) when "110",
	tip(28) when "111",
	'0' when others;

with sel select nd_line(27) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(27) when "110",
	tip(27) when "111",
	'0' when others;

with sel select nd_line(26) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(26) when "110",
	tip(26) when "111",
	'0' when others;

with sel select nd_line(25) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(25) when "110",
	tip(25) when "111",
	'0' when others;

with sel select nd_line(24) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(24) when "110",
	tip(24) when "111",
	'0' when others;

with sel select nd_line(23) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(23) when "110",
	tip(23) when "111",
	'0' when others;

with sel select nd_line(22) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(22) when "110",
	tip(22) when "111",
	'0' when others;

with sel select nd_line(21) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(21) when "110",
	tip(21) when "111",
	'0' when others;

with sel select nd_line(20) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(20) when "110",
	tip(20) when "111",
	'0' when others;

with sel select nd_line(19) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(19) when "110",
	tip(19) when "111",
	'0' when others;

with sel select nd_line(18) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(18) when "110",
	tip(18) when "111",
	'0' when others;

with sel select nd_line(17) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(17) when "110",
	tip(17) when "111",
	'0' when others;

with sel select nd_line(16) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(16) when "110",
	tip(16) when "111",
	'0' when others;

with sel select nd_line(15) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(15) when "110",
	tip(15) when "111",
	'0' when others;

with sel select nd_line(14) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(14) when "110",
	tip(14) when "111",
	'0' when others;

with sel select nd_line(13) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(13) when "110",
	tip(13) when "111",
	'0' when others;

with sel select nd_line(12) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(12) when "110",
	tip(12) when "111",
	'0' when others;

with sel select nd_line(11) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(11) when "110",
	tip(11) when "111",
	'0' when others;

with sel select nd_line(10) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(10) when "110",
	tip(10) when "111",
	'0' when others;

with sel select nd_line(9) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(9) when "110",
	tip(9) when "111",
	'0' when others;

with sel select nd_line(8) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(8) when "110",
	tip(8) when "111",
	'0' when others;

with sel select nd_line(7) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(7) when "110",
	tip(7) when "111",
	'0' when others;

with sel select nd_line(6) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(6) when "110",
	tip(6) when "111",
	'0' when others;

with sel select nd_line(5) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(5) when "110",
	tip(5) when "111",
	'0' when others;

with sel select nd_line(4) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(4) when "110",
	tip(4) when "111",
	'0' when others;

with sel select nd_line(3) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(3) when "110",
	tip(3) when "111",
	'0' when others;

with sel select nd_line(2) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(2) when "110",
	tip(2) when "111",
	'0' when others;

with sel select nd_line(1) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	palpites_anteriores(1) when "110",
	tip(1) when "111",
	'0' when others;

with sel select nd_line(0) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	palpites_anteriores(0) when "110",
	tip(0) when "111",
	'0' when others;

-----------------------------------

end architecture;