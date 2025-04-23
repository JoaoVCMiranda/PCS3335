--IMPORTANTE:
-- Previsão de erro de sincronização: 
-- Como o receptor precisa receber o start bit para que o registrador passe a receber os bits do transmissor, acredito que seja esperado que o start bit não entre
-- na palavra final. Por causa disso, estou considerando a palavra do bit 7 ao 0 do palavrão, e não do 8 ao 1. Se puder, verificar se tudo está certo com testbench...

--toplevel:
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity exp6 is
	port(
		clock, reset : in std_logic;
		serial_in : in std_logic;
		seg_out : out std_logic_vector(6 downto 0);
		parity_error_bit : out std_logic;
		LCR : out std_logic_vector(7 downto 0);
		stateValue : out std_logic_vector(1 downto 0)
	);
end entity;
	
architecture behav of exp6 is
	component uc is -- 8 bits de dados, paridade par e 1 stop bit
	port(
		clock, reset : in std_logic;
		serial_in : in std_logic;
		loadRegister : out std_logic;
		transmissionOk : in std_logic;
		stateValue : out std_logic_vector(1 downto 0)
	);
	end component;
	
	component RSR is
	port(
		clock, reset, load : in std_logic; -- Recebe o clock reduzido em 16 vezes!
		serial_in : in std_logic;
		parallel_out : out std_logic_vector(10 downto 0) := "00000000000";
		word : out std_logic_vector(7 downto 0);
		parity_bit : out std_logic
	);
	end component;
	
	component parity_detector is
	port(
		data : in std_logic_vector(7 downto 0);
		parity_bit : in std_logic;
		LSR_second_bit : out std_logic
		);
	end component;
	
	component clock_div_counter is
	port(
		clock, reset, recep_is_on : in std_logic;
		clock_out : out std_logic := '0' --Para obter o baud rate de 9600 bps
	);
	end component;
	
	component transmissionCounter is
	port(
		clock, reset, transmissionRunning : in std_logic;
		transmissionOk : out std_logic := '0'
	);
	end component;
	
	component baud_rate_generator is
	port (
	    clock : in std_logic; -- Recebe o sinal Phase Lock Loop 
	    -- IP Catalog > Library > Clocks > PLLs and Resets > PLL > PLL Intel FPGA > vhdl
	    -- Base/Ref clock : 50MHz 
	    -- Desired clock: 1.8432MHz
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
	);
	end component;
	
	component ascii2seg is
	port( off: in std_logic; -- precisa ser 0 para mostrar algum valor
		  asc: in std_logic_vector(6 downto 0);
		  seg: out std_logic_vector(6 downto 0);
		  dot: out std_logic -- ponto decimal, aparentemente ignorado pela placa
		);
		
	end component;
	
	--Inserir o componente do PLL!!!
	signal loadRegister, transmissionOk, reduced_clock, dot, clock_post_BRG, clock_pll : std_logic;
	signal RSR_out : std_logic_vector(10 downto 0);
	signal word_signal : std_logic_vector(7 downto 0);
	signal parity_signal : std_logic;
	signal divisor : std_logic_vector(15 downto 0);
	begin
		divisor <= "0000000000001100"; -- para o BRG
		controlUnit : uc port map(clock_post_BRG, reset, serial_in, loadRegister, transmissionOk, stateValue);
		RSR_reg : RSR port map(reduced_clock, reset, loadRegister, serial_in, RSR_out, word_signal, parity_signal);
		parity_det : parity_detector port map(word_signal, parity_signal, parity_error_bit);
		clock_div_ct : clock_div_counter port map(clock_post_BRG, reset, loadRegister, reduced_clock);
		transmCount : transmissionCounter port map(clock_post_BRG, reset, loadRegister, transmissionOk);
		seg : ascii2seg port map('0', RSR_out(6 downto 0), seg_out, dot);
		BGR : baud_rate_generator port map(clock_pll, reset, divisor, clock_post_BRG);
		
		LCR <= "11010000";
end architecture;
		
	
		
