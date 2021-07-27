
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_bcd_binary_counter is
end t_bcd_binary_counter;

architecture Behavioral of t_bcd_binary_counter is
    component bcd_binary_counter
        Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SEL : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal t_CLK: std_logic := '0';
    signal t_RST: std_logic := '0';   
    signal t_SEL : std_logic;
    signal t_Y                 : std_logic_vector(3 downto 0);
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
                t_RST <= '1';
                wait for 100 ns;
                t_RST <= '0';
                wait for 5 ns;
                t_RST <= '1';
                t_RST <= '1';
                wait for 100 ns;
                t_RST <= '0';
        end process;
        
        select_process  : process
            begin
                t_SEL <= '0';
                wait for 105 ns;
                
                t_SEL <= '1';
                wait for 105 ns;
        end process;
        
        DUT : bcd_binary_counter
            port map(CLK=> t_CLK, RST=>t_RST, 
                SEL=> t_SEL, Y=> t_Y);
end Behavioral;
