library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pseudo_rand is
	generic(
        number_range: natural := 4
    );
    port(
        clock : in std_logic;
        en : in std_logic;
        rand_output : out std_logic_vector(number_range-1 downto 0)
    );
end entity;

architecture arch_pseudo_rand of pseudo_rand is
    signal noise : std_logic_vector(1 downto 0) := "00";
    type state_type is (O,A,B);
    -- O => start state 
    -- A => Add and right shift
    -- B => Add and left shift
    signal state : state_type := O;
    signal rand : std_logic_vector(number_range -1 downto 0);
    signal aux_rand : std_logic_vector(number_range -1 downto 0);

    signal full_rand_output : std_logic_vector(number_range + 1 downto 0);
begin

    rand_output <= full_rand_output(number_range-1 downto 0);
    process(clock)
    begin
        if rising_edge(clock) then 
            noise <= std_logic_vector(to_unsigned(to_integer(unsigned(noise)) + 1, 2));
            if en = '1' then
                case state is
                    when O =>
                        rand <= (others => '0');
                        full_rand_output <=  rand & noise;
                        aux_rand <= full_rand_output(number_range-1 downto 0);
                        state <= A;
                    when A =>
                        rand <= std_logic_vector(to_unsigned(to_integer(unsigned(aux_rand)) + 1, number_range));
                        full_rand_output <= noise(0) & rand & noise(1);
                        aux_rand <= full_rand_output(number_range-1 downto 0);
                        state <= B;
                    when B =>
                        rand <= std_logic_vector(to_unsigned(to_integer(unsigned(aux_rand)) + 1, number_range));
                        full_rand_output <= noise(1) & rand & noise(0);
                        aux_rand <= full_rand_output(number_range-1 downto 0);

                        state <= A;
                end case;
            end if;
        end if;
    end process;
    
end architecture;