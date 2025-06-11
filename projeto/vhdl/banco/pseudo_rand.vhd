library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pseudo_rand is
    generic(
        number_range: natural := 4
    );
    port(
        next_word : in std_logic;
        rand_output : out std_logic_vector(number_range-1 downto 0)
    );
end entity;

architecture arch_pseudo_rand of pseudo_rand is
    signal lfsr : std_logic_vector(number_range-1 downto 0) := (others => '1');
begin

    process(next_word)
    begin
        if rising_edge(next_word) then
            if next_word = '1' then
                -- Exemplo para 4 bits: feedback = lfsr(3) xor lfsr(2)
                -- Para outros tamanhos, ajuste os taps conforme necessário
                lfsr <= lfsr(number_range-2 downto 0) & (lfsr(number_range-1) xor lfsr(number_range-2));
            end if;
        end if;
    end process;

    rand_output <= lfsr;


end architecture;