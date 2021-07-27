library ieee;
use ieee.std_logic_1164.all;

entity t_decoder2_to_4 is
end t_decoder2_to_4;

architecture t_behaviour of t_decoder2_to_4 is
    component decoder2_to_4
        port(
        decoder_in0,decoder_in1                               :   in      std_logic;
        decoder_out0,decoder_out1,decoder_out2,decoder_out3   :   out     std_logic);
    end component;
    
    --stimulus
    signal t_in0,t_in1                  :   std_logic;
    --response
    signal t_out0,t_out1,t_out2,t_out3  :   std_logic;
    begin

        process
        begin
            t_in1 <= '0'; t_in0 <= '0'; wait for 10 ns;
            t_in1 <= '0'; t_in0 <= '1'; wait for 10 ns;
            t_in1 <= '1'; t_in0 <= '0'; wait for 10 ns;
            t_in1 <= '1'; t_in0 <= '1'; wait for 10 ns;
        end process;
        decoder : decoder2_to_4 port map (
                                         decoder_in0 =>  t_in0,
                                         decoder_in1 =>  t_in1,
                                         
                                         decoder_out0 => t_out0,
                                         decoder_out1 => t_out1,
                                         decoder_out2 => t_out2,
                                         decoder_out3 => t_out3);
    
end t_behaviour;    