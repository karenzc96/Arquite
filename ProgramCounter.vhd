library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ProgramCounter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Datain : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Dataout : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end ProgramCounter;
architecture Behavioral of ProgramCounter is
begin
	process(clk)
	begin
		if (rst = '1') then
			Dataout <= "00000000000000000000000000000000";
		elsif rising_edge(clk) then
			Dataout<=Datain;
		end if;
	end process;
end Behavioral;