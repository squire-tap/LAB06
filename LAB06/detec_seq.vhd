library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity detec_seq is
    port (
        clk : in std_logic;
        reset : in std_logic;
        entrada : in std_logic;
        saida : out std_logic;
    );
end entity detec_seq;

architecture rtl of detec_seq is
    type STATE_TYPE is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal estado : STATE_TYPE;
begin
    process(clk,reset)
        begin
            if reset = '1' then
                estado <= s0;
            elsif (rising_edge(clk)) then
                case estado is
                    when s0 =>
                        if entrada = '0' then
                            estado <= s1;
                        else
                            estado <= s0;
                        end if;
                    when s1 =>
                        if entrada = '1' then
                            estado <= s2;
                        else 
                            estado <= s0;
                        end if;
                    when s2 =>
                        if entrada = '1' then
                            estado <= s3;
                        else
                            estado <= s0;
                        end if;
                    when s3 =>
                        if entrada = '0' then
                            estado <= s4;
                        else 
                            estado <= s0;
                        end if;
                    when s4 =>
                        if entrada = '0' then
                            estado <= s5;
                        else 
                            estado <= s2;
                        end if;
                    when s5 =>
                        if entrada = '1' then
                            estado <= s6;
                        else 
                            estado <= s0;
                        end if;
                    when s6 =>
                        if entrada = '1' then 
                            estado <= s7;
                        else 
                            estado <= s0;
                        end if;
                    when s7 => 
                        if entrada = '1' then 
                            estado <= s0;
                            saida  <= 1;
                        else 
                            estado <= s1;
                        end if;
                end case;
            end if;
    
    
end architecture rtl;