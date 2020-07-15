----------------------------------------------------------------------------------
-- Engineer: 			Nico Päller
-- 
-- Create Date:    	12:56:06 01/02/2019 
-- Module Name:    	buttonDebouncing - Implementation 
-- Project Name: 		PWM Nexys2
-- Target Devices: 	Nexys2 Spartan 3E

-- Description: A module to debounce some input
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buttonDebouncing is
    Port ( clk : in  std_logic;
           button_in : in  std_logic;
           stable_state : out  std_logic);
end buttonDebouncing;

architecture Implementation of buttonDebouncing is

constant time_limit : integer := 50000; -- 1 ms 
signal debouncing_counter : integer range 0 to time_limit := 0;
signal old_state: bit:= '0';
signal current_state: bit:= '0';

begin
	current_state <= to_bit(button_in);

	timeDelayManager : process(clk,current_state)
	begin
		if clk'event and clk = '1' then
			if current_state /= old_state then
				debouncing_counter <= 0;
			elsif debouncing_counter = time_limit-1 then
				stable_state <= button_in;
				debouncing_counter <= 0;
			elsif debouncing_counter < time_limit then
				debouncing_counter <= debouncing_counter + 1;
			end if;
			old_state <= current_state;
		end if;			
	end process;

end Implementation;

