library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3 is
    port(
        in1,in2, in3 :in std_logic;
        out1:out std_logic);
end and3;

architecture behaviour of and3 is
    begin
        out1 <= ((in1 and in2) and in3);
end behaviour;