library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity reg_and_comp_system is
	port(
		clock, reset, clear : in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		guess : in std_logic_vector(7 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behav of reg_and_comp_system is
    signal comparation_vector : std_logic_vector(127 downto 0);
    signal comps_saved : std_logic_vector(15 downto 0) := (others => '0');
    signal comp_OK : std_logic_vector(15 downto 0);

    begin

        comp_OK(15) <= (guess(7) xor data_in(127)) and (guess(6) xor data_in(126)) and (guess(5) xor data_in(125)) and
                             (guess(4) xor data_in(124)) and (guess(3) xor data_in(123)) and (guess(2) xor data_in(122)) and
                             (guess(1) xor data_in(121)) and (guess(0) xor data_in(120));

        comp_OK(14) <= (guess(7) xor data_in(119)) and (guess(6) xor data_in(118)) and (guess(5) xor data_in(117)) and
                             (guess(4) xor data_in(116)) and (guess(3) xor data_in(115)) and (guess(2) xor data_in(114)) and
                             (guess(1) xor data_in(113)) and (guess(0) xor data_in(112));

        comp_OK(13) <= (guess(7) xor data_in(111)) and (guess(6) xor data_in(110)) and (guess(5) xor data_in(109)) and
                             (guess(4) xor data_in(108)) and (guess(3) xor data_in(107)) and (guess(2) xor data_in(106)) and
                             (guess(1) xor data_in(105)) and (guess(0) xor data_in(104));
        
        comp_OK(12) <= (guess(7) xor data_in(103)) and (guess(6) xor data_in(102)) and (guess(5) xor data_in(101)) and
                             (guess(4) xor data_in(100)) and (guess(3) xor data_in(99)) and (guess(2) xor data_in(98)) and
                             (guess(1) xor data_in(97)) and (guess(0) xor data_in(96));
        
        comp_OK(11) <= (guess(7) xor data_in(95)) and (guess(6) xor data_in(94)) and (guess(5) xor data_in(93)) and
                             (guess(4) xor data_in(92)) and (guess(3) xor data_in(91)) and (guess(2) xor data_in(90)) and
                             (guess(1) xor data_in(89)) and (guess(0) xor data_in(88));
        
        comp_OK(10) <= (guess(7) xor data_in(87)) and (guess(6) xor data_in(86)) and (guess(5) xor data_in(85)) and
                             (guess(4) xor data_in(84)) and (guess(3) xor data_in(83)) and (guess(2) xor data_in(82)) and
                             (guess(1) xor data_in(81)) and (guess(0) xor data_in(80));
        
        comp_OK(9)  <= (guess(7) xor data_in(79)) and (guess(6) xor data_in(78)) and (guess(5) xor data_in(77)) and
                             (guess(4) xor data_in(76)) and (guess(3) xor data_in(75)) and (guess(2) xor data_in(74)) and
                             (guess(1) xor data_in(73)) and (guess(0) xor data_in(72));
        
        comp_OK(8)  <= (guess(7) xor data_in(71)) and (guess(6) xor data_in(70)) and (guess(5) xor data_in(69)) and
                             (guess(4) xor data_in(68)) and (guess(3) xor data_in(67)) and (guess(2) xor data_in(66)) and
                             (guess(1) xor data_in(65)) and (guess(0) xor data_in(64));
        
        comp_OK(7)  <= (guess(7) xor data_in(63)) and (guess(6) xor data_in(62)) and (guess(5) xor data_in(61)) and
                             (guess(4) xor data_in(60)) and (guess(3) xor data_in(59)) and (guess(2) xor data_in(58)) and
                             (guess(1) xor data_in(57)) and (guess(0) xor data_in(56));
        
        comp_OK(6)  <= (guess(7) xor data_in(55)) and (guess(6) xor data_in(54)) and (guess(5) xor data_in(53)) and
                             (guess(4) xor data_in(52)) and (guess(3) xor data_in(51)) and (guess(2) xor data_in(50)) and
                             (guess(1) xor data_in(49)) and (guess(0) xor data_in(48));
        
        comp_OK(5)  <= (guess(7) xor data_in(47)) and (guess(6) xor data_in(46)) and (guess(5) xor data_in(45)) and
                             (guess(4) xor data_in(44)) and (guess(3) xor data_in(43)) and (guess(2) xor data_in(42)) and
                             (guess(1) xor data_in(41)) and (guess(0) xor data_in(40));
        
        comp_OK(4)  <= (guess(7) xor data_in(39)) and (guess(6) xor data_in(38)) and (guess(5) xor data_in(37)) and
                             (guess(4) xor data_in(36)) and (guess(3) xor data_in(35)) and (guess(2) xor data_in(34)) and
                             (guess(1) xor data_in(33)) and (guess(0) xor data_in(32));
        
        comp_OK(3)  <= (guess(7) xor data_in(31)) and (guess(6) xor data_in(30)) and (guess(5) xor data_in(29)) and
                             (guess(4) xor data_in(28)) and (guess(3) xor data_in(27)) and (guess(2) xor data_in(26)) and
                             (guess(1) xor data_in(25)) and (guess(0) xor data_in(24));
         
        comp_OK(2)  <= (guess(7) xor data_in(23)) and (guess(6) xor data_in(22)) and (guess(5) xor data_in(21)) and
                             (guess(4) xor data_in(20)) and (guess(3) xor data_in(19)) and (guess(2) xor data_in(18)) and
                             (guess(1) xor data_in(17)) and (guess(0) xor data_in(16));
        
        comp_OK(1)  <= (guess(7) xor data_in(15)) and (guess(6) xor data_in(14)) and (guess(5) xor data_in(13)) and
                             (guess(4) xor data_in(12)) and (guess(3) xor data_in(11)) and (guess(2) xor data_in(10)) and
                             (guess(1) xor data_in(9)) and (guess(0) xor data_in(8));
        
        comp_OK(0)  <= (guess(7) xor data_in(7)) and (guess(6) xor data_in(6)) and (guess(5) xor data_in(5)) and
                             (guess(4) xor data_in(4)) and (guess(3) xor data_in(3)) and (guess(2) xor data_in(2)) and
                             (guess(1) xor data_in(1)) and (guess(0) xor data_in(0));
        
        
        process(clock, reset)
        begin
            if reset = '1' or clear = '1' then
                comps_saved <= (others => 0);
            elsif rising_edge(clock) then
                comps_saved <= comps_saved or comp_OK;
            end if;
        end process;

        comps_saved_out <= comps_saved;
        comp_OK_out <= unsigned(comp_OK);
end architecture;

