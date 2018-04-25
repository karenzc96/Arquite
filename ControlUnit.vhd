library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cuout : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;
architecture Behavioral of ControlUnit is
begin
	process(op,op3)
		begin 
			case op is
				when "10" => 
					cuout<=op3;
				when others => cuout <= "111111";
			end case;
	end process;
end Behavioral;