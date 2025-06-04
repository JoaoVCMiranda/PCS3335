library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(255 downto 0);
	    sout  : out std_logic;
      ok    : out std_logic
	);
end tx;

architecture arch_tx of tx is
component control_unit_tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic;
		  done: out std_logic;
      current_state : out std_logic_vector(3 downto 0)
	);
  end component;
	component baud_rate_generator is
	port(
	    clock : in std_logic;
	    reset : in std_logic;
	    divisor : in std_logic_vector(15 downto 0);
	    baudOut_n: out std_logic
    	);
	end component;

	type states is (O, T,
  L1_Q1,L2_Q1,
  L1_Q2,L2_Q2,
  L1_Q3,L2_Q3,
  L1_Q4,L2_Q4,
  L1_Q5,L2_Q5,
  L1_Q6,L2_Q6,
  L1_Q7,L2_Q7,
  L1_Q8,L2_Q8,
  L1_Q9,L2_Q9,
  L1_Q10,L2_Q10,
  L1_Q11,L2_Q11,
  L1_Q12,L2_Q12,
  L1_Q13,L2_Q13,
  L1_Q14,L2_Q14,
  L1_Q15,L2_Q15,
  L1_Q16,L2_Q16,
  N);
	signal state, next_state : states := O;
  signal letra : std_logic_vector(7 downto 0);
  signal enviar : std_logic := '1';
  signal data_out : std_logic;
  signal done : std_logic;
  signal signal_ok   : std_logic;
  signal current_state : std_logic_vector(3 downto 0);
  signal state_tx : std_logic_vector(5 downto 0);

  signal brg_clock 	: std_logic;
	signal super_clock	: std_logic;
	------------ Alterar o BaudRate aqui caso seja necessário ------------
	signal div 		: integer := 11;
	signal div_vector	: std_logic_vector(15 downto 0);

