library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Procesador1 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           AluOut : out  STD_LOGIC_VECTOR (31 downto 0):= (others => '0'));
end Procesador1;
architecture Behavioral of Procesador1 is

	COMPONENT ALU
	PORT(
		Aluin1 : IN std_logic_vector(31 downto 0);
		Aluin2 : IN std_logic_vector(31 downto 0);
		Carry : IN std_logic;
		Aluop : IN std_logic_vector(5 downto 0);          
		Aluout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ControlUnit
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		cuout : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		address : IN std_logic_vector(31 downto 0);          
		imout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX1
	PORT(
		Muxin1 : IN std_logic_vector(31 downto 0);
		Muxin2 : IN std_logic_vector(31 downto 0);
		Selector : IN std_logic;          
		Muxout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ProgramCounter
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		Datain : IN std_logic_vector(31 downto 0);          
		Dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT RegisterFile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU1
	PORT(
		Imm : IN std_logic_vector(12 downto 0);          
		Seuout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Sumador
	PORT(
		Datain : IN std_logic_vector(31 downto 0);          
		Dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT nProgramCounter
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		Datain1 : IN std_logic_vector(31 downto 0);          
		Dataout1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
signal sumtonpc,npctopc,addres,regisim,seutomux,crtomux,crtoalu,outprin,muxtoalu : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal cotoalu : std_logic_vector(5 downto 0) := "000000";	
signal auxcarry : std_logic := '0';
	
begin


	Inst_ALU: ALU PORT MAP(
		Aluin1 => crtoalu,
		Aluin2 => muxtoalu,
		Carry => auxcarry,
		Aluop => cotoalu,
		Aluout => outprin
	);
	
	Inst_ControlUnit: ControlUnit PORT MAP(
		op => regisim(31 downto 30),
		op3 => regisim(24 downto 19),
		cuout => cotoalu
	);

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => rst,
		address => addres,
		imout => regisim
	);
	
	Inst_MUX1: MUX1 PORT MAP(
		Muxin1 => crtomux,
		Muxin2 => seutomux,
		Selector => regisim(13),
		Muxout => muxtoalu
	);

	Inst_ProgramCounter: ProgramCounter PORT MAP(
		rst => rst,
		clk => clk,
		Datain => npctopc,
		Dataout => addres
	);

	Inst_RegisterFile: RegisterFile PORT MAP(
		rs1 => regisim(18 downto 14),
		rs2 => regisim(4 downto 0),
		rd => regisim(29 downto 25),
		rst => rst,
		dwr => outprin,
		crs1 => crtoalu,
		crs2 => crtomux
	);
	
	Inst_SEU1: SEU1 PORT MAP(
		Imm => regisim(12 downto 0),
		Seuout => seutomux
	);
	
	Inst_Sumador: Sumador PORT MAP(
		Datain => addres,
		Dataout => sumtonpc
	);
	
	Inst_nProgramCounter: nProgramCounter PORT MAP(
		rst => rst,
		clk => clk,
		Datain1 => sumtonpc,
		Dataout1 => npctopc
	);
	AluOut<=outprin;
end Behavioral;