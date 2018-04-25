library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           rs2 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           rd : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           rst : in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           crs1 : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
           crs2 : out  STD_LOGIC_VECTOR(31 DOWNTO 0):=(others=>'0'));
end RegisterFile;
architecture Behavioral of RegisterFile is
type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal registros : ram_type := (others => "00000000000000000000000000000000");
begin
	process(rst,rs1,rs2,rd,dwr)
		begin
			if rst= '1' then
				crs1<= "00000000000000000000000000000000";
				crs2<= "00000000000000000000000000000000";
				registros <= (others => "00000000000000000000000000000000");
			else
				crs1<= registros(conv_integer(rs1));
				crs2<= registros(conv_integer(rs2));
				if rd = "00000" then
					registros(conv_integer(rd)) <= "00000000000000000000000000000000";
				else	
					registros(conv_integer(rd)) <= dwr;
				end if;
			end if;
	end process;
end Behavioral;