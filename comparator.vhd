library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity comparator is
    port(
        clock, reset, clear : in std_logic;
        successful_comparisons : out std_logic_vector(15 downto 0);
        stored_comparisons : out std_logic_vector(15 downto 0);
        guess : in std_logic_vector(7 downto 0);
        data_in : in std_logic_vector(127 downto 0);
        bad_guess, victory_detector : out std_logic
        
    );
end entity;

architecture behav of comparator is
    signal stored_comps_signal : std_logic_vector(15 downto 0)  := (others => '0');
    signal successful_comparisons_signal : std_logic_vector(15 downto 0)  := (others => '0');
    begin
        successful_comparisons_signal(15) <= '1' when guess = data_in(127 downto 120) else '0';
        successful_comparisons_signal(14) <= '1' when guess = data_in(119 downto 112) else '0';
        successful_comparisons_signal(13) <= '1' when guess = data_in(111 downto 104) else '0';
        successful_comparisons_signal(12) <= '1' when guess = data_in(103 downto 96) else '0';
        successful_comparisons_signal(11) <= '1' when guess = data_in(95 downto 88) else '0';
        successful_comparisons_signal(10) <= '1' when guess = data_in(87 downto 80) else '0';
        successful_comparisons_signal(9)  <= '1' when guess = data_in(79 downto 72) else '0';
        successful_comparisons_signal(8)  <= '1' when guess = data_in(71 downto 64) else '0';
        successful_comparisons_signal(7)  <= '1' when guess = data_in(63 downto 56) else '0';
        successful_comparisons_signal(6)  <= '1' when guess = data_in(55 downto 48) else '0';
        successful_comparisons_signal(5)  <= '1' when guess = data_in(47 downto 40) else '0';
        successful_comparisons_signal(4)  <= '1' when guess = data_in(39 downto 32) else '0';
        successful_comparisons_signal(3)  <= '1' when guess = data_in(31 downto 24) else '0';
        successful_comparisons_signal(2)  <= '1' when guess = data_in(23 downto 16) else '0';
        successful_comparisons_signal(1)  <= '1' when guess = data_in(15 downto 8) else  '0';
        successful_comparisons_signal(0)  <= '1' when guess = data_in(7 downto 0) else   '0';

        process(clock, reset)
        begin
            if reset = '1' or clear = '1' then
                stored_comps_signal <=  (others => '0');
            elsif rising_edge(clock) then
                stored_comps_signal <= stored_comps_signal or successful_comparisons_signal;
            end if;
        end process;

    
    victory_detector <= stored_comps_signal(15) and stored_comps_signal(14) and stored_comps_signal(13) and
                        stored_comps_signal(12) and stored_comps_signal(11) and stored_comps_signal(10) and
                        stored_comps_signal(9) and stored_comps_signal(8) and stored_comps_signal(7) and
                        stored_comps_signal(6) and stored_comps_signal(5) and stored_comps_signal(4) and
                        stored_comps_signal(3) and stored_comps_signal(2) and stored_comps_signal(1) and
                        stored_comps_signal(0);

    bad_guess <= '1' when successful_comparisons_signal = "0000000000000000" else
                 '0';

    successful_comparisons <= successful_comparisons_signal;
    stored_comparisons <= stored_comps_signal;
    end architecture;