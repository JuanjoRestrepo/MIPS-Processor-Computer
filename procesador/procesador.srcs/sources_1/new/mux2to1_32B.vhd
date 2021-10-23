----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A mux2to1_32B
-- Module Name: mux2to1_32B - Behavioral
-- Project Name: Application of a mux2to1_32B
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a mux2to1_32B with basic I/O
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

entity mux2to1_32B is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC;
           X : out STD_LOGIC_VECTOR (31 downto 0));
end mux2to1_32B;

architecture Behavioral of mux2to1_32B is

begin

    X <= A when Sel = '0' else
         B;
        
end Behavioral;