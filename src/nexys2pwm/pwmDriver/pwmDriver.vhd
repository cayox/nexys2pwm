----------------------------------------------------------------------------------
-- Engineer: 			Nico Päller
-- 
-- Create Date:    	12:56:06 01/02/2019 
-- Module Name:    	pwmDriver - Implementation 
-- Project Name: 		PWM Nexys2
-- Target Devices: 	Nexys2 Spartan 3E

-- Description: The Module which creates the PWM Signal
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;


entity pwmDriver is
	generic(	g_FREQUENCY : integer := 2; -- around 100kHz with a resolution of 8 bit
				g_RESOLUTION : integer := 8);
				
	port(		clk : in std_logic;
				value : in std_logic_vector((g_RESOLUTION - 1) downto 0);
				pwm_out : out std_logic);
end pwmDriver;

architecture Behavioral of pwmDriver is

signal pwm_counter : std_logic_vector((g_RESOLUTION - 1) downto 0) := (others => '0');
signal freq_counter : integer range 0 to g_FREQUENCY-1 := 0;

begin
		
process(clk) begin
		if rising_edge(clk) then
			freq_counter <= freq_counter + 1;
			
			if freq_counter = g_FREQUENCY-1 then
				freq_counter <= 0;
				-- check if value is max, to display constatant HIGH
				if value >= 2 ** g_RESOLUTION - 1 then
					pwm_out <= '1';
				elsif pwm_counter < value then
					pwm_out <= '1';
				else
					pwm_out <= '0';
				end if;
				pwm_counter <= pwm_counter + 1;
			end if;
		end if;
		
	end process;


end Behavioral;