--control unit
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
entity uc is -- 8 bits de dados, paridade par e 1 stop bit
	port(
		clock, reset : in std_logic;
		serial_in : in std_logic;
		loadRegister : out std_logic;
		transmissionOk : in std_logic;
		stateValue : out std_logic_vector(1 downto 0)
	);
end entity;

architecture behav of uc is
	type state_type is (q0, q1, q2, q3);
	signal state : state_type;
	
	begin
		process(clock, reset, state, serial_in, transmissionOk)
			begin
				if reset = '1' then
					state <= q0;
				elsif rising_edge(clock) then
					case state is
						when q0 =>
							if serial_in = '0' then
								state <= q1;
							else
								state <= q0;
							end if;
						when q1 =>
							if transmissionOk <= '1' then
								state <= q2;
							else
								state <= q1;
							end if;
						when q2 =>
							state <= q3;
							
						when q3 =>
							state <= q0;
					end case;
				end if;
			end process;
	with state select loadRegister <=
		'0' when q0,
		'1' when others;
		
	with state select stateValue <=
		"00" when q0,
		"01" when q1,
		"10" when q2,
		"11" when q3,
		"00" when others;
		
end architecture;

--RSR
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
entity RSR is
	port(
		clock, reset, load : in std_logic; -- Recebe o clock reduzido em 16 vezes!
		serial_in : in std_logic;
		parallel_out : out std_logic_vector(10 downto 0) := "00000000000";
		word : out std_logic_vector(7 downto 0);
		parity_bit : out std_logic
	);
end entity;

architecture behav of RSR is
	signal reg : std_logic_vector(10 downto 0) := "00000000000";
	begin
		process(clock, reset, load)
		begin
			if reset = '1' then
				reg <= "00000000000";
			elsif rising_edge(clock) then
				if load = '1' then
					reg <= serial_in & reg(10 downto 1);
				end if;
			end if;
				--adição do start bit como LSB
			
			if load'event and load = '0' then
				reg <= reg(9 downto 0) & '0';
			end if;
		end process;
		parallel_out <= reg;
		word <= reg(8 downto 1);
		parity_bit <= reg(9);
end architecture;

--Detector de paridade
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
entity parity_detector is
	port(
		data : in std_logic_vector(7 downto 0);
		parity_bit : in std_logic;
		LSR_second_bit : out std_logic
		);
end entity;

architecture behav of parity_detector is
	signal parity : std_logic;
	begin
		parity <= data(7) xor data(6) xor data(5) xor data(4) xor data (3) xor data(2) xor data(1) xor data(0);
		--Se parity = 0 -> par; parity = 1 -> ímpar
		--Assumindo paridade par, se parity = 0 e parity_bit = 0 -> LSR_second_bit = 0
		--                        se parity = 0 e parity_bit = 1 -> LSR_second_bit = 1
		--                        se parity = 1 e parity_bit = 0 -> LSR_second_bit = 1
		--                        se parity = 1 e parity_bit = 1 -> LSR_second_bit = 0
		-- Logo:
		LSR_second_bit <= parity xor parity_bit;
end architecture;

							
							
--Contador para obter os 9600 bps
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
entity clock_div_counter is
	port(
		clock, reset, recep_is_on : in std_logic;
		clock_out : out std_logic := '0' --Para obter o baud rate de 9600 bps
	);
end entity;

architecture behav of clock_div_counter is
	signal count : unsigned(3 downto 0) := "0000"; 
	signal clk_div : std_logic := '0';
	begin
		process(clock, reset, recep_is_on)
		begin
			if reset = '1' then
				count <= "0000";
				clk_div <= '0';
			elsif rising_edge(clock) then
				if count = "1111" then
					count <=  "0000";
					clk_div <= not clk_div;
				else
					count <= count + 1;
				end if;
			end if;
		end process;
		
		clock_out <= clk_div;
end architecture;

--Contador relacionado aos 8 bits transmitidos
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity transmissionCounter is
	port(
		clock, reset, transmissionRunning : in std_logic;
		transmissionOk : out std_logic := '0'
	);
