----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:54:12 01/09/2015 
-- Design Name: 
-- Module Name:    BlockRamFaces - Behavioral 
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

entity BlockRamFaces is
		Port ( 
			  Clock : in  STD_LOGIC;
           Texture : in  STD_LOGIC_VECTOR (2 downto 0);
           Row : in  STD_LOGIC_VECTOR (5 downto 0);
			  Column : in  STD_LOGIC_VECTOR (5 downto 0);
           DataOutPixel : out  STD_LOGIC_VECTOR(15 downto 0)
			  );
end BlockRamFaces;

architecture Behavioral of BlockRamFaces is

signal Addr: STD_LOGIC_VECTOR(8 downto 0);
signal Memout: STD_LOGIC_VECTOR(799 downto 0);
signal Column_r: STD_LOGIC_VECTOR(5 downto 0);

begin

FacesToAddr: entity work.FaceAndRowToAddr PORT MAP(
		Texture => Texture,
		Row => Row,
		AddressOut => Addr
	);

CoreFaces: entity work.MemFaces PORT MAP(
    addra => Addr,
    clka =>Clock,
    douta => Memout
	);
	
Regist6: entity work.Reg6 PORT MAP(
		Clock => Clock,
		ColumnIn => Column,
		ColumnOut => Column_r
	);
	
ColumnMux: entity work.ToPixelFaces PORT MAP(
		DataIn => Memout,
		Column => Column_r,
		PixelOut => DataOutPixel
	);

end Behavioral;

