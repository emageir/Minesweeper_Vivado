
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Initialize is
	port( Clk : in  STD_LOGIC;
		  Reset : in  STD_LOGIC;
		  Random_Done : in Std_Logic;
		  Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
		  
		  Request_Set : out  STD_LOGIC;
		  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
        Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
		  Data_out : out  STD_LOGIC_VECTOR (4 downto 0); 
		  Done : out STD_LOGIC);
end Initialize;

architecture Behavioral of Initialize is

	signal x_temp: unsigned (4 downto 0):="00001";
	signal y_temp: unsigned (4 downto 0):="00001";
	
	signal set_temp: STD_LOGIC:='0';

	signal sum_temp: unsigned(3 downto 0):="0000";
	
	signal done_sig: STD_LOGIC:='0';
	
---------------------------------------------------------------------------STATES	
Type State_type is 
   (Zero_st,First_st,Idle1_st,A_st,B_st,C_St,Idle2_st,Done_st,Evaluate_st,Evaluate_st2,--10
	 UL_st1,UL_st2,UL_st3,UL_st4,UL_st5,
	 UR_st1,UR_st2,UR_st3,UR_st4,UR_st5,--20
	 U_st1,U_st2,U_st3,U_st4,U_st5,U_st6,U_st7,
	 BL_st1,BL_st2,BL_st3,BL_st4,BL_st5,
	 BR_st1,BR_st2,BR_st3,BR_st4,BR_st5,--37
	 B_st1,B_st2,B_st3,B_st4,B_st5,B_st6,B_st7,--44
	 L_st1,L_st2,L_st3,L_st4,L_st5,L_st6,L_st7,--51
	 R_st1,R_st2,R_st3,R_st4,R_st5,R_st6,R_st7,--58
	 C_st1,C_st2,C_st3,C_st4,C_st5,C_st6,C_st7,C_st8,C_st9,C_st10);--68 STATES WTF!
   Signal state: State_type:=(Zero_st);
	
	
	
begin

