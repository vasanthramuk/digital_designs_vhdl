
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_binary_counter is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SEL : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end bcd_binary_counter;

architecture Behavioral of bcd_binary_counter is
    component synchronous_bcd_decade_counter
        Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component synchronous_binary_counter_4
        Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component quad_2_to_1_MUX
        Port ( I1,I0 : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal binary_counter_out, bcd_counter_out  : std_logic_vector(3 downto 0);
    signal mux_in_0, mux_in_1                   : std_logic_vector(3 downto 0);
    
    
    begin
        
        mux_in_0 <= binary_counter_out;
        mux_in_1 <= bcd_counter_out;
        
        BCD_Counter     : synchronous_bcd_decade_counter
            port map(CLK=> CLK ,RST=> RST , Y=> bcd_counter_out);
        
        Binary_Counter  : synchronous_binary_counter_4
            port map(CLK=> CLK ,RST=> RST , Y=> binary_counter_out );
            
        MUX             : quad_2_to_1_MUX
            port map(I1=> mux_in_1, I0=> mux_in_0, SEL=>SEL ,Y=>Y );

end Behavioral;
