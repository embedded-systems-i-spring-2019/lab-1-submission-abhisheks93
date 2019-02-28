
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_top is
port(
    clk : in std_logic;
    led0 : out std_logic);

end divider_top;

architecture Behavioral of divider_top is
     signal CE : std_logic;
     --signal D :  std_logic;
     signal Q :  std_logic;    
     --signal clock : std_logic;


component clock_div is
    port(
        clk : in std_logic;
        div : out std_logic);
end component;

begin
    
    process(clk)
    begin
        if (rising_edge(clk)) then
            if CE = '1' then
                Q<= not Q;
                led0 <= Q;
            end if;
        end if;
        
        
        
    end process;
    
    
    
    dut : clock_div
        port map(
            clk => clk,
            div => CE );
    
end Behavioral;
