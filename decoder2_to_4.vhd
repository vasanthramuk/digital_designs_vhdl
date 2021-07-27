
library ieee;
use ieee.std_logic_1164.all;

entity decoder2_to_4 is
    port(
        decoder_in0,decoder_in1                             :   in std_logic;
        decoder_out0,decoder_out1,decoder_out2,decoder_out3 :   out std_logic);
end decoder2_to_4;

architecture Behavioural of decoder2_to_4 is
    component inverter
       port(
        in1     : in std_logic;
        out1    : out std_logic); 
    end component;
    
    component and2
        port(
            in1,in2 :in std_logic;
            out1    :out std_logic);
    end component;
    
    signal decoder_in0_not, decoder_in1_not:std_logic;
    
    begin
    inverter0: inverter 
        port map(in1=>decoder_in0,out1=>decoder_in0_not);
    inverter1: inverter 
        port map(in1=>decoder_in1,out1=>decoder_in1_not);
    
    and2_0: and2 
        port map(in1=> decoder_in1_not,in2=> decoder_in0_not ,out1=> decoder_out0);
    and2_1: and2 
        port map(in1=> decoder_in1_not, in2=> decoder_in0, out1=> decoder_out1);
    and2_2: and2 
        port map(in1=> decoder_in1, in2=> decoder_in0_not, out1=> decoder_out2);
    and2_3: and2 
        port map(in1=> decoder_in1, in2=> decoder_in0, out1=> decoder_out3);
    
end Behavioural;
