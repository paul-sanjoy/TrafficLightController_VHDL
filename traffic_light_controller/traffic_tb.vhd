-- Author : Sanjoy Paul
------------------------------------------------------------- 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY traffic_tb IS
  END ENTITY;

  ARCHITECTURE behavior OF traffic_tb IS 

  -- Component Declaration
          COMPONENT traffic_behavioral          
			 PORT(
                  clk : in  STD_LOGIC;
						rst : in  STD_LOGIC;
						red : out  STD_LOGIC;
						green : out  STD_LOGIC;
						yellow : out  STD_LOGIC 
						);
          END COMPONENT;

          SIGNAL clk, rst, red, green, yellow :  std_logic := '0' ;
			 
  BEGIN

  -- Component Instantiation
          uut: traffic_behavioral PORT MAP(
                  clk => clk ,
						rst => rst,					
						red => red,
						green => green,
						yellow => yellow
						);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			
			rst <= '0';
			clk <= '0';
			wait for 20 ns;
			clk <= '1';
			wait for 20 ns;
       
     END PROCESS tb;
  --  End Test Bench 

  END;
