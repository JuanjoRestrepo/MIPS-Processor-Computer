----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A mux2to1_5B
-- Module Name: mux2to1_5B - Behavioral
-- Project Name: Application of a mux2to1_5B
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a mux2to1_5B with basic I/O
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

entity mux2to1_5B is
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (4 downto 0);
           Sel : in STD_LOGIC;
           X : out STD_LOGIC_VECTOR (4 downto 0));
end mux2to1_5B;

architecture Behavioral of mux2to1_5B is

begin

    X <= A when Sel = '0' else
         B;
        
end Behavioral;