library ieee;
use ieee.std_logic_1164.all;

entity data_in is

	port
	(
		-- Input ports
		selChar	: in  std_logic_vector(4 downto 0);
	
		baud_data : in std_logic;

		rst: in std_logic;
		-- Output ports
		serial_out	: out character;
		ssd_out1, ssd_out2, ssd_out3, ssd_out4: out character		
	);
end data_in;

architecture teste of data_in is
	signal temp: string(1 to 4);

begin

	with selChar select
	temp<= 
				"0000" when "00000", --desligado,
				"bALA" when "00001", -- 0,
				"FEI0" when "00010", -- 1 ,load
				"b0LA" when "00011", -- 2
				"dAd0" when "00100", -- 3
				"PULA" when "00101", -- 4
				"CAIU" when "00110", -- 5
				"1996" when "00111", -- 6
				"1992" when "01000", -- 7
				"LUPA" when "01001", -- 8
				"DLP1" when "01010", -- 9
				"IF5C" when "01011", -- A
				"FACA" when "01100", -- b
				"CA5A" when "01101", -- C
				"1234" when "01110", -- d
				"4321" when "01111", -- E
				"FILA" when "10000", -- F
				"FAd0" when "10001", -- H
				"PIFE" when "10010", -- I
				"LAPA" when "10011", -- JWaveform
				"b0CA" when "10100", -- L
				"LUAU" when "10101", -- P
				"JIPE" when "10110", -- U
				"1111" when others;
		
	PROCESS (baud_data, rst) is
		variable i: integer range 0 to 5 := 1;
		variable j: integer range 0 to 5 := 1;
		variable bauds: integer range 1 to 12 :=1;
	begin

		if(rst ='1') then
				bauds := 1;
				i := 0;
		elsif(rising_edge(baud_data)) then
						
			if(bauds = 1) then
				i := i + 1;
				serial_out <= temp(i);
			else
				bauds := bauds;
			end if;	

				
			if(bauds = 12) then
				bauds := 1;
				j:= j + 1;
				if(j = 5) then
					i := 1;
					j := 1;
				else
					i := i + 1;
				end if;
				serial_out <= temp(i);
				
			else
				bauds := bauds;
			end if;			
		
			if(i = 5) then
				i:= 1;
			else 
				i := i;
			end if;
			bauds := bauds + 1;
		else 
			bauds := bauds;
		end if;	
		
	end process;
	
	ssd_out1 <= temp(4);
	ssd_out2 <= temp(3);
	ssd_out3 <= temp(2);
	ssd_out4 <= temp(1);	
	
end architecture;