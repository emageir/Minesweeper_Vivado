----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:37 11/14/2014 
-- Design Name: 
-- Module Name:    Random - Behavioral 
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

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Random is
    Port ( Clk : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           x_co : out  STD_LOGIC_VECTOR (4 downto 0);
           y_co : out  STD_LOGIC_VECTOR (4 downto 0));
end Random;


architecture Behavioral of Random is


component lsfr_random
port(
		clk			:in  std_logic;     
		reset       :in std_logic;
		lfsr_out		:out std_logic_vector (9 downto 0)

);
end component;

signal random_out : std_logic_vector (9 downto 0);
signal x_tmp :std_logic_vector (4 downto 0);
signal y_tmp:std_logic_vector (4 downto 0);
signal rst:std_logic ;


signal uX_tmp : unsigned(4 downto 0):=(others=>'0');
signal uY_tmp : unsigned(4 downto 0):=(others=>'0');
signal uRandom : unsigned(9 downto 0):=(others=>'0');

begin

rst<='0';

LSFR: lsfr_random port map (Clk,rst,random_out);



----------------------------------------------
--CASTING AND ADDRESSING

--uX_tmp <= unsigned(x_tmp);
--uY_tmp <= unsigned(x_tmp);

uRandom <= unsigned (random_out);

process
begin
wait until Clk'event AND Clk='1';

if (uRandom(9 downto 5)>="10100" OR uRandom(4 downto 0)>="10100" OR Enable='0') then

uX_tmp<="00000";
uY_tmp<="00000";

else

uX_tmp<= uRandom(9 downto 5)+1;
uY_tmp<= uRandom(4 downto 0)+1;
end if;

end process;


--------------------------------------------

x_co<=std_logic_vector(uX_tmp);
y_co<=std_logic_vector(uY_tmp);

end Behavioral;

