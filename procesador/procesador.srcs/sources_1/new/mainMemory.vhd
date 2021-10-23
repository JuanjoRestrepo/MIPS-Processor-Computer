----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A Main Memory
-- Module Name: Main Memory - Behavioral
-- Project Name: Application of a Main Memory
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a Main Memory with basic I/O
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
use IEEE.std_logic_unsigned.ALL;

entity mainMemory is
    Port ( clock : in STD_LOGIC;
           read : in STD_LOGIC;
           write : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR (31 downto 0);
           dataIn : in STD_LOGIC_VECTOR (31 downto 0);
           address : in STD_LOGIC_VECTOR (9 downto 0));
end mainMemory;

architecture Behavioral of mainMemory is
    type memType is array (0 to 1023) of std_logic_vector (31 downto 0);
    signal memory: memType;
begin
    process(clock)
    begin
        if(clock'event and clock='1') then
            if(write = '1') then
                memory (conv_integer(address)) <= dataIn;
            end if;
        end if;
    end process;
    dataOut <= memory (conv_integer(address));
    
end Behavioral;
