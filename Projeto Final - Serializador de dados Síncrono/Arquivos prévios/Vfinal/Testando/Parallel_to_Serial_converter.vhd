library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Parallel_to_Serial_converter is
	port
	(
		-- Input ports
		ascii_in	: character;
		sel_parity: in std_logic;
		baudrate, rst: in std_logic;
		
		-- Output ports
	
		tx_out	, tx_led: out std_logic;
		parity_led: out std_logic
	);
end Parallel_to_Serial_converter;
architecture teste of Parallel_to_Serial_converter is

	signal temp: std_logic_vector (10 downto 0);
	signal aux: std_logic_vector(7 downto 0);
	signal parity_aux: std_logic;
	signal counter: integer range 0 to 15;
		
begin
		
	aux <= std_logic_vector(to_unsigned(natural(character'pos(ascii_in)), 8));
	temp(0) <= '0';
	temp(10) <= '1';
	temp(9) <= '1';
	temp(7 downto 1) <= aux(6 downto 0); 
	
	parity_aux <= (temp(7) xor temp(6)) xor (temp(5) xor temp(4)) xor (temp(3) xor temp(2)) xor temp(1);
		
	temp(8) <= 
		'0' when sel_parity = '0' AND parity_aux = '0' else
		'0' when sel_parity = '1' AND parity_aux = '1' else
		'1';
		
	parity_led <=
		'1' when sel_parity = '1' else
		'0';
	
	PROCESS (baudrate, rst) IS
		variable i: integer range 0 to 11 := 0;
		variable j: integer range 0 to 3:= 0;
	BEGIN
	
		if(rst = '1') then
			tx_out <= '1';
			i := 0;
			j:= 0;
		elsif(rising_edge(baudrate)) then
			if(j < 4) then
				tx_out <= temp(i);
				tx_led <= temp(i);
				i := i + 1;
				
			else 
				tx_out <= '1';
				i:= i;
			end if;
		if(i /= 11) then
			i := i;
			if(j = 3) then
				j := 0;
			else
				j := j;
			end if;
			j := j+1;
		else
			i := 0;		
		end if;
		end if;
		
		
	END PROCESS;
		
end architecture;