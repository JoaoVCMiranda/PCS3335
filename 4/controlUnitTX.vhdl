library IEEE;

entity tx is
	port (
	    clock : in std_logic;
	    reset : in std_logic;
	    start : in std_logic;
	    dados : in std_logic_vector(7 downto 0);
	    sout  : out std_logic;
	     );
end tx;