end entity;

architecture behav of transmissionCounter is
	signal count : unsigned(3 downto 0) := "0000";
	begin
		process(clock, transmissionRunning, reset)
		begin
			if reset = '1' then
				count <= "0000";
				transmissionOk <= '0';
			elsif rising_edge(clock) then
				if transmissionRunning = '1' then
					count <= count + 1;
				end if;
				if count = "1011" then --11 -> start bit + 8 bits transmitidos + parity bit + stop bit
					transmissionOk <= '1';
					count <= "0000";
				end if;
			end if;
		end process;
end architecture;
							
--BGR
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baud_rate_generator is
	port (
	    clock : in std_logic; -- Recebe o sinal Phase Lock Loop 
	    -- IP Catalog > Library > Clocks > PLLs and Resets > PLL > PLL Intel FPGA > vhdl
	    -- Base/Ref clock : 50MHz 
	    -- Desired clock: 1.8432MHz
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
	);
end baud_rate_generator;

architecture arch_bgr of baud_rate_generator is
	-- O coração
	component simple_counter is
	generic(WIDTH: natural := 16);
	port(
		clock, reset: in std_logic;
		enable: in std_logic;
		data_o: out std_logic_vector(WIDTH -1 downto 0)
	);
	end component;	
	-- A mente
	signal c : std_logic_vector(15 downto 0);
	signal r : std_logic := '0';
	signal bgr_clock : std_logic := '0';
begin
	-- O resultado
	baudOut_n <= bgr_clock;

	-- O processo
	cnt : simple_counter
	generic map (WIDTH=>16)
	port map(clock=>clock, reset=>r, enable=>'1',data_o=>c);

	process(clock, reset)
	begin
		if reset = '1' then
			bgr_clock<='0';
			r <= '1';
		else
			-- pois o contador começa em 0
			if(unsigned(c) = unsigned(divisor)) then
				bgr_clock<= not bgr_clock; 
				r <= '1';
			else
				r <= '0';
			end if;
		end if;
	end process;
	-- Filosofia vhdl
end arch_bgr;

--simple counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_counter is
	generic(
		WIDTH: natural := 16);
	port(
		clock, reset: in std_logic;
		enable: in std_logic;
		data_o: out std_logic_vector(WIDTH -1 downto 0)
		);
end simple_counter;

architecture counter_arch of simple_counter is
	signal count: std_logic_vector(WIDTH-1 downto 0) := (others => '0'); --inicia zerado
	begin
		process(clock,reset)
		begin
			if reset = '1' then
				count <= (others => '0');
			elsif rising_edge(clock) and enable = '1' then
				count <= std_logic_vector(unsigned(count) + 1);
			end if;
		end process;
	data_o <= count;
end counter_arch;

--ascii2seg
library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity ascii2seg is
port( 
		off: in std_logic; -- precisa ser 0 para mostrar algum valor
		  asc: in std_logic_vector(6 downto 0);
		  seg: out std_logic_vector(6 downto 0);
		  dot: out std_logic -- ponto decimal, aparentemente ignorado pela placa
	);
	
end ascii2seg;

