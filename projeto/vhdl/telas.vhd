library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity telas is
	port(
        sel : in std_logic_vector(2 downto 0);
        st_line : out std_logic_vector(127 downto 0);
        nd_line : out std_logic_vector(127 downto 0)
    );
end entity;

architecture arch_telas of telas is

    begin

-----------------------------------

----- 1st line SETUP -----
with sel select st_line(127) <=
	'0' when "000", -- inicio
	'0' when "001", -- win
	'0' when "010",-- lose
	'0' when "011", -- facil
	'0' when "100",-- medio
	'0' when "101",--dificil
	'0' when others;

with sel select st_line(126) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(125) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(124) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(123) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(122) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(121) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(120) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(119) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(118) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(117) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(116) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(115) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(114) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(113) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(112) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(111) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(110) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(109) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(108) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(107) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(106) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(105) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(104) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(103) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(102) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(101) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(100) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(99) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(98) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(97) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(96) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(95) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(94) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(93) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(92) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(91) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(90) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(89) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(88) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(87) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(86) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(85) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(84) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(83) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(82) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(81) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(80) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(79) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(78) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(77) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(76) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(75) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(74) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(73) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(72) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(71) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(70) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(69) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(68) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(67) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(66) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(65) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(64) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(63) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(62) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(61) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(60) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(59) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(58) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(57) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(56) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(55) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(54) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(53) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(52) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(51) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(50) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(49) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(48) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(47) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(46) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(45) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(44) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(43) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(42) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(41) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(40) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(39) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(38) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(37) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(36) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(35) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(34) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(33) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(32) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(31) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(30) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(29) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(28) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(27) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(26) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(25) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(24) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(23) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(22) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(21) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(20) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(19) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(18) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(17) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(16) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(15) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(14) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(13) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(12) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(11) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(10) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(9) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(8) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(7) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(6) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(5) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select st_line(4) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(3) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(2) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(1) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select st_line(0) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
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
	'0' when others;

with sel select nd_line(126) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(125) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(124) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(123) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(122) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(121) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(120) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(119) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(118) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(117) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(116) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(115) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(114) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(113) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(112) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(111) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(110) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(109) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(108) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(107) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(106) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(105) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(104) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(103) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(102) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(101) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(100) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(99) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(98) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(97) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(96) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(95) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(94) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(93) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(92) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(91) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(90) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(89) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(88) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(87) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(86) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(85) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(84) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(83) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(82) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(81) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(80) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(79) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(78) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(77) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(76) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(75) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(74) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(73) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(72) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(71) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(70) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(69) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(68) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(67) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(66) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(65) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(64) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(63) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(62) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(61) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(60) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(59) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(58) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(57) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(56) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(55) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(54) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(53) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(52) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(51) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(50) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(49) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(48) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(47) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(46) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(45) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(44) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(43) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(42) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(41) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'1' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(40) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(39) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(38) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(37) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(36) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(35) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(34) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(33) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(32) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(31) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(30) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(29) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(28) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(27) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(26) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(25) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(24) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(23) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(22) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(21) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(20) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(19) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(18) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(17) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(16) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(15) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(14) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(13) <=
	'1' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(12) <=
	'1' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(11) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(10) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(9) <=
	'1' when "000",
	'1' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(8) <=
	'1' when "000",
	'0' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(7) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(6) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

with sel select nd_line(5) <=
	'0' when "000",
	'1' when "001",
	'1' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(4) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(3) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(2) <=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(1) <=
	'0' when "000",
	'1' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when others;

with sel select nd_line(0) <=
	'0' when "000",
	'0' when "001",
	'1' when "010",
	'0' when "011",
	'0' when "100",
	'0' when "101",
	'0' when others;

-----------------------------------


end architecture;