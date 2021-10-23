----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A mux4to1_32B
-- Module Name: mux4to1_32B - Behavioral
-- Project Name: Application of a mux4to1_32B
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a mux4to1_32B with basic I/O
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

entity mux4to1_32b is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC_VECTOR (31 downto 0);
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           X : out STD_LOGIC_VECTOR (31 downto 0));
end mux4to1_32b;

architecture Behavioral of mux4to1_32b is

begin

    X <= A when Sel = "00" else
         B when Sel = "01" else
         C when Sel = "10" else
         D;
        
end Behavioral;
