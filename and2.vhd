library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
    port(
        in1,in2:in std_logic;
        out1:out std_logic);
end and2;

architecture behaviour of and2 is
    begin
        out1 <= (in1 and in2);
end behaviour;