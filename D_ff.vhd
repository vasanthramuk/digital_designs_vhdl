
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_ff is
    Port ( D, CLK, RST : in STD_LOGIC;
           Q, Q_not: buffer STD_LOGIC);
end D_ff;

architecture Behavioral of D_ff is

    begin
        Q_not <= not Q;
        
        d_ff: process(CLK, RST)   
            begin   
                if(RST = '0') then 
                    Q <= '0';                            --Active low reset
                elsif(CLK'event and CLK = '1') then 
                    Q <= D;                             --Rising edge triggered
                end if;
        end process;    

end Behavioral;
