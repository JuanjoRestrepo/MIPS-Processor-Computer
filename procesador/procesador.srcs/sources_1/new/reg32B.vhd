----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A reg32B
-- Module Name: reg32B - Behavioral
-- Project Name: Application of a reg32B
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a reg32B with basic I/O
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

entity reg32B is
    Port ( clear : in STD_LOGIC;
           clock : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (31 downto 0);
           q : out STD_LOGIC_VECTOR (31 downto 0);
           enable : in STD_LOGIC);
end reg32B;

architecture Behavioral of reg32B is

begin

process(clock)
begin
    if(clock'event and clock = '1' )then
        if(clear = '1')then
            q <= (others => '0');
        elsif (enable = '1') then
            q <= data;
        end if;
    end if;
end process;

end Behavioral;
