
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_to_1 is
    port(
        mux_in  : in std_logic_vector(3 downto 0);
        mux_sel : in std_logic_vector(1 downto 0);
        mux_out : out std_logic);
end mux4_to_1;

architecture Behavioral of mux4_to_1 is
    component and3
        port(
            in1,in2, in3 :in std_logic;
            out1         :out std_logic);       
    end component;
    
    component or4
        port(
        in1, in2, in3, in4 : in std_logic;
        out1               : out std_logic);
    end component;
    
    component inverter
        port(
            in1 : in std_logic;
            out1 : out std_logic);
    end component;
        
    signal mux_sel_not: std_logic_vector(1 downto 0);
    signal minterm: std_logic_vector(3 downto 0);
    
    begin
        mux_inverter0   : inverter
            port map(in1=>mux_sel(0), out1=> mux_sel_not(0));
        mux_inverter1   : inverter
            port map(in1=>mux_sel(1), out1=> mux_sel_not(1));

        mux_and0    : and3
            port map(in1=>mux_in(0) , in2=>mux_sel_not(1) ,
            in3=> mux_sel_not(0) ,out1=> minterm(0));
        mux_and1    : and3
            port map(in1=>mux_in(1) , in2=>mux_sel_not(1) ,
            in3=> mux_sel(0) ,out1=> minterm(1));
        mux_and2    : and3
            port map(in1=>mux_in(2) , in2=>mux_sel(1) ,
            in3=> mux_sel_not(0) ,out1=> minterm(2));
        mux_and3    : and3
            port map(in1=>mux_in(3) , in2=>mux_sel(1) ,
            in3=> mux_sel(0) ,out1=> minterm(3));
        
        mux_or0     : or4
            port map(in1=>minterm(3), in2=>minterm(2),
            in3=>minterm(1), in4=>minterm(0), out1=>mux_out);
end Behavioral;