----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A MIPS Processor
-- Module Name: MIPSprocessor - Behavioral
-- Project Name: Application of a MIPS Processor
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a MIPS-like Processor with basic I/O
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MIPSprocessor is
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           memAdd : out STD_LOGIC_VECTOR (31 downto 0);
           dataIn : in STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out STD_LOGIC_VECTOR (31 downto 0);
           memWrite : out STD_LOGIC;
           memRead : in STD_LOGIC);
end MIPSprocessor;

architecture Structural of MIPSprocessor is
    component reg32B
        Port ( clear : in STD_LOGIC;
               clock : in STD_LOGIC;
               data : in STD_LOGIC_VECTOR (31 downto 0);
               q : out STD_LOGIC_VECTOR (31 downto 0);
               enable : in STD_LOGIC);
    end component;
    
    component mux2to1_5B
        Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
               B : in STD_LOGIC_VECTOR (4 downto 0);
               Sel : in STD_LOGIC;
               X : out STD_LOGIC_VECTOR (4 downto 0));        
    end component;
    
    component mux2to1_32B
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               Sel : in STD_LOGIC;
               X : out STD_LOGIC_VECTOR (31 downto 0));        
    end component;
    
    component mux4to1_32B
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               C : in STD_LOGIC_VECTOR (31 downto 0);
               D : in STD_LOGIC_VECTOR (31 downto 0);
               Sel : in STD_LOGIC_VECTOR (1 downto 0);
               X : out STD_LOGIC_VECTOR (31 downto 0));        
    end component;
    
    component MIPSregisters
        Port ( address1 : in STD_LOGIC_VECTOR (4 downto 0);
               address2 : in STD_LOGIC_VECTOR (4 downto 0);
               address3 : in STD_LOGIC_VECTOR (4 downto 0);
               dataIn : in STD_LOGIC_VECTOR (31 downto 0);
               dataOut1 : out STD_LOGIC_VECTOR (31 downto 0);
               dataOut2 : out STD_LOGIC_VECTOR (31 downto 0);
               clock : in STD_LOGIC;
               write : in STD_LOGIC);
    end component;
    
    component signExtend
        Port ( in16B : in STD_LOGIC_VECTOR (15 downto 0);
               Out32B : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component mipsALU
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           operation : in STD_LOGIC_VECTOR (1 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC);
    end component;
    
    component mux3to1_32B
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               C : in STD_LOGIC_VECTOR (31 downto 0);
               Sel : in STD_LOGIC_VECTOR (1 downto 0);
               X : out STD_LOGIC_VECTOR (31 downto 0));        
    end component;
    
signal controlSignalsTemp, irOut, mdrOut, aluOutRegOut, mux02Out : std_logic_vector (31 downto 0);
signal  data1Out, data2Out, regAOut, regBOut, signExtOut : std_logic_vector (31 downto 0);
signal pcOut, mux03Out, mux04Out: std_logic_vector (31 downto 0);
signal mux01Out: std_logic_vector (4 downto 0);
signal ALUcontrolOut: std_logic_vector (1 downto 0);
signal salidaALU: std_logic_vector (31 downto 0);
signal zeroALU: std_logic;
signal regALUOut: std_logic_vector (31 downto 0);
signal salida_extendida, mux05Out: std_logic_vector (31 downto 0);

begin

irReg: reg32B --instanciamos el registro
port map (
    clear => '0',
    clock => clock,
    data => dataIn,
    q => irOut,
    enable => controlSignalsTemp(0)
);

mdReg: reg32B
port map (
    clear => '0',
    clock => clock,
    data => dataIn,
    q => mdrOut,
    enable => '1'
);    

mux01: mux2to1_5B
port map (
    A => irOut(20 downto 16),
    B => irOut(15 downto 11),
    Sel => controlSignalsTemp(1),
    X => mux01Out
);  

mux02: mux2to1_32B
port map (
    A => aluOutRegOut,
    B => mdrOut,
    Sel => controlSignalsTemp(2),
    X => mux02Out
);      

regFile: MIPSregisters
port map (
   address1 => irOut(25 downto 21),
   address2 => irOut(20 downto 16),
   address3 => mux01Out,--Escritura
   dataIn => mux02Out,
   dataOut1 => data1Out,
   dataOut2 => data2Out,
   clock => clock,
   write => controlSignalsTemp(3)
); 

regA: reg32B
port map(
    clear => '0',
    clock => clock,
    data => data1Out,
    q => regAOut,
    enable => '1'
);

regB: reg32B
port map(
    clear => '0',
    clock => clock,
    data => data2Out,
    q => regBOut,
    enable => '1'
);

signExt: signExtend
port map(
    in16B => irOut(15 downto 0),
    out32B => signExtOut 
);

mux03: mux2to1_32B
port map (
    A => pcOut,
    B => regAOut,
    Sel => controlSignalsTemp(4),
    X => mux03Out
);   

mux04: mux4to1_32B
port map (
    A => regBOut,
    B => X"00000001",
    C => signExtOut,
    D => signExtOut,
    Sel => controlSignalsTemp(6 downto 5),
    X => mux04Out
);     

ALU: mipsALU
port map (
    A => mux03Out,
    B => mux04Out,
    operation => ALUcontrolOut,    
    result => salidaALU,
    zero => zeroALU
); 

regALU: reg32B
port map (
    clear => '0',
    clock => clock,
    data => salidaALU,
    q => regALUOut,
    enable => controlSignalsTemp(7)
);  

mux05: mux3to1_32B
port map (
    A => salidaALU,
    B => regALUOut,
    C => salida_extendida,
    Sel => controlSignalsTemp(9 downto 8),
    X => mux05Out
);    

end Structural;
