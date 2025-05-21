library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity not_uart is
	port(
		clock : in std_logic;
		reset : in std_logic;
		baudout : out std_logic;
		D : 	in std_logic_vector(7 downto 0);
		rd: in std_logic;
		-- WR
		wr: in std_logic;
		-- Tem uma nova mensagem pra vc!
		rxrdy: out std_logic;
		-- Mensagem enviada!
		txrdy: out std_logic;
		-- SIN
		rx: in std_logic;
		-- SOUT
		tx: out std_logic
	);
end entity;

architecture arch_not_uart of not_uart is
begin
end architecture;