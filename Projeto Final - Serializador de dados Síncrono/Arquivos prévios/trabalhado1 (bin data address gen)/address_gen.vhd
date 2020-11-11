library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity address_gen is

	port
	(
		-- Input ports
		next_address : in  std_logic;
		init	: in  std_logic;

		-- Output ports
		address_pos	: out std_logic_vector (4 downto 0)
	);
end address_gen;

architecture teste of address_gen is
	signal count: integer range 0 to 31;
begin
	
	address_pos <= 
		std_logic_vector(to_unsigned(count, 5)) when init = '1' else
		"00000";
	
	count <=
		count+1 when next_address = '1' else
		count;
	
end architecture;