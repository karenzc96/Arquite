library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity MUX1 is
    Port ( Muxin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Muxin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC;
           Muxout : out  STD_LOGIC_VECTOR (31 downto 0):=(others=>'0'));
end MUX1;
architecture Behavioral of MUX1 is
begin
	Muxout <= Muxin1 when Selector ='0' else Muxin2;
end Behavioral;