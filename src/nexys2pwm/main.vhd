----------------------------------------------------------------------------------
-- Engineer: 			Nico Päller
-- 
-- Create Date:    	12:56:06 01/02/2019 
-- Module Name:    	main - Implementation 
-- Project Name: 		PWM Nexys2
-- Target Devices: 	Nexys2 Spartan 3E

-- Description: A Project to use PWM on the Nexys 2 Board
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

--------------------------------ENTITY------------------------------------
entity main is
	port(	clk : in std_logic;
			buttons : in std_logic_vector(3 downto 0);
			switches : in std_logic_vector(7 downto 0);
			
			display_placing : out std_logic_vector(3 downto 0);
			leds : out std_logic_vector(7 downto 0);
			number : out std_logic_vector(6 downto 0);
			periphery : out std_logic_vector(7 downto 0));

end main;
--------------------------------ARCH------------------------------------
architecture Behavioral of main is


component buttonEdge is 
		port(	clk : in std_logic;
				button_in : in std_logic;
				detected_edge : out std_logic);
end component;

component pwmDriver is
	generic(	g_FREQUENCY : integer := 2;
				g_RESOLUTION : integer := 8);
	port(		clk : in std_logic;
				value : in std_logic_vector((g_RESOLUTION - 1) downto 0);
				pwm_out : out std_logic);
end component;

component displayDriver is
	generic(	g_FREQUENCY : integer := 250000);
	port(		clk : in std_logic;
				hex_or_dec : in std_logic;
				number : in integer range 0 to 15;
			
				display_placing : out std_logic_vector(3 downto 0);
				led_out : out std_logic_vector(6 downto 0));
end component;

--Signals
type register_ram_t is array(0 to 15) of std_logic_vector(7 downto 0);

signal buttons_edge : std_logic_vector(3 downto 0) := (others => '0');
signal hex_or_dec : std_logic := '1';
signal channel : integer range 0 to 15 := 0;

signal channel_register : register_ram_t;


begin

-- Component initialising

DEB_and_EDGE : for I in 0 to 3 generate
	edge_detect : buttonEdge port map(	clk => clk, 
													button_in => buttons(I), 
													detected_edge => buttons_edge(I));
end generate DEB_and_EDGE;


display : displayDriver	generic map(g_FREQUENCY => 25000)
								port map (	clk => clk, 
												hex_or_dec => hex_or_dec, 
												number => channel, 
												display_placing => display_placing, 
												led_out => number);

-- every pwm output gets its own driver
PWM_GET : for I in 0 to 15 generate
	 -- channel 0-7 goes to LEDS
    LEDS: if I < 8 generate
		ledpwm : pwmDriver 	generic map(g_FREQUENCY => 2, 
													g_RESOLUTION => 8)
									port map(	clk => clk, 
													value => channel_register(I), 
													pwm_out => leds(I));
    end generate LEDS;
	 
	 -- channel 8-15 goes to periphery
    PERIPHERY_PWM: if I>7 generate
		periphpwm : pwmDriver 	generic map(g_FREQUENCY => 2, 
														g_RESOLUTION => 8)
										port map(	clk => clk, 
														value => channel_register(I), 
														pwm_out => periphery(I-8));

    end generate PERIPHERY_PWM;

end generate PWM_GET;

--------------------------------MAIN------------------------------------

main : process(clk) begin

	if rising_edge(clk) then
		if buttons_edge(0) = '1' then
			if channel < 15 then
				channel <= channel + 1;
			end if;
		end if;
		
		if buttons_edge(1) = '1'  then
			if channel > 0 then
				channel <= channel - 1;
			end if;
		end if;
		
		if buttons_edge(2) = '1'  then
			hex_or_dec <= not(hex_or_dec);
		end if;
		
		if buttons_edge(3) = '1' then
			channel_register(channel) <= switches;
		end if;
	end if;
end process;


end Behavioral;

