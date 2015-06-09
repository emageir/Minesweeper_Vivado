library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.all;


entity Play_module is
    Port ( Ini_Done : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
           X_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
			  Confirm: in STD_LOGIC;
			  
			  ---FROM STACK
			  --Empty : in  STD_LOGIC;
           --Full : in  STD_LOGIC;
           --StackData : in  STD_LOGIC_VECTOR (9 downto 0);
			  
			  ---For BlockRamGrid
           Request_set : out  STD_LOGIC;
           X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Data_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  
			  Winner : out  STD_LOGIC_VECTOR (1 downto 0);
           Done : out  STD_LOGIC;
          -- Player : out  STD_LOGIC;
			  Score: out  STD_LOGIC_VECTOR (11 downto 0);
           Last_hit_P1 : out  STD_LOGIC_VECTOR (9 downto 0);
           Last_hit_P2 : out  STD_LOGIC_VECTOR (9 downto 0);
			  
			  ---FOR STACK
			  --EmptyCoords : out  STD_LOGIC_VECTOR (9 downto 0);
			  --Enable : out  STD_LOGIC_VECTOR(0 DOWNTO 0);
           --Push : out  STD_LOGIC;
			  --Pop : out  STD_LOGIC;
			  
			  Who : out  STD_LOGIC
			  );
end Play_module;

architecture Behavioral of Play_module is

	component Stack 
		Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (9 downto 0);
           Enable : in  STD_LOGIC_VECTOR(0 DOWNTO 0);
           Push : in  STD_LOGIC;
			  Pop : in  STD_LOGIC;
			  
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (9 downto 0)
			  );
	end component;
	
	
--signals
   signal x_temp: unsigned (4 downto 0):="00001";
	signal y_temp: unsigned (4 downto 0):="00001";
	
	signal set_temp: STD_LOGIC:='0';

	signal Score_temp1: unsigned(5 downto 0):="000000";
	signal Score_temp2: unsigned(5 downto 0):="000000";
	
	signal Data_out_temp:  STD_LOGIC_VECTOR (3 downto 0);
	
	signal Who_sig: STD_LOGIC:='0';
	
	----- FR0M STACK ----
	signal Empty :  STD_LOGIC;
   signal Full : STD_LOGIC;
   signal StackData : STD_LOGIC_VECTOR (9 downto 0);
	
	----- TO STACK ----
	signal EmptyCoords : STD_LOGIC_VECTOR (9 downto 0):="0000000000";
	signal Enable : STD_LOGIC_VECTOR(0 DOWNTO 0):="0";
   signal Push : STD_LOGIC:='0';
	signal Pop : STD_LOGIC:='0';


--states
Type State_type is 
   (Zero_st,P1_Idle_st,P1_Wait_st,P1_Data_st,P2_Idle_st,P2_Wait_st,P2_Data_st,
	InitXY_st, Wait1_st, Wait2_st, Set_st, Move_st, Done_st,
	-----P1 EXPAND STATES
	P1_Expand_Idle_st,P1_Scan_st1,P1_Scan_st2,P1_Scan_st3,P1_Scan_st4,P1_Scan_st5,
	P1_Scan_st6,P1_Scan_st7,P1_Scan_st8,P1_Scan_st9,P1_Scan_st10,P1_Scan_st11,P1_Scan_st12,
	P1_Scan_st13,P1_Scan_st14,P1_Scan_st15,P1_Scan_st16,P1_Scan_st17,P1_Scan_st18,P1_Scan_st19,
	P1_Scan_st20,P1_Scan_st21,P1_Scan_st22,P1_Scan_st23,P1_Scan_st24,P1_Scan_st25,
	P1_PopAndCheck_st1, P1_PopAndCheck_st2, P1_PopAndCheck_st3, P1_PopAndCheck_st4, P1_NewScan_st,
	
	-----P2 EXPAND STATES
	P2_Expand_Idle_st,P2_Scan_st1,P2_Scan_st2,P2_Scan_st3,P2_Scan_st4,P2_Scan_st5,
	P2_Scan_st6,P2_Scan_st7,P2_Scan_st8,P2_Scan_st9,P2_Scan_st10,P2_Scan_st11,P2_Scan_st12,
	P2_Scan_st13,P2_Scan_st14,P2_Scan_st15,P2_Scan_st16,P2_Scan_st17,P2_Scan_st18,P2_Scan_st19,
	P2_Scan_st20,P2_Scan_st21,P2_Scan_st22,P2_Scan_st23,P2_Scan_st24,P2_Scan_st25,
	P2_PopAndCheck_st1, P2_PopAndCheck_st2, P2_PopAndCheck_st3, P2_PopAndCheck_st4, P2_NewScan_st
	);
   Signal state: State_type:=(Zero_st);

