library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_ascii_alphabet is
    Port (
        clk         : in  std_logic;
        reset       : in  std_logic;
        switch_let  : in  std_logic;
        sel         : in  std_logic;
        ascii       : out std_logic_vector(7 downto 0)
    );
end fsm_ascii_alphabet;

architecture Behavioral of fsm_ascii_alphabet is

    type state_type is (A, B, C, D, E, F, G, H, I, J, K, L, M,
                        N, O, P, Q, R, S, T, U, V, W, X, Y, Z);
    signal state        : state_type := A;
    signal contador     : integer range 0 to 1843200:= 0;
    signal clk_int      : std_logic := '0';
    signal ascii_out    : std_logic_vector(7 downto 0);

begin

    ascii <= ascii_out;

    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0
        elsif rising_edge(clk) and switch_let = '0' then
            -- delay para não mudar muito rápido a letra. Produz um clock de periodo 400ms.
            if contador = 368640 then 
                clk_int <= not clk_int; -- Toggle clock every 368640 cycles
            end if;
        elsif rising_edge(clk) and sel = '1' then -- seleciona a letra, evita enviar uma letra indesejada
            ascii <= ascii_out;
        end if;

    process(clk_int, reset)
    begin
        if reset = '1' then
            state <= A;
        elsif rising_edge(clk) then
            case state is
                when A => state <= B;
                when B => state <= C;
                when C => state <= D;
                when D => state <= E;
                when E => state <= F;
                when F => state <= G;
                when G => state <= H;
                when H => state <= I;
                when I => state <= J;
                when J => state <= K;
                when K => state <= L;
                when L => state <= M;
                when M => state <= N;
                when N => state <= O;
                when O => state <= P;
                when P => state <= Q;
                when Q => state <= R;
                when R => state <= S;
                when S => state <= T;
                when T => state <= U;
                when U => state <= V;
                when V => state <= W;
                when W => state <= X;
                when X => state <= Y;
                when Y => state <= Z;
                when Z => state <= A;
            end case;
        end if;
    end process;

    process(state)
    begin
        case state is
            when A => ascii_out <= std_logic_vector(to_unsigned(character'pos('A'), 8));
            when B => ascii_out <= std_logic_vector(to_unsigned(character'pos('B'), 8));
            when C => ascii_out <= std_logic_vector(to_unsigned(character'pos('C'), 8));
            when D => ascii_out <= std_logic_vector(to_unsigned(character'pos('D'), 8));
            when E => ascii_out <= std_logic_vector(to_unsigned(character'pos('E'), 8));
            when F => ascii_out <= std_logic_vector(to_unsigned(character'pos('F'), 8));
            when G => ascii_out <= std_logic_vector(to_unsigned(character'pos('G'), 8));
            when H => ascii_out <= std_logic_vector(to_unsigned(character'pos('H'), 8));
            when I => ascii_out <= std_logic_vector(to_unsigned(character'pos('I'), 8));
            when J => ascii_out <= std_logic_vector(to_unsigned(character'pos('J'), 8));
            when K => ascii_out <= std_logic_vector(to_unsigned(character'pos('K'), 8));
            when L => ascii_out <= std_logic_vector(to_unsigned(character'pos('L'), 8));
            when M => ascii_out <= std_logic_vector(to_unsigned(character'pos('M'), 8));
            when N => ascii_out <= std_logic_vector(to_unsigned(character'pos('N'), 8));
            when O => ascii_out <= std_logic_vector(to_unsigned(character'pos('O'), 8));
            when P => ascii_out <= std_logic_vector(to_unsigned(character'pos('P'), 8));
            when Q => ascii_out <= std_logic_vector(to_unsigned(character'pos('Q'), 8));
            when R => ascii_out <= std_logic_vector(to_unsigned(character'pos('R'), 8));
            when S => ascii_out <= std_logic_vector(to_unsigned(character'pos('S'), 8));
            when T => ascii_out <= std_logic_vector(to_unsigned(character'pos('T'), 8));
            when U => ascii_out <= std_logic_vector(to_unsigned(character'pos('U'), 8));
            when V => ascii_out <= std_logic_vector(to_unsigned(character'pos('V'), 8));
            when W => ascii_out <= std_logic_vector(to_unsigned(character'pos('W'), 8));
            when X => ascii_out <= std_logic_vector(to_unsigned(character'pos('X'), 8));
            when Y => ascii_out <= std_logic_vector(to_unsigned(character'pos('Y'), 8));
            when Z => ascii_out <= std_logic_vector(to_unsigned(character'pos('Z'), 8));
        end case;
    end process;

end Behavioral;
