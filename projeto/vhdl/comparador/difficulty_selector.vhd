--Seletor de dificuldade
--library IEEE;
--use IEEE.numeric_std.all;
--use IEEE.std_logic_1164.all;
--
--entity difficulty_selector is
--    port(
--        clock, reset, select_bt, cursor_left, cursor_right : in std_logic;
--        chosen_diff : out std_logic_vector(1 downto 0);
--        current_difficulty : in std_logic_vector(1 downto 0)
--    );
--end entity;
--
--architecture behav of difficulty_selector is
--
--    process(select_bt)
--    begin
--        if select_bt = '1' and current_difficulty /= "00" then
--            chosen_diff <= current_difficulty;
--        end if;
--    end process;
--
--end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_difficulty is
    Port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        switch_let  : in  std_logic;
        sel         : in  std_logic;
        dif         : out std_logic_vector(1 downto 0)
    );
end fsm_difficulty;

architecture Behavioral of fsm_difficulty is

    type state_type is (EASY, MEDIUM, DIFFICULT);
    signal state        : state_type := EASY;
    signal contador     : integer range 0 to 1843200:= 0;
    signal clk_int      : std_logic := '0';
    signal dif_int      : std_logic_vector(1 downto 0);

begin

    --ascii <= ascii_out;

    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
        elsif rising_edge(clk) and switch_let = '0' then
            -- delay para não mudar muito rápido a letra. Produz um clock de periodo 400ms.
            if contador = 1000000 then
                clk_int <= not clk_int; -- Toggle clock every 368640 cycles
            end if;
        elsif rising_edge(clk) and sel = '1' then -- seleciona a letra, evita enviar uma letra indesejada
            dif <= dif_int;
        end if;
	 end process;

    process(clk_int, reset)
    begin
        if reset = '1' then
            state <= EASY;
        elsif rising_edge(clk) then
            case state is
                when EASY => state <= MEDIUM;
                when MEDIUM => state <= DIFFICULT;
                when DIFFICULT => state <= EASY;
            end case;
        end if;
    end process;

    process(state)
    begin
        case state is
            when EASY => dif_int <= "00";
            when MEDIUM => dif_int <= "01";
            when DIFFICULT => dif_int <= "10";
        end case;
    end process;

end Behavioral;
