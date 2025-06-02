--registrador simples de 8 bits

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity simple_reg is
    port(
        reset, load : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0) := (others => '0')
    );
end entity;

architecture behav of simple_reg is

    begin
        load_data : process(reset, load)
        begin
            if reset = '1' then
                data_out <= "00000000";
            elsif load = '1' then
                data_out <= data_in;
            end if;
        end process;
end architecture;
