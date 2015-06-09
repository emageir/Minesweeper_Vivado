library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;
use Ieee.std_logic_unsigned.all;

entity CoordToAddr is
    Port ( 
			  X : in  STD_LOGIC_VECTOR (4 downto 0);
           Y : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out STD_LOGIC_VECTOR (8 downto 0)
			  );
end CoordToAddr;

architecture Behavioral of CoordToAddr is

begin

			-- O METASXHMATISMOS POU VRISKEI TH DIEYTHINSI THS MNHMHS POY AFORA TH SYNTETAGMENH X,Y 
			Output <= conv_std_logic_vector(conv_integer((X))*22+conv_integer(Y),9);
		

end Behavioral;