Done <= done_sig;
process
	begin
	WAIT UNTIL Clk'event AND Clk='1';
	
	If Reset='1' then
		
		----REQUEST SET
		
		set_temp<='0';
		done_sig<='0';
		sum_temp<="0000";
		x_temp<="00001";
		y_temp<="00001";
		
		state<=Zero_st;
		
		else
			
			Case state is 
				When Zero_st=>
					if (Random_Done='1') then
						state<=First_st;
					else
						state<=Zero_st;
					end if;
				
				When First_st=>
				
				 x_temp<="00001";
		       y_temp<="00001";
				 
			-------------------------apothikevei ta coordinates

				 state<=Idle1_st;
				 
				When Idle1_st =>
					
					sum_temp<="0000";
					----REQUEST SET
					
					 set_temp<='0';
					 
					 x_temp<= x_temp;
					 y_temp<=y_temp;
					 
					 
				state<=A_st;
				
				When A_st=>
				
					state<=B_st;
				
				When B_st=>
				
					state<= C_st;
					
				When C_st=>
				
				If (Data_in="01111") then--exoume vomva sto tetragwno to initialize dn kanei tpt--allaxe to x,y kai xanapane sto Idle1
					
					If(y_temp=20)then
						if(x_temp=20)then
							done_sig<='1';
							state<=Done_st;
						else
							
							x_temp<=x_temp+1;
							y_temp<="00001";
							
							state<=Idle1_st;
							
						end if;
					else
							
							y_temp<=y_temp+1;
							
							state<=Idle1_st;
					end if;
					
				else
				 state<=Idle2_st;------- an den exeis vomva shmainei oti einai adeio to tetragwno. opote theloume evaluate opote bes idle2
				end if;
				
				When Idle2_st=>
							
							x_temp<=x_temp;
							y_temp<=y_temp;
							
					If (x_temp="00001") then -------------prwth grammh
						If(y_temp="00001")then------------prwth sthlh
							state<=UL_st1;--(1,1)
						elsif (y_temp=20) then------------teleytaia sthlh
							state<=UR_st1;--(1,20)
						else
							state<=U_st1;--(1,whatever)
						end if;
					elsif (x_temp=20) then------------teleytaia grammh
						If(y_temp="00001")then
							state<=BL_st1;--(20,1)
						elsif (y_temp=20) then
							state<=BR_st1;--(20,20)
						else
							state<=B_st1;--(20,whatever)
						end if;
					else
						If(y_temp="00001")then
							state<=L_st1;
						elsif (y_temp=20) then
							state<=R_st1;
						
						else
							state<=C_st1;
						end if;
					
					end if;
					
				When UL_st1=>--------------------------------------------------------------------------------------------------------------UPPER LEFT

				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 state<=UL_st2;
				 
				When UL_st2=>

				 y_temp<=y_temp;
				 x_temp<=x_temp+1;
				 
				 state<= UL_st3;
				 
				When UL_st3=>
				
				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 state<= UL_st4;
				 
				 
				When UL_st4=>
				
				 y_temp<=y_temp;
				 x_temp<=x_temp-1;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 
				state<=UL_st5;
				
				When UL_st5=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp;
				 
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
					state<=Evaluate_st;
					
				When Evaluate_st=>-----------------------------------------------------------------------------------------------------EVALUATE
					
					----REQUEST SET
					sum_temp<=sum_temp;
					set_temp<='1';
					
					state<=Evaluate_st2;
					
				When Evaluate_st2=>
					
				   ----REQUEST SET
					set_temp<='0';
				
					If(y_temp=20)then
						if(x_temp=20)then
							done_sig<='1';
							state<=Done_st;
						else
						
							x_temp<=x_temp+1;
							y_temp<="00001";
							
							state<=Idle1_st;
							
						end if;
					else
							y_temp<=y_temp+1;
							
							state<=Idle1_st;
					end if;
				
					
				When U_st1=>----------------------------------------------------------------------------------------------UPPER
					
					 y_temp<=y_temp+1;
					 x_temp<=x_temp;
				 
				   state<=U_st2;
				
				When U_st2=>	
				   
					 y_temp<=y_temp;
					 x_temp<=x_temp+1;
				   
					state<= U_st3;
				 
				When U_st3=>
					
					 y_temp<=y_temp-1;
					 x_temp<=x_temp;

					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= U_st4;
				
				When U_st4=>
					
					y_temp<=y_temp-1;
					 x_temp<=x_temp;
					
					If (Data_in="01111") then
		
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
				state<= U_st5;

				When U_st5=>
			
				   x_temp<=x_temp-1;
					y_temp<=y_temp;
				
					If (Data_in="01111") then
			
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= U_st6;
					
				When U_st6=>

					x_temp<=x_temp;
					y_temp<=y_temp+1;
					
    				If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= U_st7;
					
				When U_st7=>
					
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= Evaluate_st;
					
				When UR_st1=>--------------------------------------------------------------------------------------------------------------UPPER RIGHT

				 x_temp<=x_temp+1;
				 y_temp<=y_temp;
				 
				 state<=UR_st2;
				 
				When UR_st2=>

				 y_temp<=y_temp-1;
				 x_temp<=x_temp;
				 
				 state<= UR_st3;
				 
				When UR_st3=>
				
				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 state<= UR_st4;
				 
				 
				When UR_st4=>
				
				 y_temp<=y_temp+1;
				 x_temp<=x_temp;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 
				state<=UR_st5;
				
				When UR_st5=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp;
				 
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
					state<=Evaluate_st;
					
				When L_st1=>----------------------------------------------------------------------------------------------LEFT
					
					 y_temp<=y_temp;
					 x_temp<=x_temp-1;
				 
				   state<=L_st2;
				
				When L_st2=>	
				   
					 y_temp<=y_temp+1;
					 x_temp<=x_temp;
				   
					state<= L_st3;
				 
				When L_st3=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp+1;

					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= L_st4;
				
				When L_st4=>
					
					y_temp<=y_temp;
					 x_temp<=x_temp+1;
					
					If (Data_in="01111") then
		
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
				state<= L_st5;

				When L_st5=>
			
				   x_temp<=x_temp;
					y_temp<=y_temp-1;
				
					If (Data_in="01111") then
			
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= L_st6;
					
				When L_st6=>

					x_temp<=x_temp-1;
					y_temp<=y_temp;
					
    				If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= L_st7;
					
				When L_st7=>
					
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= Evaluate_st;
					
				When C_st1=>----------------------------------------------------------------------------------------------CENTRE
					
					 y_temp<=y_temp+1;
					 x_temp<=x_temp;
				 
				   state<=C_st2;
				
				When C_st2=>	
				   
					 y_temp<=y_temp;
					 x_temp<=x_temp+1;
				   
					state<= C_st3;
				 
				When C_st3=>
					
					 y_temp<=y_temp-1;
					 x_temp<=x_temp;

					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= C_st4;
				
				When C_st4=>
					
					y_temp<=y_temp-1;
					 x_temp<=x_temp;
					
					If (Data_in="01111") then
		
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
				state<= C_st5;

				When C_st5=>
			
				   x_temp<=x_temp-1;
					y_temp<=y_temp;
				
					If (Data_in="01111") then
			
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= C_st6;
					
				When C_st6=>

					x_temp<=x_temp-1;
					y_temp<=y_temp;
					
    				If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= C_st7;
					
				When C_st7=>
					
					x_temp<=x_temp;
					y_temp<=y_temp+1;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<=C_st8;
				
				When C_st8=>
					
					x_temp<=x_temp;
					y_temp<=y_temp+1;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<=C_st9;
				
				When C_st9=>
					
					x_temp<=x_temp+1;
					y_temp<=y_temp-1;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<=C_st10;
					
				When C_st10=>
					
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= Evaluate_st;
				
				When R_st1=>----------------------------------------------------------------------------------------------RIGHT
					
					 y_temp<=y_temp;
					 x_temp<=x_temp+1;
				 
				   state<=R_st2;
				
				When R_st2=>	
				   
					 y_temp<=y_temp-1;
					 x_temp<=x_temp;
				   
					state<= R_st3;
				 
				When R_st3=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp-1;

					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= R_st4;
				
				When R_st4=>
					
					y_temp<=y_temp;
					 x_temp<=x_temp-1;
					
					If (Data_in="01111") then
		
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
				state<= R_st5;

				When R_st5=>
			
				   x_temp<=x_temp;
					y_temp<=y_temp+1;
				
					If (Data_in="01111") then
			
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= R_st6;
					
				When R_st6=>

					x_temp<=x_temp+1;
					y_temp<=y_temp;
					
    				If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= R_st7;
					
				When R_st7=>
					
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= Evaluate_st;
					
				When BL_st1=>--------------------------------------------------------------------------------------------------------------BOTTOM LEFT

				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 state<=BL_st2;
				 
				When BL_st2=>

				 y_temp<=y_temp+1;
				 x_temp<=x_temp;
				 
				 state<= BL_st3;
				 
				When BL_st3=>
				
				 x_temp<=x_temp+1;
				 y_temp<=y_temp;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 state<= BL_st4;
				 
				 
				When BL_st4=>
				
				 y_temp<=y_temp-1;
				 x_temp<=x_temp;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 
				state<=BL_st5;
				
				When BL_st5=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp;
				 
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
					state<=Evaluate_st;	
					
				When B_st1=>----------------------------------------------------------------------------------------------BOTTOM
					
					 y_temp<=y_temp-1;
					 x_temp<=x_temp;
				 
				   state<=B_st2;
				
				When B_st2=>	
				   
					 y_temp<=y_temp;
					 x_temp<=x_temp-1;
				   
					state<= B_st3;
				 
				When B_st3=>
					
					 y_temp<=y_temp+1;
					 x_temp<=x_temp;

					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= B_st4;
				
				When B_st4=>
					
					y_temp<=y_temp+1;
					 x_temp<=x_temp;
					
					If (Data_in="01111") then
		
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
				state<= B_st5;

				When B_st5=>
			
				   x_temp<=x_temp+1;
					y_temp<=y_temp;
				
					If (Data_in="01111") then
			
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= B_st6;
					
				When B_st6=>

					x_temp<=x_temp;
					y_temp<=y_temp-1;
					
    				If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= B_st7;
					
				When B_st7=>
					
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
					else
						sum_temp<=sum_temp;
					end if;
					
					state<= Evaluate_st;
				
				When BR_st1=>--------------------------------------------------------------------------------------------------------------BOTTOM RIGHT

				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 state<=BR_st2;
				 
				When BR_st2=>

				 y_temp<=y_temp;
				 x_temp<=x_temp-1;
				 
				 state<= BR_st3;
				 
				When BR_st3=>
				
				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 state<= BR_st4;
				 
				 
				When BR_st4=>
				
				 y_temp<=y_temp;
				 x_temp<=x_temp+1;
				 
				 If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
				 
				state<=BR_st5;
				
				When BR_st5=>
					
					 y_temp<=y_temp;
					 x_temp<=x_temp;
				 
					If (Data_in="01111") then
						
						sum_temp<=sum_temp+1;
				 else
						sum_temp<=sum_temp;
				 end if;
				 
					state<=Evaluate_st;
			   
				 
				When Done_st=>------------------------------------------------------------------------------------------------DONE
				----REQUEST SET
					
					set_temp<='0';
					
					
					done_sig<='1';
					state<=Done_st;
				
				when others=>NULL;
			end case;
	end if;
	
end process;
-----------------

Request_set<=set_temp;

Data_out<="0"&STD_LOGIC_VECTOR(sum_temp);

X_out<=STD_LOGIC_VECTOR(x_temp);
Y_out<=STD_LOGIC_VECTOR(y_temp);


end Behavioral;