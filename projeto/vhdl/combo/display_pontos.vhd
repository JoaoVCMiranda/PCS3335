library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_pontos is
    port (
      pontos    : in  std_logic_vector(11 downto 0);
      display_1 : out std_logic_vetor(6 downto 0);
      display_2 : out std_logic_vetor(6 downto 0);
      display_3 : out std_logic_vetor(6 downto 0);
      display_4 : out std_logic_vetor(6 downto 0)
    );
end display_pontos;

architecture arch_display_pontos of display_pontos is
  signal total_int : integer range 0 to 9999 := 0;
begin
  total_int <= to_integer(unsigned(pontos))

end architecture;