begin

  control :  control_unit_tx
  port map(super_clock, reset, enviar, letra, data_out, done, current_state);

  --- Instâncias de componentes
	--- Conexões de controle
	div_vector <= std_logic_vector(to_unsigned(div, 16));
	BGR: baud_rate_generator
	port map(clock=>clock, reset=>reset, divisor=>div_vector, baudOut_n=>brg_clock);
	--- Superamostargem
	super: baud_rate_generator
	port map(clock=>brg_clock, reset=>reset, divisor=>"0000000000001111", baudOut_n=>super_clock);

  sout <= data_out;
  ok <= signal_ok;

  with state select
      state_tx <= "000000" when O,
                  "000001" when T,
                  "000010" when L1_Q1,
                  "000011" when L2_Q1,
                  "000101" when L1_Q2,
                  "000110" when L2_Q2,
                  "000111" when L1_Q3,
                  "001000" when L2_Q3,
                  "001001" when L1_Q4,
                  "001010" when L2_Q4,
                  "001011" when L1_Q5,
                  "001100" when L2_Q5,
                  "001101" when L1_Q6,
                  "001110" when L2_Q6,
                  "001111" when L1_Q7,
                  "010000" when L2_Q7,
                  "010001" when L1_Q8,
                  "010010" when L2_Q8,
                  "010011" when L1_Q9,
                  "010100" when L2_Q9,
                  "010101" when L1_Q10,
                  "010110" when L2_Q10,
                  "010111" when L1_Q11,
                  "011000" when L2_Q11,
                  "011001" when L1_Q12,
                  "011010" when L2_Q12,
                  "011011" when L1_Q13,
                  "011100" when L2_Q13,
                  "011101" when L1_Q14,
                  "011110" when L2_Q14,
                  "011111" when L1_Q15,
                  "100000" when L2_Q15,
                  "100001" when L1_Q16,
                  "100010" when L2_Q16,
                  "100011" when N,
                  "XXXXXX" when others;



  process(super_clock, reset)
  begin
    if reset = '1' then
      state <= O;
    elsif falling_edge(super_clock) then
    case state is
      when O =>
        if start = '1' then
          state <= T;
        end if;
      when T =>
        letra <= "00010110";
        enviar <= '1';
        state <= L1_Q1;
      when L1_Q1 =>
          if done = '1' then
            letra <= dados(255 downto 248);
            enviar <= '1';
            state <= L1_Q2;
          end if;
      when L1_Q2 =>
          if done = '1' then
            letra <= dados(247 downto 240);
            enviar <= '1';
            state <= L1_Q3;
          end if;
      when L1_Q3 =>
          if done = '1' then
            letra <= dados(239 downto 232);
            enviar <= '1';
            state <= L1_Q4;
          end if;
      when L1_Q4 =>
          if done = '1' then
            letra <= dados(231 downto 224);
            enviar <= '1';
            state <= L1_Q5;
          end if;
      when L1_Q5 =>
          if done = '1' then
            letra <= dados(223 downto 216);
            enviar <= '1';
            state <= L1_Q6;
          end if;
      when L1_Q6 =>
          if done = '1' then
            letra <= dados(215 downto 208);
            enviar <= '1';
            state <= L1_Q7;
          end if;
      when L1_Q7 =>
          if done = '1' then
            letra <= dados(207 downto 200);
            enviar <= '1';
            state <= L1_Q8;
          end if;
      when L1_Q8 =>
          if done = '1' then
            letra <= dados(199 downto 192);
            enviar <= '1';
            state <= L1_Q9;
          end if;
      when L1_Q9 =>
          if done = '1' then
            letra <= dados(191 downto 184);
            enviar <= '1';
            state <= L1_Q10;
          end if;
      when L1_Q10 =>
          if done = '1' then
            letra <= dados(183 downto 176);
            enviar <= '1';
            state <= L1_Q11;
          end if;
      when L1_Q11 =>
          if done = '1' then
            letra <= dados(175 downto 168);
            enviar <= '1';
            state <= L1_Q12;
          end if;
      when L1_Q12 =>
          if done = '1' then
            letra <= dados(167 downto 160);
            enviar <= '1';
            state <= L1_Q13;
          end if;
      when L1_Q13 =>
          if done = '1' then
            letra <= dados(159 downto 152);
            enviar <= '1';
            state <= L1_Q14;
          end if;
      when L1_Q14 =>
          if done = '1' then
            letra <= dados(151 downto 144);
            enviar <= '1';
            state <= L1_Q15;
          end if;
      when L1_Q15 =>
          if done = '1' then
            letra <= dados(143 downto 136);
            enviar <= '1';
            state <= L1_Q16;
          end if;
      when L1_Q16 =>
          if done = '1' then
            letra <= dados(135 downto 128);
            enviar <= '1';
            state <= L2_Q1;
          end if;
      when L2_Q1 =>
          if done = '1' then
            letra <= dados(127 downto 120);
            enviar <= '1';
            state <= L2_Q2;
          end if;
      when L2_Q2 =>
          if done = '1' then
            letra <= dados(119 downto 112);
            enviar <= '1';
            state <= L2_Q3;
          end if;
      when L2_Q3 =>
          if done = '1' then
            letra <= dados(111 downto 104);
            enviar <= '1';
            state <= L2_Q4;
          end if;
      when L2_Q4 =>
          if done = '1' then
            letra <= dados(103 downto 96);
            enviar <= '1';
            state <= L2_Q5;
          end if;
      when L2_Q5 =>
          if done = '1' then
            letra <= dados(95 downto 88);
            enviar <= '1';
            state <= L2_Q6;
          end if;
      when L2_Q6 =>
          if done = '1' then
            letra <= dados(87 downto 80);
            enviar <= '1';
            state <= L2_Q7;
          end if;
      when L2_Q7 =>
          if done = '1' then
            letra <= dados(79 downto 72);
            enviar <= '1';
            state <= L2_Q8;
          end if;
      when L2_Q8 =>
          if done = '1' then
            letra <= dados(71 downto 64);
            enviar <= '1';
            state <= L2_Q9;
          end if;
      when L2_Q9 =>
          if done = '1' then
            letra <= dados(63 downto 56);
            enviar <= '1';
            state <= L2_Q10;
          end if;
      when L2_Q10 =>
          if done = '1' then
            letra <= dados(55 downto 48);
            enviar <= '1';
            state <= L2_Q11;
          end if;
      when L2_Q11 =>
          if done = '1' then
            letra <= dados(47 downto 40);
            enviar <= '1';
            state <= L2_Q12;
          end if;
      when L2_Q12 =>
          if done = '1' then
            letra <= dados(39 downto 32);
            enviar <= '1';
            state <= L2_Q13;
          end if;
      when L2_Q13 =>
          if done = '1' then
            letra <= dados(31 downto 24);
            enviar <= '1';
            state <= L2_Q14;
          end if;
      when L2_Q14 =>
          if done = '1' then
            letra <= dados(23 downto 16);
            enviar <= '1';
            state <= L2_Q15;
          end if;
      when L2_Q15 =>
          if done = '1' then
            letra <= dados(15 downto 8);
            enviar <= '1';
            state <= L2_Q16;
          end if;
      when L2_Q16 =>
          if done = '1' then
            letra <= dados(7 downto 0);
            enviar <= '1';
            state <= N;
          end if;
      when N =>
          if done = '1' then
            letra <= "00010110";
            enviar <= '1';
            state <= O;
            signal_ok <= '1';
          end if;
      end case;
    end if;
  end process;
end architecture;















