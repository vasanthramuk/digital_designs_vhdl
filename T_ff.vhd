
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_ff is
    Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : buffer STD_LOGIC;
           Q_not : buffer STD_LOGIC);
end T_ff;

architecture Behavioral of T_ff is
    component D_ff
        Port ( D, CLK, RST : in STD_LOGIC;
           Q, Q_not: buffer STD_LOGIC);
    end component;
    
    signal D_ff_input: std_logic;
    
    begin
        D_ff_input <= T xor Q;
        D_ff0 : D_ff
            port map(D=> D_ff_input , CLK=> CLK, RST => RST,
            Q=> Q, Q_not=> Q_not );
        
end Behavioral;
