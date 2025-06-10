library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity space_or_underline_detector is
    port(
        data_in : in std_logic_vector(127 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behav of space_or_underline_detector is

    begin
        data_out(15) <= '0' when data_in(127 downto 120) = "00100000"
                else   '1';

        data_out(14) <= '0' when data_in(119 downto 112) = "00100000"
                else   '1';

        data_out(13) <= '0' when data_in(111 downto 104) = "00100000"
                else   '1';

        data_out(12) <= '0' when data_in(103 downto 96) = "00100000"
                else   '1';

        data_out(11) <= '0' when data_in(95 downto 88) = "00100000"
                else   '1';

        data_out(10) <= '0' when data_in(87 downto 80) = "00100000"
                else   '1';

        data_out(9) <= '0' when data_in(79 downto 72) = "00100000"
                else   '1';

        data_out(8) <= '0' when data_in(71 downto 64) = "00100000"
                else   '1';

        data_out(7) <= '0' when data_in(63 downto 56) = "00100000"
                else   '1';

        data_out(6) <= '0' when data_in(55 downto 48) = "00100000"
                else   '1';

        data_out(5) <= '0' when data_in(47 downto 40) = "00100000"
                else   '1';

        data_out(4) <= '0' when data_in(39 downto 32) = "00100000"
                else   '1';

        data_out(3) <= '0' when data_in(31 downto 24) = "00100000"
                else   '1';

        data_out(2) <= '0' when data_in(23 downto 16) = "00100000"
                else   '1';

        data_out(1) <= '0' when data_in(15 downto 8) = "00100000"
                else   '1';

        data_out(0) <= '0' when data_in(7 downto 0) = "00100000"
                else   '1';
    end architecture;