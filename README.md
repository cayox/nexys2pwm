# nexys2pwm

## Overwiev
This Project can be used create a PWM Signal. It was created and ISE Webpack by Xilinx and 
is intended to be used with this software.

Its written in VHDL.

The code was tested on a nexys2 Spartan 3E1200 Board and in a simulation.

## How to use
### Hardware
The Project implements 16 Channels on which a PWM Signal can be set. The Channel can be 
selected via `BTN0` (count up) and `BTN1` (count down) and is displayed via the 7 Segment Display.
The Display mode can be toggled between decimal and hexadecimal with `BTN2`.

Furthermore Duty Cycle can be chosen with the 8 Switches and is set with a push to `BTN3`.

### The PWM-Module
The PWM-Driver can be implemented as a component. It has the following entity:
```c
    entity pwmDriver is
        generic(    g_FREQUENCY : integer := 2; -- around 100kHz with a resolution of 8 bit
                    g_RESOLUTION : integer := 8);
                    
        port(       clk : in std_logic;
                    value : in std_logic_vector((g_RESOLUTION - 1) downto 0);
                    pwm_out : out std_logic);
    end pwmDriver;
```

* g_FREQUENCY : A generic to set the frequency. Must be 2 in this case to have a 100kHz Frequenc
    with 8 Bit Resolution on a 50MHz clock
* g_RESOLUTION : The resolution of the PWM-Signal
* clk : the clock input
* value : The value of which a PWM Signal should be created
* pwm_out : the output signal
 

