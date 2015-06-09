library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OpenRest_module is
	Port ( 
			  Play_Done : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
			  
			  Request_Set : out  STD_LOGIC;
			  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
		     Data_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Done : out  STD_LOGIC
			  );
end OpenRest_module;

architecture Behavioral of OpenRest_module is

----------SIGNALS------------------------------------
	signal x_temp: unsigned (4 downto 0) :="00001";
	signal y_temp: unsigned (4 downto 0) :="00001";

	signal Data_out_temp:  STD_LOGIC_VECTOR (3 downto 0);
	signal set_temp: STD_LOGIC:='0';
	
	signal done_sig: STD_LOGIC:='0';


----------STATES--------------------------------------
Type State_type is
(Zero_st, InitXY_st, Wait1_st, Wait2_st, Set_st, Move_st, Done_st);
signal state:State_type:=(Zero_st);


begin

process
begin
	Wait until Clk'event AND Clk='1';
	
	If Reset='1' then-----------------------arxikopoioume!
			x_temp<="00001";
			y_temp<="00001";
			set_temp<='0';
			done_sig <= '0';
			state<=Zero_st;		
	else
			Case state is
			
			When Zero_st=>--Zero
					if (Play_Done='1') then
						state<=InitXY_st;
					else
						state<=Zero_st;
					end if;

			When InitXY_st=>
					----- arxikopoioume tiw syntetagmenes mas
					x_temp<="00001";
					y_temp<="00001";
					set_temp<='0';
					
					state <= Wait1_st;
				
				When Wait1_st =>
					
					set_temp <= '0';				
					state <= Wait2_st;
					
				When Wait2_st =>
				
					set_temp <= '0';
					state <= Set_st;
					
				When Set_st =>
				
					if Data_In(4) = '0' then --- an einai unexplored to keli
						if Data_In = "01111" then --- an yparxei vomva tote dinw kafe katsarida
							Data_out_temp <= "1010";
							x_temp <= x_temp;
							y_temp <= y_temp;
							set_temp <= '1';
							
						else
							Data_out_temp <= Data_In(3 downto 0);
							x_temp <= x_temp;
							y_temp <= y_temp;
							set_temp <= '1';
						end if;							
					end if;		
				
				state <= Move_st;
				
				When Move_st =>
				
					If (y_temp=20) then
						if (x_temp=20) then
							set_temp <= '0';
							state <= Done_st;
						else
							set_temp <= '0';
							x_temp<=x_temp+1;
							y_temp<="00001";
							state <= Wait1_st;
						end if;
					else
						set_temp <= '0';
						y_temp<=y_temp+1;
						state <= Wait1_st;
					end if;
					
					
					
					
				When Done_st =>
					done_sig<='1';
					set_temp<='0';
					state<=Done_st;
					
				when others=>NULL;
			end case;

	end if;
end process;

-----------------------------
Request_set<=set_temp;

Data_out<='1'&Data_out_temp;
Done <= done_sig;

X_out <=STD_LOGIC_VECTOR(x_temp);
Y_out <=STD_LOGIC_VECTOR(y_temp);

end Behavioral;

