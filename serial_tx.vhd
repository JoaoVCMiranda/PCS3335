library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity serial_tx is
    port(
        clock, reset : in std_logic;
        serial_out : out std_logic;
        data_in : in std_logic_vector(255 downto 0);

        --debug:
        transm_current_state : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behav of serial_tx is

    signal loaded_data : std_logic_vector(255 downto 0);
    signal load, shifting_reg: std_logic := '0';
    signal plus_one, clear_counter : std_logic := '0';
    signal bytes_counter_value : unsigned(5 downto 0);
    signal start_count, finished_count : std_logic;
    
    --signal start_transm : std_logic;

    component bytes_counter is
        port(
        clock, reset, clear, plus_one : in std_logic;
        counter_value : out unsigned(5 downto 0)
        );
    end component;

    component simple_counter is
        port(    
        clock, reset, start_count : in std_logic;
        finished_count : out std_logic
    );
    end component;

    type state_type is (q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13);
    signal state : state_type;
    
    begin
        bytescounter : bytes_counter port map(clock, reset, clear_counter, plus_one, bytes_counter_value);
        simp_count : simple_counter port map(clock, reset, start_count, finished_count);

        process(clock, reset, state)
        begin
            if reset = '1' then
                state <= q0;
                
                --start_transm <= '0';
            elsif rising_edge(clock) then
                --start_transm <= '1';

                case state is
                    when q0 =>
                        if reset = '0' then
                            state <= q1;
                        else 
                            state <= q0;
                        end if;

                    when q1 => --carrega o registrador
                        state <= q2;

                    when q2 => --start bit
                        state <= q3;

                    when q3 => --data bit 1
                        state <= q4;

                    when q4 => --data bit 2
                        state <= q5;

                    when q5 => --data bit 3
                        state <= q6;

                    when q6 => --data bit 4
                        state <= q7;

                    when q7 => --data bit 5
                        state <= q8;

                    when q8 => --data bit 6
                        state <= q9;

                    when q9 => --data bit 7
                        state <= q10;

                    when q10 => --data bit 8
                        state <= q11;
                       

                    when q11 => --stop bit 
                        if bytes_counter_value = "100000" then
                            state <= q13;
                        else
                            state <= q12;
                        end if;

                    when q12 =>
                        if finished_count = '1' then
                            state <= q2;
                        else 
                            state <= q12;
                        end if;

                    when q13 =>
                        state <= q0;
                end case;

                if load = '1' then
                    loaded_data <= data_in;
                end if;

                if shifting_reg = '1' then
                    loaded_data <= '0' & loaded_data(255 downto 1);
                end if;
            end if;


    end process;

    with state select serial_out <=
        '1' when q0,
        '1' when q1,
        '0' when q2,
        '1' when q11,
        '1' when q12,
        '1' when q13,
        loaded_data(0) when others;

    with state select load <=
        '1' when q1,
        '0' when others;

    with state select shifting_reg <=
        '0' when q0,
        '0' when q1,
        '0' when q2,
        '0' when q11,
        '0' when q12,
        '0' when q13,
        '1' when others;

    with state select plus_one <=
        '1' when q11,
        '0' when others;

    with state select clear_counter <=
        '1' when q1,
        '0' when others;

    with state select start_count <=
        '1' when q12,
        '0' when others;

    with state select transm_current_state <=
        "0000" when q0,
        "0001" when q1,
        "0010" when q2,
        "0011" when q3,
        "0100" when q4,
        "0101" when q5,
        "0110" when q6,
        "0111" when q7,
        "1000" when q8,
        "1001" when q9,
        "1010" when q10,
        "1011" when q11,
        "1100" when q12,
        "1101" when q13,
        "0000" when others;


end architecture;


