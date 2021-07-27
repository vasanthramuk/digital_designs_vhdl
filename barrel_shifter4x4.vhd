
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--rotates right--
entity barrel_shifter4x4 is
    port(
    barrel_in       : in std_logic_vector(3 downto 0);
    barrel_select   : in std_logic_vector(1 downto 0);
    barrel_out: out std_logic_vector(3 downto 0));
end barrel_shifter4x4;

architecture Behavioral of barrel_shifter4x4 is
    component mux4_to_1
        port(
        mux_in  : in std_logic_vector(3 downto 0);
        mux_sel : in std_logic_vector(1 downto 0);
        mux_out : out std_logic);
    end component;
    
    begin
        mux0: mux4_to_1
            port map( mux_in(0)=> barrel_in(0),mux_in(1)=> barrel_in(1), mux_in(2)=> barrel_in(2),mux_in(3)=> barrel_in(3),
            mux_sel=> barrel_select,
            mux_out=> barrel_out(0));
                    
        mux1: mux4_to_1
            port map( mux_in(0)=> barrel_in(1),mux_in(1)=> barrel_in(2), mux_in(2)=> barrel_in(3),mux_in(3)=> barrel_in(0),
            mux_sel=> barrel_select,
            mux_out=> barrel_out(1));
                    
        mux2: mux4_to_1
            port map( mux_in(0)=> barrel_in(2),mux_in(1)=> barrel_in(3), mux_in(2)=> barrel_in(0),mux_in(3)=> barrel_in(1),
            mux_sel=> barrel_select,
            mux_out=> barrel_out(2));  
            
        mux3: mux4_to_1
            port map( mux_in(0)=> barrel_in(3),mux_in(1)=> barrel_in(0), mux_in(2)=> barrel_in(1),mux_in(3)=> barrel_in(2),
            mux_sel=> barrel_select,
            mux_out=> barrel_out(3));
            
end Behavioral;
