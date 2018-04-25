library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SEU1 is
    Port ( Imm : in  STD_LOGIC_VECTOR (12 downto 0);
           Seuout : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU1;
architecture Behavioral of SEU1 is
begin
	process(Imm)
	begin
		if Imm(12) = '0' then 
			Seuout <= "0000000000000000000" & imm;
		else
			Seuout <= "1111111111111111111" & imm;
		end if;
	end process;

end Behavioral;