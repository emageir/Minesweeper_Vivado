library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_button is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           in_bit : in  STD_LOGIC;
           out_bit : out  STD_LOGIC);
end test_button;

architecture Behavioral of test_button is

signal state : STD_LOGIC_vector(1 downto 0);
signal temp_out_bit : STD_LOGIC;
begin
	process
	begin
		wait until clk'event and clk='1'; 
		if rst='1' then 
			state<="00";
			temp_out_bit <='0';
		else 

			if in_bit='1' and state="00" then
				state<="01";
				temp_out_bit <='1';
	
			elsif in_bit='1' and state="01" then
				state<="01";
				temp_out_bit <='0';
	
			elsif in_bit='0' and state="01" then
				state<="00";
				temp_out_bit <='0';		
			else
				state<="00";
				temp_out_bit <='0';		
			end if;
		end if;
	end process;

	out_bit <= temp_out_bit;

end Behavioral;

