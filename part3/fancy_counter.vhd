----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:36:15 AM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
--  Port ( );
    port(clk : in std_logic;
        clk_en : in std_logic;
        dir : in std_logic;
        en : in std_logic;
        ld : in std_logic;
        rst : in std_logic;
        updn : in std_logic;
        val : in std_logic_vector(3 downto 0);
        cnt : inout std_logic_vector(3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal countdir : std_logic :='0';
    signal value : std_logic_vector(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (en = '1') then
                if (rst = '1') then
                    cnt <= "0000";
                end if;
                if (clk_en = '1') then
                    if (updn = '1') then
                        countdir <= dir;
                    end if;
                    if (ld ='1') then
                        value <= val;
                    end if;
                    
                    if (countdir = '1') then
                        if (cnt = value) then
                            cnt <= "0000";
                        else
                            cnt <= std_logic_vector(unsigned(cnt)+ 1);
                        end if;
                    elsif (countdir = '0') then
                        if (cnt = "0000") then
                            cnt <= val;
                        else 
                            cnt <= std_logic_vector(unsigned(cnt) - 1);
                        end if;
                    end if;
                     
                end if;
             
           end if;   
    
      end if;  
   
 end process;         
                                 
                                           
end Behavioral;
