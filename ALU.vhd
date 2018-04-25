library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
    Port ( Aluin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Carry : in  STD_LOGIC;
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           Aluout : out  STD_LOGIC_VECTOR (31 downto 0):= (others => '0'));
end ALU;
architecture Behavioral of ALU is
begin	
	process(Aluin1,Aluin2,Aluop)
		begin
			case Aluop is
				when "000000" => Aluout <= Aluin1 + Aluin2; --Add
				when "010000" => Aluout <= Aluin1 + Aluin2; --Addcc
				when "001000" => Aluout <= Aluin1 + Aluin2 + Carry; --Addx
				when "011000" => Aluout <= Aluin1 + Aluin2 + Carry; --Addxcc
				
				when "000100" => Aluout <= Aluin1 - Aluin2; --Sub
				when "010100" => Aluout <= Aluin1 - Aluin2; --Subcc
				when "001100" => Aluout <= Aluin1 - Aluin2 - Carry; --Subx
				when "011100" => Aluout <= Aluin1 - Aluin2 - Carry; --Subxcc
				
				when "100101" => Aluout <= to_stdlogicvector(to_bitvector(Aluin1) sll conv_integer(Aluin2)); --SLL mult
				when "100110" => Aluout <= to_stdlogicvector(to_bitvector(Aluin1) srl conv_integer(Aluin2)); --SRL div
				
				when "000001" => Aluout <= Aluin1 and Aluin2; --And
				when "010001" => Aluout <= Aluin1 and Aluin2; --Andcc
				when "000010" => Aluout <= Aluin1 or Aluin2; --Or
				when "010010" => Aluout <= Aluin1 or Aluin2; --Orcc
				when "000011" => Aluout <= Aluin1 xor Aluin2; --Xor
				when "010011" => Aluout <= Aluin1 xor Aluin2; --Xorcc
				when "000111" => Aluout <= Aluin1 xnor Aluin2; --Xnor
				when "010111" => Aluout <= Aluin1 xnor Aluin2; -- Xnorcc
				when "000101" => Aluout <= Aluin1 and (not Aluin2); --andN
				when "010101" => Aluout <= Aluin1 and (not Aluin2); --andNcc
				when "010110" => Aluout <= Aluin1 nor Aluin2; --Norcc
				when "000110" => Aluout <= Aluin1 nor Aluin2; --Nor
			
				when others => Aluout <= "00000000000000000000000000000000";
			end case;
	end process;
end Behavioral;
