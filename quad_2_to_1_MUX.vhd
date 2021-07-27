
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity quad_2_to_1_MUX is
    Port ( I1,I0 : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end quad_2_to_1_MUX;

architecture Behavioral of quad_2_to_1_MUX is
    
    begin
        process (SEL, I0, I1)
            begin
                if SEL = '0' then
                    Y <= I0;
                else
                    Y <= I1;
                end if;
        end process;
        
end Behavioral;
