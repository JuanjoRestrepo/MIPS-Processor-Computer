----------------------------------------------------------------------------------
-- Company: Pontificia Universidad Javeriana Cali
-- Engineer: Juan Jose Restrepo Rosero
-- 
-- Create Date: 10/09/2021 08:33:21 AM
-- Design Name: A mipsALU
-- Module Name: mipsALU - Behavioral
-- Project Name: Application of a mipsALU
-- Target Devices: Artix-7
-- Tool Versions: 
-- Description: Elaboration of a mipsALU with basic I/O
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
use IEEE.std_logic_signed.ALL;


entity mipsALU is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           operation : in STD_LOGIC_VECTOR (1 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC);
end mipsALU;

architecture Behavioral of mipsALU is
    signal result_temp: std_logic_vector(31 downto 0);
begin

    process(A,B,operation)
    begin
        case (operation) is
          when "00" => 
             result_temp <= A and B;
          when "01" => 
             result_temp <= A or B;
          when "10" => 
             result_temp <= A + B;
          when others => 
             result_temp <= A - B;     
             --Asignar la operacion al zero              
       end case;
       if(result_temp = x"00000000") then
            zero <= '1';
       else
            zero <= '0';
       end if;
    end process;
result <= result_temp;
end Behavioral;
