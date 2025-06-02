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
        clock : in std_logic;
        en : in std_logic;
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
    port map(clock, en, lvl1_word_index);
    lvl2_rand_gen : pseudo_rand
    generic map(7)
    port map(clock, en, lvl2_word_index);
    lvl3_rand_gen : pseudo_rand
    generic map(6)
    port map(clock, en, lvl3_word_index);
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

end architecture;