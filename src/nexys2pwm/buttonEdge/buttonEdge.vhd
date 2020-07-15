----------------------------------------------------------------------------------
-- Engineer: 			Nico Päller
-- 
-- Create Date:    	12:56:06 01/02/2019 
-- Module Name:    	buttonEdge - Implementation 
-- Project Name: 		PWM Nexys2
-- Target Devices: 	Nexys2 Spartan 3E

-- Description: A Module to detect rising edges; debounces the input
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buttonEdge is
	port(	clk : in std_logic;
			button_in : in std_logic;
			detected_edge : out std_logic);
end buttonEdge;

architecture Behavioral of buttonEdge is

component buttonDebouncing is
    Port ( clk : in  std_logic;
           button_in : in  std_logic;
           stable_state : out  std_logic);
end component;

signal button_deb : std_logic := '0';
signal oldstate : STD_LOGIC := '0';

begin

debouncing : buttonDebouncing port map(clk => clk,
													button_in => button_in, 
													stable_state => button_deb);

process(clk,button_deb) begin
	if rising_edge(clk) then
		if(button_deb = '1' and oldstate = '0') then
			detected_edge <= '1';
		else
			detected_edge <= '0';
		end if;
		oldstate <= button_deb;
	end if;
end process;

end Behavioral;

