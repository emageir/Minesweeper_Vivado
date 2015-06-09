library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;
use Ieee.std_logic_unsigned.all;

entity FaceAndRowToAddr is
    Port ( 
			  Texture : in  STD_LOGIC_VECTOR (2 downto 0);
           Row : in  STD_LOGIC_VECTOR (5 downto 0);
           AddressOut : out STD_LOGIC_VECTOR (8 downto 0)
			  );
end FaceAndRowToAddr;

architecture Behavioral of FaceAndRowToAddr is

begin


			AddressOut <= conv_std_logic_vector(conv_integer((Texture))*60+conv_integer(Row)-1,9);
		

end Behavioral;