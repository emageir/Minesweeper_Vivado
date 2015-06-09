library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;
use Ieee.std_logic_unsigned.all;

entity RowToAddr is
	Port (  Row : in  STD_LOGIC_VECTOR (4 downto 0);
           AddressOut : out STD_LOGIC_VECTOR (4 downto 0)
			  );
end RowToAddr;

architecture Behavioral of RowToAddr is

begin

	AddressOut <= conv_std_logic_vector(conv_integer(Row)-1,5);

end Behavioral;