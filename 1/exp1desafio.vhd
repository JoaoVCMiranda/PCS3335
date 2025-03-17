
entity ascii2seg is
port( off: in bit; -- precisa ser 0 para mostrar algum valor
      asc: in bit_vector(6 downto 0);
	  seg: out bit_vector(6 downto 0);
	  dot: out bit; -- ponto decimal, aparentemente ignorado pela placa
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
			"0000000"
end comportamental;
			