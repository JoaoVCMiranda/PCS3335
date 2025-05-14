library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart is
	port(
		-- RCLK
		clock : in std_logic;
		-- MR 
		reset : in std_logic;
		-- BAODOUT
		baudout : out std_logic;
		-- D7...D0
		D : 	in std_logic_vector(7 downto 0);
	   	-- RD
		read: in std_logic;
		-- WR
		write: in std_logic;
		-- Tem uma nova mensagem pra vc!
		rxrdy: out std_logic;
		-- Mensagem enviada!
		txrdy: out std_logic;
		-- SIN
		rx: in std_logic;
		-- SOUT
		tx: out std_logic;
	    );
end entity;

architecture arch of uart is
	component control_unit_tx is
		port (
			clock: in std_logic;
			reset: in std_logic;
			start: in std_logic;
			dados: in std_logic;
			sout: out std_logic;
			out_clock: out std_logic
		);
	end component;
begin 
end architecture arch;


