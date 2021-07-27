
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_T_ff is
end t_T_ff;

architecture Behavioral of t_T_ff is
    component T_ff is
        port( T, CLK, RST : in STD_LOGIC;
              Q, Q_not    : buffer STD_LOGIC);
    end component;
    
    --Stimulus
    signal t_T              : std_logic;
    signal t_RST            : std_logic := '0'; --starting with RST condition
    signal t_CLK            : std_logic := '0';
    
    --Response
    signal t_Q, t_Q_not     : std_logic;
    
    constant clk_period :   time    := 0.5 ns;
    
    begin
        
        CLK_process : process
            begin
                t_CLK <= not t_CLK;
                wait for clk_period/2;
        end process;
        
        t_process   : process
            begin
                t_T <= '1';
                wait for 0.33 ns;
                t_RST <= '1';       --remove from 
                wait for 1.25 ns;   
                t_T <= '0';
                wait for 0.5 ns;
                t_RST <= '0';       --go to reset
                
                wait for 0.01 ns;
                t_T <= '1';
                
                wait for 1 ns;
                t_RST <= '1';   -- remove from reset

        end process;
                
        DUT : T_ff
            port map(T => t_T, CLK => t_CLK, RST => t_RST,
            Q => t_Q, Q_not => t_Q_not);
end Behavioral;