begin

process
	begin
	WAIT UNTIL Clk'event AND Clk='1';
	
	If Reset='1' then
	
		set_temp<='0';
		Winner<= "00";
		Who_sig <= '0';
		Done<='0';
		Score_temp1<="000000";
		Score_temp2<="000000";
		x_temp<="00001";------------------------------------------------CHANGE THIS TO DESIRED FIRST TILE
		y_temp<="00001";
		
		Last_hit_P1<="0000000000";
		Last_hit_P2<="0000000000";
		
		---FOR STACK---
		Enable <= "0";
		Push <= '0';
		Pop <= '0';
		
		state<=Zero_st;
		
		else
			
			Case state is 
				When Zero_st=>--Zero
					if (Ini_Done='1') then
						state<=P1_Idle_st;
					else
						state<=Zero_st;
					end if;
				
				When P1_Idle_st=>------------------------P1
					set_temp<='0';
					Who_sig <= '0';
					
					If (Score_temp1="101001") then --------------------------------AN EINAI 41 EINAI EPARKES SCORE GIA NIKH
						Winner <= "01";
						state <= Done_st;
					else
						If (Confirm='1')then
							x_temp<=unsigned(X_cursor);
							y_temp<=unsigned(Y_cursor);
							
							state<=P1_Wait_st;
						else
						   x_temp<=x_temp;
							y_temp<=y_temp;
							state<=P1_Idle_st;
						end if;
					end if;
					
				When P1_Wait_st =>
					x_temp<=x_temp;
					y_temp<=y_temp;
					state<=P1_Data_st;
					
				When P1_Data_st=>
					If (Data_in(4)='1') then-------------einai hdh explored
						state<=P1_Idle_st;
					else -------------------------------unexplored kanto explored					
							
						Last_hit_P1<=X_cursor&Y_cursor;

						If (Data_in(3 downto 0)="1111") then-----einai bomb dwse score+1
							set_temp<='1';
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<="1110"; ---red bomb
							Score_temp1<=Score_temp1+1;
							
							state<=P1_Idle_st;
							
						elsif(Data_in(3 downto 0)="0000") then-------------------------keno tetragwno TO BE CONTINUED
							----------------------------
						--- EDW GRAFOUME TO EXPAND ---
							----------------------------	
							set_temp<='1';
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<=Data_in(3 downto 0);
							state<=P1_Expand_Idle_st;
						else
							set_temp<='1';----------------------------------noumero
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<=Data_in(3 downto 0);
							
							state<=P2_Idle_st;
						end if;
					end if;
					
					
					
					
					
				When P2_Idle_st=>------------------------P2
					set_temp<='0';
					Who_sig <= '1';
					
					If (Score_temp2="101001") then --------------------------------AN EINAI 41 EINAI EPARKES SCORE GIA NIKH
						Winner <= "10";
						state <= Done_st;
					else
						If (Confirm='1')then
							x_temp<=unsigned(X_cursor);
							y_temp<=unsigned(Y_cursor);
							
							state<=P2_Wait_st;
						else
						   x_temp<=x_temp;
							y_temp<=y_temp;
							state<=P2_Idle_st;
						end if;
					end if;
					
				When P2_Wait_st =>
					x_temp<=x_temp;
					y_temp<=y_temp;
					state<=P2_Data_st;
					
				When P2_Data_st=>
					If (Data_in(4)='1') then-------------einai hdh explored
						state<=P2_Idle_st;
					else -------------------------------unexplored kanto explored
							
						Last_hit_P2<=X_cursor&Y_cursor;
						
						If (Data_in(3 downto 0)="1111") then-----einai bomb dwse score+1
							set_temp<='1';
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<=Data_in(3 downto 0);----blue bomb
							Score_temp2<=Score_temp2+1;
							
							state<=P2_Idle_st;
						
						elsif(Data_in(3 downto 0)="0000") then-------------------------keno tetragwno TO BE CONTINUED
							----------------------------
						--- EDW GRAFOUME TO EXPAND ---
							----------------------------	
							set_temp<='1';
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<=Data_in(3 downto 0);
							state<=P2_Expand_Idle_st;
						else
							set_temp<='1';
							x_temp<=x_temp;
							y_temp<=y_temp;
							Data_out_temp<=Data_in(3 downto 0);
							
							state<=P1_Idle_st;
						end if;
					end if;	
						
				When Done_st =>
				 Done<='1';
				 set_temp<='0';
				 state<=Done_st;
				 
				When P1_Expand_Idle_st =>
				
					set_temp<='0';
					
					state<=P1_Scan_st1;
					
				When P1_Scan_st1=>
				 ---- SARWSH No.1 y+1
				 x_temp<=x_temp; 
				 y_temp<=y_temp+1;
				 
				 state<=P1_Scan_st2;
				 
				When P1_Scan_st2=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st3;
				 
				When P1_Scan_st3=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st4;
				 
				When P1_Scan_st4 =>
				 ---- SARWSH No.2 x+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp+1;
				 y_temp<=y_temp;
				 
				 state<=P1_Scan_st5;
				 
				When P1_Scan_st5=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st6;
				 
				When P1_Scan_st6=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st7;
				 
				When P1_Scan_st7 =>
				 ---- SARWSH No.3 y-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 state<=P1_Scan_st8;
				 
				When P1_Scan_st8=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st9;
				 
				When P1_Scan_st9=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st10;
				 
				When P1_Scan_st10 =>
				 ---- SARWSH No.4 y-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 state<=P1_Scan_st11;
				 
				When P1_Scan_st11=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st12; 
				 
				When P1_Scan_st12=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st13;
				 
				When P1_Scan_st13 =>
				 ---- SARWSH No.5 x-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 state<=P1_Scan_st14;
				 
				When P1_Scan_st14=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st15; 
				 
				When P1_Scan_st15=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st16;
				 
				 When P1_Scan_st16 =>
				 ---- SARWSH No.6 x-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 state<=P1_Scan_st17;
				 
				When P1_Scan_st17=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st18; 
				 
				When P1_Scan_st18=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st19;
				 
				 When P1_Scan_st19 =>
				 ---- SARWSH No.7 y+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 state<=P1_Scan_st20;
				 
				When P1_Scan_st20=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st21; 
				 
				When P1_Scan_st21=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st22;
				 
				When P1_Scan_st22 =>
				 ---- SARWSH No.8 y+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 state<=P1_Scan_st23;
				 
				When P1_Scan_st23=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P1_Scan_st24; 
				 
				When P1_Scan_st24=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P1_Scan_st25;
				 
				When P1_Scan_st25=>
					set_temp <= '0';
					Push <= '0';
					Enable <= "0";
					
					state <= P1_PopAndCheck_st1;
				
				When P1_PopAndCheck_st1 =>
					Pop <= '1';
					
					state <= P1_PopAndCheck_st2;
					
				When P1_PopAndCheck_st2 =>
					Pop <= '0';
					
					state <= P1_PopAndCheck_st3;
					
				When P1_PopAndCheck_st3 =>
					Pop <= '0';
					
					state <= P1_PopAndCheck_st4;
					
				When P1_PopAndCheck_st4 =>
					Pop <= '0';
					
					If (Empty = '1') then
						state <= P2_Idle_st;
					else
						state <= P1_NewScan_st;
					end if;
					
				--When P1_NewScan_st =>
					--state <= P1_NewScan_st2;
					
				When P1_NewScan_st =>
					x_temp <= unsigned(StackData(9 downto 5));
					y_temp <= unsigned(StackData(4 downto 0));
						
					state <= P1_Expand_Idle_st;
				 
				When P2_Expand_Idle_st =>
				
					set_temp<='0';
					x_temp<=x_temp;
					y_temp<=y_temp;
					
					state<=P2_Scan_st1;
					
				When P2_Scan_st1=>
				 ---- SARWSH No.1 y+1
				 x_temp<=x_temp; 
				 y_temp<=y_temp+1;
				 
				 state<=P2_Scan_st2;
				 
				When P2_Scan_st2=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st3;
				 
				When P2_Scan_st3=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st4;
				 
				When P2_Scan_st4 =>
				 ---- SARWSH No.2 x+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp+1;
				 y_temp<=y_temp;
				 
				 state<=P2_Scan_st5;
				 
				When P2_Scan_st5=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st6;
				 
				When P2_Scan_st6=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st7;
				 
				When P2_Scan_st7 =>
				 ---- SARWSH No.3 y-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 state<=P2_Scan_st8;
				 
				When P2_Scan_st8=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st9;
				 
				When P2_Scan_st9=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st10;
				 
				When P2_Scan_st10 =>
				 ---- SARWSH No.4 y-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp-1;
				 
				 state<=P2_Scan_st11;
				 
				When P2_Scan_st11=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st12; 
				 
				When P2_Scan_st12=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st13;
				 
				When P2_Scan_st13 =>
				 ---- SARWSH No.5 x-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 state<=P2_Scan_st14;
				 
				When P2_Scan_st14=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st15; 
				 
				When P2_Scan_st15=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st16;
				 
				 When P2_Scan_st16 =>
				 ---- SARWSH No.6 x-1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp-1;
				 y_temp<=y_temp;
				 
				 state<=P2_Scan_st17;
				 
				When P2_Scan_st17=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st18; 
				 
				When P2_Scan_st18=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st19;
				 
				 When P2_Scan_st19 =>
				 ---- SARWSH No.7 y+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 state<=P2_Scan_st20;
				 
				When P2_Scan_st20=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st21; 
				 
				When P2_Scan_st21=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st22;
				 
				When P2_Scan_st22 =>
				 ---- SARWSH No.8 y+1
				 Push <= '0';
				 Enable <= "0";
				 set_temp<='0';
				 x_temp<=x_temp;
				 y_temp<=y_temp+1;
				 
				 state<=P2_Scan_st23;
				 
				When P2_Scan_st23=>
				
				 x_temp <= x_temp;
				 y_temp <= y_temp;
				 
				 state<= P2_Scan_st24; 
				 
				When P2_Scan_st24=>
				 
				 If (Data_in="00000") then
						
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
						Push <= '1';
						Enable <= "1";
				 elsif (Data_in="11011") then
						set_temp <='0';
				 else
						set_temp <= '1';
						x_temp <= x_temp;
						y_temp <= y_temp;
						Data_out_temp <= Data_in(3 downto 0);
				 end if;
				 
				 state<= P2_Scan_st25;
				 
				When P2_Scan_st25=>
					set_temp <= '0';
					Push <= '0';
					Enable <= "0";
					
					state <= P2_PopAndCheck_st1;
				
				When P2_PopAndCheck_st1 =>
					Pop <= '1';
					
					state <= P2_PopAndCheck_st2;
					
				When P2_PopAndCheck_st2 =>
					Pop <= '0';
					
					state <= P2_PopAndCheck_st3;
					
				When P2_PopAndCheck_st3 =>
					Pop <= '0';
					
					state <= P2_PopAndCheck_st4;
					
				When P2_PopAndCheck_st4 =>
					Pop <= '0';
					
					If (Empty = '1') then
						state <= P1_Idle_st;
					else
						state <= P2_NewScan_st;
					end if;
						
				When P2_NewScan_st =>
					x_temp <= unsigned(StackData(9 downto 5));
					y_temp <= unsigned(StackData(4 downto 0));
					
					state <= P2_Expand_Idle_st;
				
				when others=>NULL;
			end case;
	end if;
	
end process;
-----------------------------
Score<=STD_LOGIC_VECTOR (Score_temp1) & STD_LOGIC_VECTOR (Score_temp2);

Request_set<=set_temp;

Data_out<='1'&Data_out_temp;

X_out <=STD_LOGIC_VECTOR(x_temp);
Y_out <=STD_LOGIC_VECTOR(y_temp);
Who <= Who_sig;
EmptyCoords <= STD_LOGIC_VECTOR(x_temp)&STD_LOGIC_VECTOR(y_temp);

Stack_p: Stack PORT MAP(
		Clk => Clk,
		Reset => Reset,
		Data_in => EmptyCoords,
		Enable => Enable,
		Push => Push,
		Pop => Pop,
		Empty => Empty,
		Full => Full,
		Data_out => StackData
	);


end Behavioral;

