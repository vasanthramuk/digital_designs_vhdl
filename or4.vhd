library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity or4 is
    port(
        in1, in2, in3, in4 : in std_logic;
        out1               : out std_logic);
end or4;

architecture behaviour of or4 is
    begin
        out1 <= (((in1 or in2) or in3) or in4);
end behaviour;