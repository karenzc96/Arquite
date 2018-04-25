library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity Sumador is
    Port ( Datain : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Dataout : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end Sumador;
architecture Behavioral of Sumador is
signal uno: STD_LOGIC_VECTOR(31 DOWNTO 0);
begin
	uno<="00000000000000000000000000000001";
	process(Datain)
	begin
		Dataout<=Datain+uno;
	end process;
end Behavioral;