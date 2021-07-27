
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity t_electronic_combination_lock is
end t_electronic_combination_lock;

architecture Behavioral of t_electronic_combination_lock is
    component electronic_combination_lock
        Port (reset  : in STD_LOGIC;
           key       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           unlock    : out STD_LOGIC);   
    end component;
    
    signal t_reset  : std_logic := '0';      --Start with RST condition
    signal t_key    : std_logic := '0';
    signal t_CLK    : std_logic := '1';
    signal t_unlock : std_logic;
    
    constant clk_period :   time    := 5 ns;
    
    begin
        CLK_process : process
            begin
                t_CLK <= not t_CLK;
                wait for clk_period/2;
        end process;
        
        reset_process : process
            begin
                wait for 5 ns;
                t_reset <= '1';
            end process;
        
        
        t_process: process
            begin
                
                --t_reset <= '0';
                --wait for 5 ns;
                
                --t_reset <= '1';
                --wait for 5 ns;
                
                --t_key <= '0'; 
                --wait for 5 ns;
                
                t_key <= '0';
                wait for 8 ns;
                 
                t_key <= '1';
                wait for 5 ns;
                
                t_key <= '0'; 
                wait for 5 ns;
                
                t_key <= '1';
                wait for 5 ns; 
                
                t_key <= '1';
                wait for 5 ns; 
                
                t_key <= '0';
                wait for 5 ns;
        end process;
            
        DUT     :   electronic_combination_lock
            port map(reset => t_reset, key => t_key, CLK => t_CLK, unlock => t_unlock);
end Behavioral;
