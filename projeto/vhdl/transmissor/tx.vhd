entity tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(255 downto 0);
	    sout  : out std_logic
	);
end tx;

architecture arch_tx of tx is
component control_unit_tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic
	);
end component;

	type states is (O, Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16);
	signal state : states := S;
  signal letra : std_logic_vector(7 downto 0);
  signal enviar : std_logic;
  signal data_out : std_logic;

begin

  control :  control_unit_tx
  port map(clock, reset, enviar, letra, data_out);

  sout <= data_out;

  process(clock)
  begin
    if falling_edge(clock) then
    case state is
      when S =>
        if start = '1' then
          state <= Q1;
        end if;
      when Q1 =>
          letra <= dados(255 downto 248);
          enviar <= '1';
          state <= Q2;
      when Q2 =>
          if done = '1' then
              --- To be continued...
          end if;
      end case;
    end if;
  end process;



end architecture;