architecture comportamental of ascii2seg is
	begin
		-- Por algum motivo, a lógica usada no hex2seg usa um "ativo em baixo"...
		seg(6 downto 0) <= 
			"0000000" when off = '1' else
			"1111111" when asc = "0100000" else --32 
			"1111001" when asc = "0100001" else --33
			"1011101" when asc = "0100010" else --34
			"0000001" when asc = "0100011" else --35
			"0010010" when asc = "0100100" else --36 
			"0101101" when asc = "0100101" else --37
			"0111001" when asc = "0100110" else --38
			"1011111" when asc = "0100111" else --39
			"1010110" when asc = "0101000" else --40 
			"1110100" when asc = "0101001" else --41
			"1011110" when asc = "0101010" else --42
			"0001111" when asc = "0101011" else --43
			"1101111" when asc = "0101100" else --44 
			"0111111" when asc = "0101101" else --45
			"1111111" when asc = "0101110" else --46
			"0101101" when asc = "0101111" else --47
			"1000000" when asc = "0110000" else --48 
			"1111001" when asc = "0110001" else --49
			"0100100" when asc = "0110010" else --50
			"0110000" when asc = "0110011" else --51
			"0011001" when asc = "0110100" else --52 
			"0010010" when asc = "0110101" else --53
			"0000010" when asc = "0110110" else --54
			"1111000" when asc = "0110111" else --55
			"0000000" when asc = "0111000" else --56 
			"0010000" when asc = "0111001" else --57
			"1110110" when asc = "0111010" else --58
			"1110010" when asc = "0111011" else --59
			"0011110" when asc = "0111100" else --60 
			"0110111" when asc = "0111101" else --61
			"0111100" when asc = "0111110" else --62
			"0101100" when asc = "0111111" else --63
			"0100000" when asc = "1000000" else --64 
			"0001000" when asc = "1000001" else --65
			"0000011" when asc = "1000010" else --66
			"1000110" when asc = "1000011" else --67
			"0100001" when asc = "1000100" else --68 
			"0000110" when asc = "1000101" else --69
			"0001110" when asc = "1000110" else --70
			"1000010" when asc = "1000111" else --71
			"0001001" when asc = "1001000" else --72 
			"1001111" when asc = "1001001" else --73
			"1100001" when asc = "1001010" else --74
			"0001010" when asc = "1001011" else --75
			"0111000" when asc = "1001100" else --76 
			"1101010" when asc = "1001101" else --77
			"1001000" when asc = "1001110" else --78
			"1000000" when asc = "1001111" else --79
			"0001100" when asc = "1010000" else --80 
			"0010100" when asc = "1010001" else --81
			"1001100" when asc = "1010010" else --82
			"0010010" when asc = "1010011" else --83
			"0000111" when asc = "1010100" else --84 
			"1000001" when asc = "1010101" else --85
			"1000001" when asc = "1010110" else --86
			"1010101" when asc = "1010111" else --87
			"0001001" when asc = "1011000" else --88 
			"0010001" when asc = "1011001" else --89
			"0100100" when asc = "1011010" else --90
			"1000110" when asc = "1011011" else --91
			"0011011" when asc = "1011100" else --92 
			"1110000" when asc = "1011101" else --93
			"1011100" when asc = "1011110" else --94
			"1110111" when asc = "1011111" else --95
			"1111101" when asc = "1100000" else --96 
			"0100000" when asc = "1100001" else --97
			"0000011" when asc = "1100010" else --98
			"0100111" when asc = "1100011" else --99
			"0100001" when asc = "1100100" else --100 
			"0000100" when asc = "1100101" else --101
			"0001110" when asc = "1100110" else --102
			"0010000" when asc = "1100111" else --103
			"0001011" when asc = "1101000" else --104 
			"1101111" when asc = "1101001" else --105
			"1110011" when asc = "1101010" else --106
			"0001010" when asc = "1101011" else --107
			"1001111" when asc = "1101100" else --108
			"1101011" when asc = "1101101" else --109
			"0101011" when asc = "1101110" else --110
			"0100011" when asc = "1101111" else --111
			"0001100" when asc = "1110000" else --112
			"0011000" when asc = "1110001" else --113
			"0101111" when asc = "1110010" else --114
			"0010010" when asc = "1110011" else --115
			"0000111" when asc = "1110100" else --116
			"1100011" when asc = "1110101" else --117
			"1100011" when asc = "1110110" else --118
			"1101011" when asc = "1110111" else --119
			"0001001" when asc = "1111000" else --120
			"0010001" when asc = "1111001" else --121
			"0100100" when asc = "1111010" else --122
			"0111001" when asc = "1111011" else --123
			"1001111" when asc = "1111100" else --124 
			"0001111" when asc = "1111101" else --125
			"1111110" when asc = "1111110" else --126
			"1111111" when asc = "1111111" else --127
			"0000000";
end comportamental;