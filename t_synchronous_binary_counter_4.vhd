
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_synchronous_binary_counter_4 is
end t_synchronous_binary_counter_4;

architecture Behavioral of t_synchronous_binary_counter_4 is
    component synchronous_binary_counter_4
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
                wait for 5 ns;
                t_RST <= '1';
        end process;
        
        DUT : synchronous_binary_counter_4
            port map(CLK => t_CLK, RST=> t_RST, Y=> t_Y);
end Behavioral;
