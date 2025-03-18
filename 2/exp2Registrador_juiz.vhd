entity shiftregister is
	generic(
		WIDTH:natural:=8−−Tamanhoembits
	);
	port(
		clock,reset : in std_logic;	−−Clockeresetassincronoativoalto
		loadOrShift : in std_logic_vector(1 downto 0);
		−− 00:nadaacontece
		−− 01:deslocamentoparadireita
		−− 10:deslocamentoparaesquerda
		−− 11:cargaexternaparalela
		
		serial_i: 	in  std_logic;				 −−Entradaserial
		data_i:		in  std_logic_vector(WIDTH - 1 downto 0);−−Entradaparalela
		data_o:		out std_logic_vector(WIDTH-1 downto 0);	 −−Saidaparalela
		serial_o_r:	out std_logic;				 −−Saidaserialdireita
		serial_o_l:	out std_logic;				 −−Saidaserialesquerda
		);
end shiftregister;

architecture shiftregister_arch of shiftregister is
    signal reg : std_logic_vector(WIDTH - 1 downto 0); -- Registrador interno
begin
    process(clock, reset)
    begin
        if reset = '1' then
            -- Resetar o registrador
            reg <= (others => '0');
        elsif rising_edge(clock) then
            case loadOrShift is
                when "00" =>
                    -- Nada acontece
                    reg <= reg;
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
    data_o <= reg;
    serial_o_r <= reg(0); -- Saída serial à direita
    serial_o_l <= reg(WIDTH - 1); -- Saída serial à esquerda
end shiftregister_arch;
