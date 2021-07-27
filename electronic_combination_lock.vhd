
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity electronic_combination_lock is
    Port ( reset     : in STD_LOGIC;
           key       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           unlock    : out STD_LOGIC);
end electronic_combination_lock;

architecture Behavioral of electronic_combination_lock is
    component T_ff
        Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : buffer STD_LOGIC;
           Q_not : buffer STD_LOGIC);
    end component;
    
    signal T_in     : std_logic_vector(2 downto 0);
    signal T_out    : std_logic_vector(2 downto 0);
    signal T_out_not: std_logic_vector(2 downto 0);
     
    begin
        T_ff2:  T_ff
            port map(T=> T_in(2), CLK=> CLK , RST=> reset, Q=> T_out(2), Q_not=> T_out_not(2));
            
        T_ff1:  T_ff
            port map(T=> T_in(1), CLK=> CLK , RST=> reset, Q=> T_out(1), Q_not=> T_out_not(1));
            
        T_ff0:  T_ff
            port map(T=> T_in(0), CLK=> CLK , RST=> reset, Q=> T_out(0), Q_not=> T_out_not(0));
            
        
        
        --T_ff2
        T_in(2) <= (T_out(2) and T_out(1)) or (T_out(2) and (not key)) 
                    or ( T_out(2) and T_out(0)) or (T_out(1) and T_out(0) and key);
        
        --T_ff1
        T_in(1) <= (T_out(2) and T_out(1)) or (T_out(1) and key)
                     or (T_out(2) and T_out_not(0) and (not key)) or (T_out_not(2) and T_out(0) and key);
        
        --T_ff0
        T_in(0) <= (T_out(0) and key) or (T_out(2) and T_out(1) and T_out(0)) 
                    or (T_out(2) and T_out_not(1) and T_out_not(0)) 
                    or (T_out_not(2) and T_out_not(0) and (not key));
        
        unlock <=  T_out(2) and T_out_not(1) and T_out(0) ;
end Behavioral;
