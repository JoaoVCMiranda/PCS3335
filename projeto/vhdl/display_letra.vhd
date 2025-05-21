library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_letra is
	port(
		seta_esquerda : in std_logic;
		seta_direita : in std_logic;
		seg_up : out std_logic_vector(6 downto 0);
		seg_down : out std_logic_vector(6 downto 0)
	);
end entity;

architecture comportamental of display_letra is
	type letras is (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z); 
begin
    seg_up(6 downto 0) <=
           --"0001110" when HEX="1111" else--
           "0000000";
    seg_down(6 downto 0) <=

           --"0001110" when HEX="1111" else--F
           "0000000";
end comportamental;