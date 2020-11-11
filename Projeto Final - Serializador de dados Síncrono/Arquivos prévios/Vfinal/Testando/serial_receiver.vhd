library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serial_receiver is
	port
	(
		-- Input ports
		serial_in: std_logic;
		sel_parity: in std_logic;
		baudrate: in std_logic;
		
		-- Output ports
		parity_led: out std_logic;
		ssd_out: out std_logic_vector(0 to 6)
	);
end serial_receiver;
architecture teste of serial_receiver is

	signal temp: std_logic_vector (10 downto 0);
	signal parity_aux: std_logic;
	signal Parallel_out: std_logic_vector(6 downto 0);
		
begin

	PROCESS (baudrate) IS
		variable i: integer range 0 to 11 := 11;
	BEGIN	
		if(rising_edge(baudrate)) then
			temp(i) <= serial_in;
			i := i -1;
			if(i /= 0) then
				i := i;
			else
				i := 11;
			end if;
		else
			i := i;
		end if;
	END PROCESS;
	
	parity_led <= temp(8);
	parallel_out <= temp(7 downto 1);
	ssd_out <= parallel_out;
				
		
end architecture;