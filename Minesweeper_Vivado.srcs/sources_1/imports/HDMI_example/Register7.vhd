----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:25 11/22/2014 
-- Design Name: 
-- Module Name:    Register7 - Behavioral 
-- Project Name: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register7 is
    Port ( 
	   rst_n			: in  STD_LOGIC;
           clk				: in  STD_LOGIC;
   	   enable			: in 	STD_LOGIC;
           din 				: in  STD_LOGIC_VECTOR ( 6 DOWNTO 0 );
           dout				: out STD_LOGIC_VECTOR ( 6 DOWNTO 0 )
	);
end Register7;

architecture Behavioral of Register7 is

signal data : STD_LOGIC_VECTOR ( 6 DOWNTO 0 );

begin


PROCESS 

BEGIN
	wait until clk'event AND clk = '1';

		IF rst_n = '1' then
			data <= (others => '0');
		elsif enable = '1' then 
			data <= din;
		else
			data <= data; 
		END IF;

END PROCESS;


dout <= data; 

end Behavioral;
