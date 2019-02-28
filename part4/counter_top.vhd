----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 05:33:49 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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



entity counter_top is
--  Port ( );
    port(clk : in std_logic;
        
        
        

        
        
        btn : in std_logic_vector(3 downto 0);
        --btn : in std_logic_vector(3 downto 0);
        sw : in std_logic_vector(3 downto 0);
        led : out std_logic_vector(3 downto 0));
        
end counter_top;

architecture Behavioral of counter_top is
    signal countdir : std_logic :='0';
    signal rst : std_logic;
    signal en : std_logic;
    signal updn : std_logic;
    signal ld :  std_logic;
    signal clk_en : std_logic;
    signal val :  std_logic_vector(3 downto 0);
    signal cnt :  std_logic_vector(3 downto 0);
    signal dir : std_logic;
    
    
    
    component debounce is
        PORT(
        clk  : IN  STD_LOGIC;  
        btn  : IN  STD_LOGIC;  
        dbnc : OUT STD_LOGIC); 
    end component;
    
    
    
    component clock_div is
        port(
            clk  : in std_logic;       -- 125 Mhz clock
            div : out std_logic );
        end component;
    
    
    component fancy_counter is
        port(
            clk : in std_logic;
                clk_en : in std_logic;
                dir : in std_logic;
                en : in std_logic;
                ld : in std_logic;
                rst : in std_logic;
                updn : in std_logic;
                val : in std_logic_vector(3 downto 0);
                cnt : inout std_logic_vector(3 downto 0));
        end component;
    
begin
    
           
       dir <= sw(0);
       val <= sw;
       led <= cnt;
       
       u1 : debounce
           port map(
               clk => clk,
               btn => btn(0),
               dbnc=> rst); 
               
                                
       u2 : debounce
                   port map(
                       clk => clk,
                       btn => btn(1),
                       dbnc=> en);                                           



       u3 : debounce
           port map(
               clk => clk,
               btn => btn(2),
               dbnc=> updn);

       u4 : debounce
           port map(
               clk => clk,
               btn => btn(3),
               dbnc=> ld);

        u5 : clock_div
           port map(
                clk => clk,
                div => clk_en);
        
        u6 : fancy_counter
            port map(
                clk => clk,
                clk_en => clk_en,
                dir => dir,
                en => en,
                ld => ld,
                rst => rst,
                updn => updn,
                cnt => cnt,
                val => val);
                

end Behavioral;