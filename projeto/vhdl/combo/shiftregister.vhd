library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity shiftregister is
  generic(
    WIDTH: natural := 8
  );
  port (
    clock, reset: in std_logic;
    loadOrShift: in std_logic_vector(1 downto 0);
    serial_i: in std_logic;
    data_i : in std_logic_vector (WIDTH-1 downto 0); -- Entrada paralela
    data_o : out std_logic_vector (WIDTH-1 downto 0); -- Saída paralela
    serial_o_r : out std_logic ; -- Saida serial direita
    serial_o_l : out std_logic -- Saida serial esquerda
  );
end entity;

architecture arch_reg of shiftregister is
  signal internal: std_logic_vector(WIDTH-1 downto 0) := (WIDTH-1 downto 3 => '0') & "101";
  signal serial_out_l: std_logic;
  signal serial_out_r: std_logic;
begin
  process(clock, reset)
  begin
    if reset='1' then
      internal <= (WIDTH-1 downto 3 => '0') & "101";
    elsif (rising_edge(clock)) then
      if loadOrShift = "11" then
        internal <= data_i;
      elsif loadOrShift = "10" then
        serial_out_l <= internal(WIDTH-1);
        internal <= internal(WIDTH-2 downto 0) & serial_i;
      elsif loadOrShift = "01" then
        serial_out_r <= internal(0);
        internal <= serial_i & internal(WIDTH-1 downto 1);
      end if;
    end if;
  end process;
  data_o <= internal;
  serial_o_l <= serial_out_l;
  serial_o_r <= serial_out_r;
end architecture;