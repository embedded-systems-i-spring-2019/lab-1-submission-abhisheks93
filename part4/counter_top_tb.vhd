----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 10:12:10 AM
-- Design Name: 
-- Module Name: counter_top_tb - Behavioral
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

entity counter_top_tb is
--  Port ( );
end counter_top_tb;


architecture Behavioral of counter_top_tb is
    component counter_top
    port(clk : in std_logic;    
        btn : in std_logic_vector(3 downto 0);
        --btn : in std_logic_vector(3 downto 0);
        sw : in std_logic_vector(3 downto 0);
        led : out std_logic_vector(3 downto 0));
    end component;
    
    signal tb_btn, tb_sw, tb_led : std_logic_vector(3 downto 0):=(others => '0');    
    signal tb_clk : std_logic := '0';
begin
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;

    counter : process
    begin
        wait for 100ns;
        tb_btn <= "0011"; -- reset
        wait for 500ms;
        tb_sw <= "1111"; -- load value
        wait for 500ms;
        tb_btn <= "1010"; -- enable ld to load value
        wait for 500ms;
        tb_sw <= "0000"; -- set dir for up counter 
        wait for 500ms;
        tb_btn <= "0110"; -- updn pin enbale to read switch to count up
        wait for 500ms;
        tb_btn <= "0010"; -- en enable pin to count
        wait;
    end process counter;
    
counter_top_tb : counter_top
port map(
    clk=> tb_clk,
    btn => tb_btn,
    sw => tb_sw,
    led => tb_led);

end Behavioral;
