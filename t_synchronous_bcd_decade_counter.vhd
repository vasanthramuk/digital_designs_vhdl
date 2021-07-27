
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_synchronous_bcd_decade_counter is
end t_synchronous_bcd_decade_counter;

architecture Behavioral of t_synchronous_bcd_decade_counter is
    component synchronous_bcd_decade_counter
        Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal t_CLK: std_logic := '0';
    signal t_RST: std_logic := '0';
    signal t_Y  : std_logic_vector(3 downto 0);
    constant clk_period :   time    := 5 ns;
    
    begin
        CLK_process : process
            begin
                t_CLK <= not t_CLK;
                wait for clk_period/2;
        end process;
        
        reset_process : process
            begin
                wait for 3 ns;
                t_RST <= '1';       --Removing from RST
                wait for 20 ns;
                t_RST <= '0';       --applying RST
                wait for 20 ns;
                t_RST <= '1';       --Removing from RST
                
        end process;
        
        DUT : synchronous_bcd_decade_counter
            port map(CLK => t_CLK, RST=> t_RST, Y=> t_Y);
end Behavioral;
