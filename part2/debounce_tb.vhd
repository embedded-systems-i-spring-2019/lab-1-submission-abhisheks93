----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 10:53:31 AM
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture testbench of debounce_tb is

    signal tb_clk : std_logic := '0';
    signal tb_btn :std_logic:='0';
    signal tb_dbnc : std_logic;
    component debounce is
        port(
            clk     : IN  STD_LOGIC;
            btn : IN STD_LOGIC; 
            dbnc : OUT STD_LOGIC);
    end component;
begin
clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
    
    button_sim : process
    begin
        
        wait for 5 ms;
        tb_btn <= '0';
        wait for 1ms;
        tb_btn <= '1';
        wait for 2ms;                
        tb_btn <= '0';
        wait for 2ms;
        tb_btn <= '1';
        wait for 20ns;
        tb_btn <= '0';
        wait for 3ms;
        tb_btn <= '1';
        wait for 40ms;
        tb_btn <= '0';
        wait for 2ms;
        tb_btn <= '1';
        wait for 1ms;
        
        wait;
        end process;
        
    
    
     dut : debounce
       port map (
           clk  => tb_clk ,
           btn => tb_btn,
           dbnc => tb_dbnc   
       );
           
    

end testbench;
