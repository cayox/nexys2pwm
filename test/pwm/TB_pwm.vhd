LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_pwm IS
END TB_pwm;
 
ARCHITECTURE behavior OF TB_pwm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwmDriver
    PORT(
         clk : IN  std_logic;
         value : IN  std_logic_vector(7 downto 0);
         pwm_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal value : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal pwm_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwmDriver PORT MAP (
          clk => clk,
          value => value,
          pwm_out => pwm_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		-- simulate 0% Duty Cycle
      value <= "00000000";
		wait for 1 ms;
		
		-- simulate 100% Duty Cycle
      value <= "11111111";
		wait for 1 ms;
		
		-- simulate smallest Duty Cycle
      value <= "00000001";
		wait for 1 ms;
		
		-- simulate around 50% Duty Cycle
      value <= "10000000";
		wait for 1 ms;

      wait;
   end process;

END;
