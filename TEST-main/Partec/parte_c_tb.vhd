library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parte_c_tb is end parte_c_tb;

architecture comp of parte_c_tb is 
	component Block1 
	port (
		cin :  IN  STD_LOGIC;
		a0 :  IN  STD_LOGIC;
		a1 :  IN  STD_LOGIC;
		a2 :  IN  STD_LOGIC;
		a3 :  IN  STD_LOGIC;
		b0 :  IN  STD_LOGIC;
		b1 :  IN  STD_LOGIC;
		b2 :  IN  STD_LOGIC;
		b3 :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		res0 :  OUT  STD_LOGIC;
		res1 :  OUT  STD_LOGIC;
		res2 :  OUT  STD_LOGIC;
		res3 :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC;
		N :  OUT  STD_LOGIC;
		z :  OUT  STD_LOGIC;
		V :  OUT  STD_LOGIC);
	end component;
	
	--inputs 
	signal a0 : std_logic := '0';
	signal a1 : std_logic := '0';
	signal a2 : std_logic := '0';
	signal a3 : std_logic := '0';
	signal b0 : std_logic := '0';
	signal b1 : std_logic := '0';
	signal b2 : std_logic := '0';
	signal b3 : std_logic := '0';
	signal clk : std_logic := '0';
	signal cin : std_logic := '0';
	--outputs
	signal res0 : std_logic;
	signal res1 : std_logic;
	signal res2 : std_logic;
	signal res3 : std_logic;
	signal cout : std_logic;
	signal N : std_logic;
	signal z : std_logic;
	signal V : std_logic;
	constant clk_period : time := 20ns;
	
BEGIN
	uut : Block1 PORT MAP (
		a0 => a0,
		a1 => a1,
		a2 => a2,
		a3 => a3,
		b0 => b0,
		b1 => b1,
		b2 => b2,
		b3 => b3,
		clk => clk,
		cin => cin,
		res0 => res0,
		res1 => res1,
		res2 => res2,
		res3 => res3,
		N => N,
		z => z,
		V => V );
		
clock_process : process
	begin 
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
end process;

estimulo : process
	begin
		a0 <= '0'; a1 <= '1'; a2 <= '0'; a3 <= '1'; 
		b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
		cin <= '0'; wait for 30ns;
		a0 <= '0'; a1 <= '1'; a2 <= '0'; a3 <= '1'; 
		b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
		cin <= '1'; wait for 30ns;
		a0 <= '0'; a1 <= '0'; a2 <= '1'; a3 <= '1'; 
		b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
		cin <= '0'; wait for 30ns;
		a0 <= '0'; a1 <= '0'; a2 <= '1'; a3 <= '1'; 
		b0 <= '0'; b1 <= '1'; b2 <= '0'; b3 <= '1';
		cin <= '1'; wait for 30ns;
		wait;
end process;
END;