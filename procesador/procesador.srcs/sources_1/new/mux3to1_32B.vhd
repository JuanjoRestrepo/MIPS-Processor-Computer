----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 09:55:21 PM
-- Design Name: 
-- Module Name: mux3to1_32B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity mux3to1_32B is
Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
       B : in STD_LOGIC_VECTOR (31 downto 0);
       C : in STD_LOGIC_VECTOR (31 downto 0);
       Sel : in STD_LOGIC_VECTOR (1 downto 0);
       X : out STD_LOGIC_VECTOR (31 downto 0));
end mux3to1_32B;

architecture Behavioral of mux3to1_32B is

begin

    X <= A when Sel = "00" else
         B when Sel = "01" else
         C when Sel = "10";
        
end Behavioral;
