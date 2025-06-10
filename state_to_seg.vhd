library ieee;
	use ieee.std_logic_1164.all;

entity state_to_seg is
    port (
        state : in std_logic_vector(3 downto 0);
        seg   : out std_logic_vector(6 downto 0)
    );
end entity state_to_seg;

architecture rtl of state_to_seg is
begin
    seg(6 downto 0) <= "1000000" when state = "0000" else
                        "1111001" when state = "0001" else
                        "0100100" when state = "0010" else
                        "0110000" when state = "0011" else
                        "0011001" when state = "0100" else
                        "0010010" when state = "0101" else
                        "0000010" when state = "0110" else
                        "1111000" when state = "0111" else
                        "0000000" when state = "1000" else
                        "0010000" when state = "1001" else
                        "0001000" when state = "1010" else
                        "0000011" when state = "1011" else
                        "1000110" when state = "1100" else
                        "0100001" when state = "1101" else
                        "0000100" when state = "1110" else
                        "1111111"; -- Default case for undefined states
end architecture rtl;