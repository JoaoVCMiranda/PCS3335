library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_tb is
end tx_tb;

architecture behavioral of tx_tb is

    -- Component Declaration for the UUT (Unit Under Test)
    component tx is
        port (
            clock : in std_logic;
            reset : in std_logic;
            start : in std_logic;
            dados : in std_logic_vector(255 downto 0);
            sout  : out std_logic;
            ok    : out std_logic
        );
    end component;

    -- Signal Declarations
    signal clock_s : std_logic := '0';
    signal reset_s : std_logic := '1'; -- Start with reset active
    signal start_s : std_logic := '0';
    signal dados_s : std_logic_vector(255 downto 0) := (others => '0');
    signal sout_s  : std_logic;
    signal ok_s    : std_logic;

    -- Clock Period Definition
    constant clock_period : time := 542 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut_tx : tx
    port map (
        clock => clock_s,
        reset => reset_s,
        start => start_s,
        dados => dados_s,
        sout  => sout_s,
        ok    => ok_s
    );

    -- Clock Generation Process
    clock_gen : process
    begin
        while true loop
            clock_s <= '0';
            wait for clock_period / 2;
            clock_s <= '1';
            wait for clock_period / 2;
        end loop;
    end process;

    -- Test Stimulus Process
    stimulus : process
    begin
        -- 1. Assert Reset
        reset_s <= '1';
        wait for clock_period * 2; -- Hold reset for a few clock cycles
        reset_s <= '0';            -- Deassert Reset
        wait for clock_period;

        -- 2. Send some data
        dados_s <= (others => '0'); -- Initialize data to all zeros
        wait for clock_period;
        dados_s <= "0100000101000010010000110100010001000101010001100100011101001000010010010100101001001011010011000100110101001110010011110101000001010001010100100101001101010100010101010101011001010111010110000101100101011010010000010100001001000011010001000100010101000110";
        -- You can set more bits of dados_s here for more complex test cases

        start_s <= '1';            -- Assert Start
        --wait for clock_period * 10;     -- Hold start for one clock cycle
        --start_s <= '0';            -- Deassert Start

        -- 3. Wait for 'ok' signal (or a specific duration)
        -- In a real scenario, you'd wait until 'ok_s' becomes '1'
        -- or for a duration long enough for the transmission to complete.
        -- For this example, let's just wait for a fixed duration.
        wait for clock_period * 100000; -- Assuming ~256 clock cycles for 256 bits + overhead

        -- 5. End simulation
        wait; -- Wait forever, stopping the simulation
    end process;

end behavioral;
