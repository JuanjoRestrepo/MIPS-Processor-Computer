----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/16/2021 09:39:21 AM
-- Design Name: A SIGN EXTEND
-- Module Name: SIGN EXTEND- Behavioral
-- Project Name: Application of a SIGN EXTEND
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a SIGN EXTEND
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------- 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity signExtend is
    Port ( in16B : in STD_LOGIC_VECTOR (15 downto 0);
           Out32B : out STD_LOGIC_VECTOR (31 downto 0));
end signExtend;

architecture Behavioral of signExtend is

begin

    Out32B <= (X"0000") & in16B when in16B(15) = '0' else
              (X"1111" & in16B);

end Behavioral;
