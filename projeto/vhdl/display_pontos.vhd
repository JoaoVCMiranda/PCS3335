library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_to_7seg is
    Port (
        bin_in : in  STD_LOGIC_VECTOR(11 downto 0);
        seg0   : out STD_LOGIC_VECTOR(6 downto 0); -- unidade
        seg1   : out STD_LOGIC_VECTOR(6 downto 0); -- dezena
        seg2   : out STD_LOGIC_VECTOR(6 downto 0); -- centena
        seg3   : out STD_LOGIC_VECTOR(6 downto 0)  -- milhar
    );
end bin_to_7seg;

architecture Behavioral of bin_to_7seg is

    function to_7seg(d : integer) return STD_LOGIC_VECTOR is
        variable seg : STD_LOGIC_VECTOR(6 downto 0);
    begin
        case d is
            when 0 => seg := "1000000";
            when 1 => seg := "1111001";
            when 2 => seg := "0100100";
            when 3 => seg := "0110000";
            when 4 => seg := "0011001";
            when 5 => seg := "0010010";
            when 6 => seg := "0000010";
            when 7 => seg := "1111000";
            when 8 => seg := "0000000";
            when 9 => seg := "0010000";
            when others => seg := "1111111"; -- apagado
        end case;
        return seg;
    end function;

    signal value : integer range 0 to 4095;
    signal d0, d1, d2, d3 : integer range 0 to 9;

begin

    process(bin_in)
    begin
        -- Converte para inteiro
        value <= to_integer(unsigned(bin_in));

        -- Extrai os dígitos decimais
        d3 <= value / 1000;
        d2 <= (value mod 1000) / 100;
        d1 <= (value mod 100) / 10;
        d0 <= value mod 10;

        -- Converte cada dígito para 7 segmentos
        seg0 <= to_7seg(d0); -- unidade
        seg1 <= to_7seg(d1); -- dezena
        seg2 <= to_7seg(d2); -- centena
        seg3 <= to_7seg(d3); -- milhar
    end process;

end Behavioral;
