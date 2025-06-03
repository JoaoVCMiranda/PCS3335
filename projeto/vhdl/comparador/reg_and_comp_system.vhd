-- Sistema de comparação de registradores

library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity reg_and_comp_system is
	port(
		clock, reset : in std_logic;
		data_in : in std_logic_vector(127 downto 0);
		guess : in std_logic_vector(7 downto 0);
        comp_OK_out : out unsigned(15 downto 0);
        comps_saved_out : out std_logic_vector(15 downto 0);
        bad_guess : out std_logic := '0';
        transmission_start : in std_logic;
        transmission_over : out std_logic;
        serial_out : out std_logic;
        prepare_simple_regs : in std_logic;
        game_ready : in std_logic --sinal enviado pela UC para indicar que os regs estão prontos e o jogo começou
    );
end entity;

architecture behav of reg_and_comp_system is
    --signal comparation_vector : std_logic_vector(127 downto 0);
    signal comps_saved : std_logic_vector(15 downto 0) := (others => '0');
    signal comp_OK : std_logic_vector(15 downto 0);
    signal mega_register_in_signal: std_logic_vector(127 downto 0);
    signal load_simple_regs : std_logic_vector(15 downto 0) := (others => '0');
    signal load_mega_register : std_logic := '1';
    
    component simple_reg is
        port(
            reset, load : in std_logic;
            data_in : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    component mega_register is
    port(
        clock, reset, load, transmission_on : in std_logic;
        data_in : in std_logic_vector(127 downto 0);
        serial_out : out std_logic := '1';
        transmission_ok_out : out std_logic := '0'
        
    );
    end component;
    
    
    begin
        reg15 : simple_reg port map(reset, load_simple_regs(15), data_in(127 downto 120), mega_register_in_signal(127 downto 120));
        reg14 : simple_reg port map(reset, load_simple_regs(14), data_in(119 downto 112), mega_register_in_signal(119 downto 112));
        reg13 : simple_reg port map(reset, load_simple_regs(13), data_in(111 downto 104), mega_register_in_signal(111 downto 104));
        reg12 : simple_reg port map(reset, load_simple_regs(12), data_in(103 downto 96 ), mega_register_in_signal(103 downto 96));
        reg11 : simple_reg port map(reset, load_simple_regs(11), data_in(95  downto 88 ), mega_register_in_signal(95  downto 88));
        reg10 : simple_reg port map(reset, load_simple_regs(10), data_in(87  downto 80 ), mega_register_in_signal(87  downto 80));
        reg9  : simple_reg port map(reset, load_simple_regs(9) , data_in(79  downto 72 ), mega_register_in_signal(79  downto 72));
        reg8  : simple_reg port map(reset, load_simple_regs(8) , data_in(71  downto 64 ), mega_register_in_signal(71  downto 64));
        reg7  : simple_reg port map(reset, load_simple_regs(7) , data_in(63  downto 56 ), mega_register_in_signal(63  downto 56));
        reg6  : simple_reg port map(reset, load_simple_regs(6) , data_in(55  downto 48 ), mega_register_in_signal(55  downto 48));
        reg5  : simple_reg port map(reset, load_simple_regs(5) , data_in(47  downto 40 ), mega_register_in_signal(47  downto 40));
        reg4  : simple_reg port map(reset, load_simple_regs(4) , data_in(39  downto 32 ), mega_register_in_signal(39  downto 32));
        reg3  : simple_reg port map(reset, load_simple_regs(3) , data_in(31  downto 24 ), mega_register_in_signal(31  downto 24));
        reg2  : simple_reg port map(reset, load_simple_regs(2) , data_in(23  downto 16 ), mega_register_in_signal(23  downto 16));
        reg1  : simple_reg port map(reset, load_simple_regs(1) , data_in(15  downto 8  ), mega_register_in_signal(15  downto 8));
        reg0  : simple_reg port map(reset, load_simple_regs(0) , data_in(7   downto 0  ), mega_register_in_signal(7   downto 0));
        mega_reg : mega_register port map(clock, reset, load_mega_register, transmission_start, mega_register_in_signal, serial_out, 
            transmission_over);


        comp_OK(15) <= (guess(7) xnor data_in(127)) and (guess(6) xnor data_in(126)) and (guess(5) xnor data_in(125)) and
               (guess(4) xnor data_in(124)) and (guess(3) xnor data_in(123)) and (guess(2) xnor data_in(122)) and
               (guess(1) xnor data_in(121)) and (guess(0) xnor data_in(120));

        comp_OK(14) <= (guess(7) xnor data_in(119)) and (guess(6) xnor data_in(118)) and (guess(5) xnor data_in(117)) and
                    (guess(4) xnor data_in(116)) and (guess(3) xnor data_in(115)) and (guess(2) xnor data_in(114)) and
                    (guess(1) xnor data_in(113)) and (guess(0) xnor data_in(112));

        comp_OK(13) <= (guess(7) xnor data_in(111)) and (guess(6) xnor data_in(110)) and (guess(5) xnor data_in(109)) and
                    (guess(4) xnor data_in(108)) and (guess(3) xnor data_in(107)) and (guess(2) xnor data_in(106)) and
                    (guess(1) xnor data_in(105)) and (guess(0) xnor data_in(104));

        comp_OK(12) <= (guess(7) xnor data_in(103)) and (guess(6) xnor data_in(102)) and (guess(5) xnor data_in(101)) and
                    (guess(4) xnor data_in(100)) and (guess(3) xnor data_in(99)) and (guess(2) xnor data_in(98)) and
                    (guess(1) xnor data_in(97)) and (guess(0) xnor data_in(96));

        comp_OK(11) <= (guess(7) xnor data_in(95)) and (guess(6) xnor data_in(94)) and (guess(5) xnor data_in(93)) and
                    (guess(4) xnor data_in(92)) and (guess(3) xnor data_in(91)) and (guess(2) xnor data_in(90)) and
                    (guess(1) xnor data_in(89)) and (guess(0) xnor data_in(88));

        comp_OK(10) <= (guess(7) xnor data_in(87)) and (guess(6) xnor data_in(86)) and (guess(5) xnor data_in(85)) and
                    (guess(4) xnor data_in(84)) and (guess(3) xnor data_in(83)) and (guess(2) xnor data_in(82)) and
                    (guess(1) xnor data_in(81)) and (guess(0) xnor data_in(80));

        comp_OK(9)  <= (guess(7) xnor data_in(79)) and (guess(6) xnor data_in(78)) and (guess(5) xnor data_in(77)) and
                    (guess(4) xnor data_in(76)) and (guess(3) xnor data_in(75)) and (guess(2) xnor data_in(74)) and
                    (guess(1) xnor data_in(73)) and (guess(0) xnor data_in(72));

        comp_OK(8)  <= (guess(7) xnor data_in(71)) and (guess(6) xnor data_in(70)) and (guess(5) xnor data_in(69)) and
                    (guess(4) xnor data_in(68)) and (guess(3) xnor data_in(67)) and (guess(2) xnor data_in(66)) and
                    (guess(1) xnor data_in(65)) and (guess(0) xnor data_in(64));

        comp_OK(7)  <= (guess(7) xnor data_in(63)) and (guess(6) xnor data_in(62)) and (guess(5) xnor data_in(61)) and
                    (guess(4) xnor data_in(60)) and (guess(3) xnor data_in(59)) and (guess(2) xnor data_in(58)) and
                    (guess(1) xnor data_in(57)) and (guess(0) xnor data_in(56));

        comp_OK(6)  <= (guess(7) xnor data_in(55)) and (guess(6) xnor data_in(54)) and (guess(5) xnor data_in(53)) and
                    (guess(4) xnor data_in(52)) and (guess(3) xnor data_in(51)) and (guess(2) xnor data_in(50)) and
                    (guess(1) xnor data_in(49)) and (guess(0) xnor data_in(48));

        comp_OK(5)  <= (guess(7) xnor data_in(47)) and (guess(6) xnor data_in(46)) and (guess(5) xnor data_in(45)) and
                    (guess(4) xnor data_in(44)) and (guess(3) xnor data_in(43)) and (guess(2) xnor data_in(42)) and
                    (guess(1) xnor data_in(41)) and (guess(0) xnor data_in(40));

        comp_OK(4)  <= (guess(7) xnor data_in(39)) and (guess(6) xnor data_in(38)) and (guess(5) xnor data_in(37)) and
                    (guess(4) xnor data_in(36)) and (guess(3) xnor data_in(35)) and (guess(2) xnor data_in(34)) and
                    (guess(1) xnor data_in(33)) and (guess(0) xnor data_in(32));

        comp_OK(3)  <= (guess(7) xnor data_in(31)) and (guess(6) xnor data_in(30)) and (guess(5) xnor data_in(29)) and
                    (guess(4) xnor data_in(28)) and (guess(3) xnor data_in(27)) and (guess(2) xnor data_in(26)) and
                    (guess(1) xnor data_in(25)) and (guess(0) xnor data_in(24));

        comp_OK(2)  <= (guess(7) xnor data_in(23)) and (guess(6) xnor data_in(22)) and (guess(5) xnor data_in(21)) and
                    (guess(4) xnor data_in(20)) and (guess(3) xnor data_in(19)) and (guess(2) xnor data_in(18)) and
                    (guess(1) xnor data_in(17)) and (guess(0) xnor data_in(16));

        comp_OK(1)  <= (guess(7) xnor data_in(15)) and (guess(6) xnor data_in(14)) and (guess(5) xnor data_in(13)) and
                    (guess(4) xnor data_in(12)) and (guess(3) xnor data_in(11)) and (guess(2) xnor data_in(10)) and
                    (guess(1) xnor data_in(9))  and (guess(0) xnor data_in(8));

        comp_OK(0)  <= (guess(7) xnor data_in(7)) and (guess(6) xnor data_in(6)) and (guess(5) xnor data_in(5)) and
                    (guess(4) xnor data_in(4)) and (guess(3) xnor data_in(3)) and (guess(2) xnor data_in(2)) and
                    (guess(1) xnor data_in(1)) and (guess(0) xnor data_in(0));

        
        
        process(clock, reset, game_ready)
        begin
            if reset = '1' then
                comps_saved <= (others => '0');
            elsif rising_edge(clock) then
                comps_saved <= comps_saved or comp_OK;

                if prepare_simple_regs = '1' then
                    load_simple_regs <= "1111111111111111";
                elsif game_ready = '1' then
                    load_simple_regs <= comps_saved;
                end if;
            end if;
        end process;

        bad_guess <= not(comp_OK(0) or comp_OK(1) or comp_OK(2) or comp_OK(3) or comp_OK(4) or comp_OK(5) or comp_OK(6) or comp_OK(7) or comp_OK(8) or 
                         comp_OK(9) or comp_OK(10) or comp_OK(11) or comp_OK(12) or comp_OK(13) or comp_OK(14) or comp_OK(15));

        comps_saved_out <= comps_saved;
        comp_OK_out <= unsigned(comp_OK);
        load_mega_register <= not transmission_start;
end architecture;

