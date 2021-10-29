----------------------------------------------------------------------------------
-- Author : Sanjoy Paul 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity traffic_behavioral is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           green : out  STD_LOGIC;
           red : out  STD_LOGIC;
           yellow : out  STD_LOGIC);
end traffic_behavioral;

architecture Behavioral of traffic_behavioral is

signal count:integer range 0 to 5 := 0;
signal state:integer range 0 to 2 := 0;

begin

	process(clk,rst)
	begin
		if(rst= '1')then
			state <=0;
			red<= '1';
			green <= '0';
			yellow <= '0';
			count <= 0;
		elsif (clk'event and clk ='1') then
			case state is 
			when 0 => --red light
			if(count = 5) then
					count <= 0;
					state <= 1;
			else
					count <= count +1;
					red <= '1';
					green <= '0';
					yellow <= '0';
			end if;
			when 1 =>  --green light
			if(count = 5) then
					count <= 0;
					state <= 2;
			else
					count <= count +1;
					red <= '0';
					green <= '1';
					yellow <= '0';
			end if;
			when 2 => --yellow light
			if(count = 2) then
					count <= 0;
					state <= 0;
			else
					count <= count +1;
					red <= '0';
					green <= '0';
					yellow <= '1';
			end if;
			when others =>
					state <= 0;
					count <= 0;
			end case;
		end if;
			
	end process;
			
end Behavioral;

