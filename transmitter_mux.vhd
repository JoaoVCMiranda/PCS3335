library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity transmitter_mux is
    port(
        data_in_initial, data_in_reg_and_tip, data_in_reg_and_guess, data_in_regcomplete_and_vict, data_in_regcomplete_and_fail : in std_logic_vector(255 downto 0);
        FSM_out : in std_logic_vector(1 downto 0);
        key_out : std_logic; --para trocar entre exibição da dica e do palpite
        data_out : out std_logic_vector(255 downto 0)
    );
end entity;

architecture behav of transmitter_mux is
    signal data_buffer : std_logic_vector(255 downto 0);
    begin
        data_buffer <= data_in_initial when FSM_out = "00" else
                    data_in_reg_and_tip when FSM_out = "01" and key_out = '0' else
                    data_in_reg_and_guess when FSM_out = "01" and key_out = '1' else
                    data_in_regcomplete_and_vict when FSM_out = "10" else
                    data_in_regcomplete_and_fail;
						  
			data_out(255 downto 248) <= data_buffer(7 downto 0);
			data_out(247 downto 240) <= data_buffer(15 downto 8);
			data_out(239 downto 232) <= data_buffer(23 downto 16);
			data_out(231 downto 224) <= data_buffer(31 downto 24);
			data_out(223 downto 216) <= data_buffer(39 downto 32);
			data_out(215 downto 208) <= data_buffer(47 downto 40);
			data_out(207 downto 200) <= data_buffer(55 downto 48);
			data_out(199 downto 192) <= data_buffer(63 downto 56);
			data_out(191 downto 184) <= data_buffer(71 downto 64);
			data_out(183 downto 176) <= data_buffer(79 downto 72);
			data_out(175 downto 168) <= data_buffer(87 downto 80);
			data_out(167 downto 160) <= data_buffer(95 downto 88);
			data_out(159 downto 152) <= data_buffer(103 downto 96);
			data_out(151 downto 144) <= data_buffer(111 downto 104);
			data_out(143 downto 136) <= data_buffer(119 downto 112);
			data_out(135 downto 128) <= data_buffer(127 downto 120);
			data_out(127 downto 120) <= data_buffer(135 downto 128);
			data_out(119 downto 112) <= data_buffer(143 downto 136);
			data_out(111 downto 104) <= data_buffer(151 downto 144);
			data_out(103 downto 96)  <= data_buffer(159 downto 152);
			data_out(95 downto 88)   <= data_buffer(167 downto 160);
			data_out(87 downto 80)   <= data_buffer(175 downto 168);
			data_out(79 downto 72)   <= data_buffer(183 downto 176);
			data_out(71 downto 64)   <= data_buffer(191 downto 184);
			data_out(63 downto 56)   <= data_buffer(199 downto 192);
			data_out(55 downto 48)   <= data_buffer(207 downto 200);
			data_out(47 downto 40)   <= data_buffer(215 downto 208);
			data_out(39 downto 32)   <= data_buffer(223 downto 216);
			data_out(31 downto 24)   <= data_buffer(231 downto 224);
			data_out(23 downto 16)   <= data_buffer(239 downto 232);
			data_out(15 downto 8)    <= data_buffer(247 downto 240);
			data_out(7 downto 0)     <= data_buffer(255 downto 248);
end architecture;
