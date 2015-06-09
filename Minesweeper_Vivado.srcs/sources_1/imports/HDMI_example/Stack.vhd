library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity Stack is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (9 downto 0);
           Enable : in  STD_LOGIC_VECTOR(0 DOWNTO 0);
           Push : in  STD_LOGIC;
			  Pop : in  STD_LOGIC;
			  
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (9 downto 0));
end Stack;


architecture Behavioral of Stack is

Component Stack_64x10
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
  );
END Component;


--type mem_type is array (63 downto 0) of std_logic_vector(9 downto 0);
--signal stack_mem : mem_type := (others => (others => '0'));
signal stack_ptr : unsigned (5 downto 0):= "111111";
signal full_s,empty_s : std_logic := '0';
signal enable_s : std_logic_vector(0  downto 0) := "0";
signal Data_in_sig:  std_logic_vector(9  downto 0) := "0000000000";
signal Data_out_sig:  std_logic_vector(9  downto 0) := "0000000000";

---------------------
Type State_type is 
 (Idle,Push_st,Pop_st);
  Signal state: State_type:=(Idle);
----------------------


begin
-------------------------
process
begin 

Wait until Clk'event And Clk='1';
If Reset ='1' then

	--stack_mem<= (others => (others => '0'));
	full_s<='0';
	empty_s<='1';
	enable_s<="0";
	Data_in_sig<="0000000000";---------mhdenizei to prwto stoixeio 
	stack_ptr<="111111";---------------63
	state<=Idle;
	
else
	
	Case state is
		When Idle =>
			Data_out<=Data_out_sig;
			If Push='1' then----------------Push
			
				enable_s<=Enable;-------------prepei na frontisei aytos pou kalei to stack na dwsei enable mazi me to push
				If full_s='0' then
					Data_in_sig<=Data_in;---new data
					
					If stack_ptr="000000" then
						full_s<='1';
						state<=Idle;
					else
						empty_s <= '0';
						state<=Push_st;
					end if;
				else
					Data_in_sig<=Data_in_sig;--same data
					state<=Idle;
				end if;
			else
			
				enable_s<="0";
				if Pop='1' then--------------Pop
					If stack_ptr="111111" then
						if empty_s='0' then 
							empty_s<='1';
							state<=Pop_st;
						else
							state<=Idle;
						end if;
					else
						stack_ptr<=	stack_ptr+1;
						state<=Pop_st;
					end if;
			   else------------------------oute Pop oute Push
					state<=Idle;
				end if;
				
				
			end if;
			
		When Push_st=>
			stack_ptr<=	stack_ptr-1;
			enable_s<="0";
			state<=Idle;
			
		When Pop_st=>
			
			state<=Idle;
			Data_out<=Data_out_sig;
		

		When others=>
			Null;
	end case;
			


end if;

end process;

Empty <= empty_s;
Full <= full_s;

-------------------------
Stack_64x10_p : Stack_64x10 port map(Clk,enable_s,std_logic_vector(stack_ptr),Data_in_sig,Data_out_sig);

end Behavioral;

