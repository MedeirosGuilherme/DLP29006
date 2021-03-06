library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity address_gen is

	port
	(
		-- Input ports
		next_address : in  std_logic;
		init : in std_logic;
		clk_in, rst: in std_logic;


		-- Output ports
		address_pos	: out std_logic_vector (4 downto 0)
	);
end address_gen;

architecture teste of address_gen is
	signal count: integer range 0 to 31;
begin
	
	process(clk_in, rst) is
	
	begin
	if(rising_edge(clk_in)) then
		if(rst = '1') then
			address_pos <= "00000";
			count <= 0;
		else
		
			if(init = '1') then
			
				if(next_address = '1') then
					count <= count+1; 
				else
					count <= count;
				end if;
				address_pos <= std_logic_vector(to_unsigned(count, 5));

			end if;
		end if;
	end if;
	end process;
	
end architecture;