----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:02:06 11/16/2014 
-- Design Name: 
-- Module Name:    Cursor - Behavioral 
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

entity Cursor is
    Port ( Clk : in  STD_LOGIC;
			  Reset :in STD_LOGIC;
			  Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           Left : in  STD_LOGIC;
           Right : in  STD_LOGIC;
          -- Confirm : in  STD_LOGIC;
           Move1 : in  STD_LOGIC_vector(0 downto 0);
           Move2 : in  STD_LOGIC_vector(0 downto 0);
           Move4 : in  STD_LOGIC_vector(0 downto 0);
           Move8 : in  STD_LOGIC_vector(0 downto 0);
           X_co : out  std_logic_vector (4 downto 0);
           Y_co : out  std_logic_vector (4 downto 0));
end Cursor;

architecture Behavioral of Cursor is


--component Register5 
--    Port ( 
--			rst_n				: in  STD_LOGIC;
--         clk				: in  STD_LOGIC;
--   	   enable			: in 	STD_LOGIC;
--         din 				: in  STD_LOGIC_VECTOR ( 4 DOWNTO 0 );
--         dout				: out STD_LOGIC_VECTOR ( 4 DOWNTO 0 )
--	);
--end component;




signal x_tmp:unsigned (4 downto 0):=("00001");
signal y_tmp:unsigned (4 downto 0):=("00001");
signal Move:unsigned(3 downto 0);
signal Moves0:unsigned(0 downto 0);
signal Moves1:unsigned(0 downto 0);
signal Moves2:unsigned(0 downto 0);
signal Moves3:unsigned(0 downto 0);


begin

Moves0<=unsigned(Move1);
Moves1<=unsigned(Move2);
Moves2<=unsigned(Move4);
Moves3<=unsigned(Move8);

Move<=Moves3&Moves2&Moves1&Moves0;


process

begin

WAIT UNTIL Clk'event AND Clk='1';

If (Reset='1') then
	
	x_tmp<="00001";
	y_tmp<="00001";

else

	If (Up='1') then
		
		if (x_tmp-(1+Move)>20) then ------------------------ -11 apo to epithymito an xeperasw ta oria
			x_tmp<=x_tmp-(1+Move)-11;---------x_tmp-
			
		elsif(x_tmp-(1+Move)=0) then
			x_tmp<="10100";
		else
			x_tmp<= x_tmp-(1+Move);
		end if;
		
		y_tmp<=y_tmp; ------------to y menei idio

	elsif(Down='1') then
		
		if (x_tmp+(1+Move)>20) then ---------------------------- -20 apo to epithymito an xeperasw ta oria
			x_tmp<=x_tmp+(1+Move)-20;
		
		elsif(x_tmp+(1+Move)=0) then
			x_tmp<="00001";
		else
			x_tmp<= x_tmp+(1+Move);
		end if;
		
		y_tmp<=y_tmp; ------------to y menei idio

	elsif(Left='1') then
	
		if (y_tmp-(1+Move)>20) then ------------------------ -11 apo to epithymito an xeperasw ta oria
			y_tmp<=y_tmp-(1+Move)-11;
			
		elsif(y_tmp-(1+Move)=0) then
			y_tmp<="10100";
		else
			y_tmp<= y_tmp-(1+Move);
		end if;
	
		x_tmp<=x_tmp;------------to x menei idio
	
	elsif(Right='1')then
		
		if (y_tmp+(1+Move)>20) then ---------------------------- -20 apo to epithymito an xeperasw ta oria
			y_tmp<=y_tmp+(1+Move)-20;
			
		elsif(y_tmp+(1+Move)=0) then
			y_tmp<="00001";
			
		else
			y_tmp<= y_tmp+(1+Move);
		end if;
		
		x_tmp<=x_tmp;------------to x menei idio
		
	else 
	
	y_tmp<=y_tmp; -----------anatrofodothsh twn timwn
	x_tmp<=x_tmp; -----------petyxainei to idio me to na eixa register5
		
   end if;

end if;


end process;

X_co<=std_logic_vector(x_tmp);
Y_co<=std_logic_vector(y_tmp);

end Behavioral;

