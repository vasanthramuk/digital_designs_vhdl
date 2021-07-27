
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synchronous_binary_counter_4 is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end synchronous_binary_counter_4;

architecture Behavioral of synchronous_binary_counter_4 is
    component T_ff
        Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : buffer STD_LOGIC;
           Q_not : buffer STD_LOGIC);
    end component;
    
    signal counter_out      : std_logic_vector(3 downto 0);
    signal counter_out_not  : std_logic_vector(3 downto 0);
    signal T_ff_in          : std_logic_vector(3 downto 0);
    
    begin
        T_ff_in(0)  <= '1';
        T_ff_in(1)  <= T_ff_in(0) and counter_out(0);
        T_ff_in(2)  <= T_ff_in(1) and counter_out(1);
        T_ff_in(3)  <= T_ff_in(2) and counter_out(2);
        
        Y <= counter_out;
        
        B3: T_ff
            port map(T=> T_ff_in(3), CLK=> CLK, RST=> RST, Q=> counter_out(3),Q_not=> counter_out_not(3));
        B2: T_ff
            port map(T=> T_ff_in(2), CLK=> CLK, RST=> RST, Q=> counter_out(2),Q_not=> counter_out_not(2));    
        B1: T_ff
            port map(T=> T_ff_in(1), CLK=> CLK, RST=> RST, Q=> counter_out(1),Q_not=> counter_out_not(1) );
        B0: T_ff
            port map(T=> T_ff_in(0), CLK=> CLK, RST=> RST, Q=> counter_out(0),Q_not=> counter_out_not(0));       
end Behavioral;
