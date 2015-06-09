----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:26 04/09/2009 
-- Design Name: 
-- Module Name:    debounce_new - Behavioral 
-- Project Name:   Lab4
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
	generic(non_sampling_clk_cycles_num : integer := 10000000); -- number of clock cycles that the button value is not sampled
                                                               -- for simulation use a smaller number e.g. 32
	port(
		clk        : in std_logic;
		reset      : in std_logic;
		button_in  : in std_logic; -- bouncing button signal (input)
		button_out : out std_logic -- debounced button signal (output)
	);
end debounce;

architecture Behavioral of debounce is

	-- counter value
	signal cnt : std_logic_vector(31 downto 0); 
	-- number of clock cycles that switch value is not sampled
	constant non_sampling_clk_cycles : std_logic_vector(31 downto 0) := conv_std_logic_vector(integer(non_sampling_clk_cycles_num), 32);
	
	type button_state_type is (NO_SAMPLING, SAMPLING, WAIT_FOR_ZERO);
	signal button_state : button_state_type;
	
	
begin

	debounce_fsm_process:
	process(clk, reset, button_in, cnt)
	begin
	
		if reset = '1' then
		
			button_state <= SAMPLING;
			button_out <= '0';
			
			cnt <= non_sampling_clk_cycles;
			
		elsif clk ' event and clk = '1' then
		
			case button_state is
				when SAMPLING =>
				
					cnt <= non_sampling_clk_cycles;
				
					if button_in  = '1' then 
						button_state <= NO_SAMPLING;
						button_out <= '1';
					else
						button_state <= SAMPLING;
						button_out <= '0';
					end if;
					
				when NO_SAMPLING =>
					
					cnt <= cnt - '1';
				
					if cnt > "00000000000000000000000000000000" then
						button_state <= NO_SAMPLING;
					elsif button_in = '1' then 
						button_state <= WAIT_FOR_ZERO;  -- if NON sampling interval has elapsed and input button is pressed go to WAIT_FOR_ZERO state to wait for button to be released
					else
						button_state <= SAMPLING;  -- if NON sampling interval has elapsed and input button is released, go to SAMPLING state
					end if;

					button_out <= '1';
					
				when others => -- WAIT_FOR_ZERO
					
					cnt <= (others=>'0');
					
					if button_in = '1' then
						button_state <= WAIT_FOR_ZERO;
						button_out <= '1';
					else
						button_state <= SAMPLING;
						button_out <= '0';
					end if;

			end case;
			
		end if;
	
	end process;

	
end Behavioral;

