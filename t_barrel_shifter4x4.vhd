
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity t_barrel_shifter4x4 is
end t_barrel_shifter4x4;

architecture Behavioral of t_barrel_shifter4x4 is
    component barrel_shifter4x4
        port(
            barrel_in       : in std_logic_vector(3 downto 0);
            barrel_select   : in std_logic_vector(1 downto 0);
            barrel_out      : out std_logic_vector(3 downto 0));    
    end component;
    
    signal t_barrel_in      : std_logic_vector(3 downto 0);
    signal t_barrel_select  : std_logic_vector(1 downto 0);
    signal t_barrel_out     : std_logic_vector(3 downto 0);
    
    begin
        process
            begin
                for input_data in 0 to 15 loop
                    t_barrel_in <= std_logic_vector(to_unsigned(input_data,t_barrel_in'length));
                    
                    for sel in 0 to 3 loop
                        t_barrel_select <= std_logic_vector(to_unsigned(sel,t_barrel_select'length));
                        wait for 10 ns;
                    end loop;
                end loop;
        end process;
    
    EUT : barrel_shifter4x4
        port map(barrel_in=> t_barrel_in ,barrel_select=> t_barrel_select, barrel_out=> t_barrel_out);
end Behavioral;
