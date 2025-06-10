library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity letter_register is
    port(
        data_in : in std_logic_vector(7 downto 0);
        load, preparing_mode, space_or_underline: in std_logic;
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behav of letter_register is
    signal data_buffer : std_logic_vector(7 downto 0) := (others => '0');
	 signal space : std_logic_vector(7 downto 0) := "00100000";
	 signal underline : std_logic_vector(7 downto 0) := "01011111";
    begin
        process(preparing_mode, space_or_underline, load)
            begin
                if preparing_mode = '1' then
                    if space_or_underline = '0' then
                        data_buffer <= space; --espaço
                    else
                        data_buffer <= underline; --underline
                    end if;
                elsif load = '1' then
                    data_buffer <= data_in;
                else
						data_buffer <= underline;
					 end if;
					 
        end process;
    data_out <= data_buffer;
end architecture;