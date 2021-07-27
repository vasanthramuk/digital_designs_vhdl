library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity inverter is
    port(
        in1 : in std_logic;
        out1 : out std_logic);
end inverter;
    
architecture behaviour of inverter is
    begin
        out1 <= (not in1);
end behaviour;