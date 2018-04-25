library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nProgramCounter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Datain1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Dataout1 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end nProgramCounter;
architecture Behavioral of nProgramCounter is
begin
	process(clk)
	begin
		if (rst = '1') then
			Dataout1 <= "00000000000000000000000000000000";
		elsif rising_edge(clk) then
			Dataout1<=Datain1;
		end if;
	end process;
end Behavioral;