
----------------------------------------------------------------------------------
-- Engineer: 			Nico Päller
-- 
-- Create Date:    	12:56:06 01/02/2019 
-- Module Name:    	displayDriver - Implementation 
-- Project Name: 		PWM Nexys2
-- Target Devices: 	Nexys2 Spartan 3E

-- Description: The modules that shows the channel number on the Seven Segment Display
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;



entity displayDriver is
	generic(	g_FREQUENCY : integer := 250000); -- standard is 100Hz per 7 Segment display
	port(		clk : in std_logic;
				hex_or_dec : in std_logic; -- indicator if numbers should be displayed as decimal or hexadecimal
				number : in integer range 0 to 15;
			
				display_placing : out std_logic_vector(3 downto 0);
				led_out : out std_logic_vector(6 downto 0));
			
end displayDriver;

architecture Behavioral of displayDriver is

-- own ram_t datatype
type ram_t is array(0 to 15) of std_logic_vector(6 downto 0);

signal freq_counter : integer range 0 to g_FREQUENCY-1 := 1;
signal display_placing_index : bit := '0';
-- all 16 coded 7 Segment numbers in a ram_t
constant c_DIGITS : ram_t := ("1000000", "1111001", "0100100", "0110000", "0011001", "0010010", "0000010", "1111000", 
										"0000000", "0010000", "0001000", "0000011", "1000110", "0100001", "0000110", "0001110");

begin

process(clk, freq_counter) begin
	if rising_edge(clk) then
		freq_counter <= freq_counter + 1;
		
		if freq_counter = g_FREQUENCY-1 then
			-- update right 7 Segment display (1's)
			if display_placing_index = '0' then
				display_placing_index <= '1';
				display_placing <= "1110";

				if number < 10 or hex_or_dec = '0' then
					led_out <= c_DIGITS(number);
				else
					led_out <= c_DIGITS(number - 10);
				end if;
			-- update left 7 Segment display (10's)
			else
				display_placing_index <= '0';
				display_placing <= "1101";
				
				-- max displayed number is 15 (decimal), therefore just a 1 or a zero has to be displayed
				if number > 9 and hex_or_dec = '1' then
					led_out <= c_DIGITS(1);
				else
					led_out <= c_DIGITS(0);
				end if;
			end if;
		end if;
	end if;
	
end process;
end Behavioral;

