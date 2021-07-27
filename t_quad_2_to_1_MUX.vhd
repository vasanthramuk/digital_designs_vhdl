
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity t_quad_2_to_1_MUX is
end t_quad_2_to_1_MUX;

architecture Behavioral of t_quad_2_to_1_MUX is
    component quad_2_to_1_MUX
        Port ( I1,I0 : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal t_I1,t_I0    : std_logic_vector (3 downto 0);
    signal t_SEL        : std_logic;
    signal t_Y          : std_logic_vector(3 downto 0);
    
    begin
        process
            begin
                for i in 0 to 15 loop
                    t_I1 <= std_logic_vector(to_signed(i, t_I1'length));
                    for j in 0 to 15 loop
                        t_I0 <= std_logic_vector(to_signed(j, t_I0'length));
                            t_SEL <= '0';   wait for 5 ns;
                            t_SEL <= '1';   wait for 5 ns;
                    end loop;
                end loop;
        end process;
    
        DUT: quad_2_to_1_MUX
            port map(I1=> t_I1, I0=> t_I0, SEL=> t_SEL, Y=> t_Y);     

end Behavioral;
