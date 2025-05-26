library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_palavras is
	port(
        clock : in std_logic;
        en : in std_logic;
        lvl : in std_logic_vector(1 downto 0);
        binary_tip : out std_logic_vector(127 downto 0);
        binary_word : out std_logic_vector(127 downto 0)    
    );
end entity;

architecture arch_banco_palavras of banco_palavras is
component pseudo_rand is
	generic(
        number_range: natural := 4
    );
    port(
        clock : in std_logic;
        en : in std_logic;
        rand_output : out std_logic_vector(number_range-1 downto 0)
    );
end component;
signal lvl1_word_index : std_logic_vector(6 downto 0);
signal lvl2_word_index : std_logic_vector(6 downto 0);
signal lvl3_word_index : std_logic_vector(5 downto 0);

begin
    ---para escolher qual palavra usar----
    lvl1_rand_gen : pseudo_rand
    generic map(7)
    port map(clock, en, lvl1_word_index);
    lvl2_rand_gen : pseudo_rand
    generic map(7)
    port map(clock, en, lvl2_word_index);
    lvl3_rand_gen : pseudo_rand
    generic map(6)
    port map(clock, en, lvl3_word_index);
    --------------------------------------

end architecture;