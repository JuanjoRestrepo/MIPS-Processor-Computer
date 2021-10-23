----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A MIPSregisters
-- Module Name: MIPSregisters - Behavioral
-- Project Name: Application of a MIPSregisters
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a MIPSregisters with basic I/O
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity MIPSregisters is
    Port ( address1 : in STD_LOGIC_VECTOR (4 downto 0);
           address2 : in STD_LOGIC_VECTOR (4 downto 0);
           address3 : in STD_LOGIC_VECTOR (4 downto 0);
           dataIn : in STD_LOGIC_VECTOR (31 downto 0);
           dataOut1 : out STD_LOGIC_VECTOR (31 downto 0);
           dataOut2 : out STD_LOGIC_VECTOR (31 downto 0);
           clock : in STD_LOGIC;
           write : in STD_LOGIC);
end MIPSregisters;

architecture Behavioral of MIPSregisters is
    type memType is array (0 to 31) of std_logic_vector (31 downto 0);
    signal memory: memType;
begin
    process(clock)
    begin
        if(clock'event and clock='1') then
            if(write = '1') then
                memory (conv_integer(address3)) <= dataIn;
            end if;
        end if;
    end process;
    dataOut1 <= memory (conv_integer(address1));
    dataOut2 <= memory (conv_integer(address2));
    
end Behavioral;
