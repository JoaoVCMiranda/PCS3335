library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture behav of tb is
    component forca is
    port(
        clock_pre_pll, reset : in std_logic;
        start_bt, select_bt, left_bt, right_bt, guess_on_key : in std_logic;
        difficulty_keys : in std_logic_vector(1 downto 0); --definem a dificuldade do jogo: 01 Fácil, 10 Médio e 11 Difícil
        lifes_out : out std_logic_vector(5 downto 0);
        serial_out : out std_logic;
        state_seg : out std_logic_vector(6 downto 0);

        --para debug:
        current_state_out : out std_logic_vector(3 downto 0);
        transm_in : out std_logic_vector(255 downto 0);
        transm_current_state : out std_logic_vector(3 downto 0);
        debug_stored_comps_out : out std_logic_vector(15 downto 0)
    );
    end component;

    signal clock_pre_pll_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';
    signal start_bt_tb : std_logic := '1';
    signal select_bt_tb : std_logic := '1';
    signal left_bt_tb : std_logic := '1';
    signal right_bt_tb : std_logic := '1';
    signal guess_on_key_tb : std_logic := '0';
    signal difficulty_keys_tb : std_logic_vector(1 downto 0) := "01";
    signal lifes_out_tb : std_logic_vector(5 downto 0);
    signal serial_out_tb : std_logic := '1';
    signal state_seg_tb : std_logic_vector(6 downto 0);
    signal current_state_out_tb : std_logic_vector(3 downto 0);
    signal transm_in_tb : std_logic_vector(255 downto 0);
    signal transm_current_state_tb : std_logic_vector(3 downto 0);
    signal debug_stored_comps_out_tb : std_logic_vector(15 downto 0);
    signal keepSimulating : std_logic := '0';

    begin
        clock_pre_pll_tb <= keepSimulating and not clock_pre_pll_tb after 271 ns;

        DUT: forca port map(clock_pre_pll_tb, reset_tb, start_bt_tb, select_bt_tb, left_bt_tb, right_bt_tb, guess_on_key_tb, difficulty_keys_tb, 
                             lifes_out_tb, serial_out_tb, state_seg_tb, current_state_out_tb, transm_in_tb, transm_current_state_tb, 
                             debug_stored_comps_out_tb);

        tests : process
        begin
            keepSimulating <= '1';
            wait for 50 ms;
            start_bt_tb <= '0';
            wait for 50 ms;
            difficulty_keys_tb <= "11";
            wait for 50 ms;
            select_bt_tb <= '0';
            wait for 50 ms;
            
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            
            --A para F:
            guess_on_key_tb <= '1';
            right_bt_tb <= '0';
            wait for 10 us;
            right_bt_tb <= '1';
            wait for 10 us;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;
            select_bt_tb <= '1';
            wait for 100 us;
            select_bt_tb <= '0';
            wait for 50 ms;

            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- wait for 10 ms;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --F para E:
            -- left_bt_tb <= '0';
            -- wait for 10 us;
            -- left_bt_tb <= '1';
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --E para C:
            -- left_bt_tb <= '0';
            -- wait for 10 us;
            -- left_bt_tb <= '1';
            -- wait for 10 us;
            -- left_bt_tb <= '0';
            -- wait for 10 us;
            -- left_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --C para I:
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --I para L:
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --L para N:
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --N para P:
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 50 ms;

            -- --P para V:
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- right_bt_tb <= '0';
            -- wait for 10 us;
            -- right_bt_tb <= '1';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 100 us;
            -- select_bt_tb <= '0';
            -- wait for 10 us;
            -- select_bt_tb <= '1';
            -- wait for 50 ms;
            


            report("Success");
            keepSimulating <= '0';
            wait;
        end process;
    end architecture;