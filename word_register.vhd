library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity word_register is
    port(
        data_in : in std_logic_vector(127 downto 0);
        data_out : out std_logic_vector(127 downto 0)
    );
end entity;

architecture behav of word_register is
    --signal data_buffer : std_logic_vector(127 downto 0) := (others => '0');

    begin
        data_out <= data_in;
end architecture;