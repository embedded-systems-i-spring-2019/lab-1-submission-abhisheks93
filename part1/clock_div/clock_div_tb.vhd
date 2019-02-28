----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 06:41:27 AM
-- Design Name: 
-- Module Name: clock_div_tb - Behavioral
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

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clock_div_tb is
end clock_div_tb;

architecture testbench of clock_div_tb is

    signal tb_clk : std_logic := '0';
    signal tb_div : std_logic := '0';
    component clock_div is
        port(
            clk  : in std_logic;        -- 125 Mhz clock     
            div : out std_logic   
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------
    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------
    dut : clock_div
    port map (
        clk  => tb_clk,
        div => tb_div    
    );
        
end testbench; 