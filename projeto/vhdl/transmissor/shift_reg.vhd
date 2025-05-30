library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg is
	generic(
		WIDTH:natural:=8
	);
	port(
		clock,reset : in std_logic;
		loadOrShift : in std_logic_vector(1 downto 0);
		serial_i: 	in  std_logic;
		data_i:		in  std_logic_vector(WIDTH - 1 downto 0);
		serial_o_r:	out std_logic;
		serial_o_l:	out std_logic
		);
end shift_reg;

architecture shift_reg_arch of shift_reg is
    signal reg : std_logic_vector(WIDTH - 1 downto 0); -- Registrador interno
begin
    process(clock, reset)
    begin
        if reset = '1' then
            -- Resetar o registrador
            reg <= (others => '1');
        elsif rising_edge(clock) then
            case loadOrShift is
                when "00" =>
                    -- retorna para o estado "11111111"
                    reg <= "11111111";
                when "01" =>
                    -- Deslocamento para a direita
                    reg <= serial_i & reg(WIDTH - 1 downto 1);
                when "10" =>
                    -- Deslocamento para a esquerda
                    reg <= reg(WIDTH - 2 downto 0) & serial_i;
                when "11" =>
                    -- Carga externa paralela
                    reg <= data_i;
                when others =>
                    -- Caso padrão (opcional)
                    reg <= reg;
            end case;
        end if;
    end process;

    -- Atribuir valores às saídas
    serial_o_r <= reg(0); -- Saída serial à direita
    serial_o_l <= reg(WIDTH - 1); -- Saída serial à esquerda
end shift_reg_arch;
