----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2021 17:24:30
-- Design Name: 
-- Module Name: t_mux4_to_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity t_mux4_to_1 is
end t_mux4_to_1;

architecture Behavioral of t_mux4_to_1 is
    component mux4_to_1
        port(
            mux_in  : in std_logic_vector(3 downto 0);
            mux_sel : in std_logic_vector(1 downto 0);
            mux_out : out std_logic);
    end component;
    
    --stimulus
    signal t_mux_in     : std_logic_vector(3 downto 0);
    signal t_mux_sel    : std_logic_vector(1 downto 0);
    
    --response
    signal t_mux_out    : std_logic;
    
    begin    
        process
            begin
                for num_in in 0 to 15 loop
                    t_mux_in <= std_logic_vector(to_unsigned(num_in,t_mux_in'length));
                    for num_sel in 0 to 3 loop
                        t_mux_sel <= std_logic_vector(to_unsigned(num_sel,t_mux_sel'length));
                        wait for 10 ns;
                    end loop;
                end loop;
        end process;

    EUT : mux4_to_1
        port map(mux_in=> t_mux_in, mux_sel=> t_mux_sel, mux_out=> t_mux_out);
        
end Behavioral;
