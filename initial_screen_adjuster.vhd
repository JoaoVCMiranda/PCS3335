library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity initial_screen_adjuster is --define qual é a tela que deve ser exibida no início do jogo
    port(
        FSM_out : in std_logic_vector(1 downto 0);
        keys_out : in std_logic_vector(1 downto 0);
        word_selector_in : out std_logic_vector(1 downto 0)   
    );
end entity;

architecture behav of initial_screen_adjuster is

    begin
        word_selector_in <= "00" when FSM_out = "10" else --FSM está no estado q0
                            "01" when FSM_out = "01" and keys_out = "01" else --FSM no estado q1, chaves para modo fácil
                            "10" when FSM_out = "01" and keys_out = "10" else--FSM no estado q1, chaves para modo médio
                            "11" when FSM_out = "01" and keys_out = "11" else--FSM no estado q1, chaves para modo difícil
                            "00";
end architecture;