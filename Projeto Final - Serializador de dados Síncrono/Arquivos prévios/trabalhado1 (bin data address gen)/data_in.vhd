library ieee;
use ieee.std_logic_1164.all;

entity data_in is

	port
	(
		-- Input ports
		selChar	: in  std_logic_vector(4 downto 0);
		
		-- Output ports
		ssd_out	: out std_logic_vector(0 to 6);
		serial_out	: out std_logic_vector( 6 downto 0)
	);
end data_in;

architecture teste of data_in is
	signal temp1: std_logic_vector(6 downto 0);

begin

	with selChar select
	temp1 <= 
				"0000000" when "00000", --desligado,
				"0110000" when "00001", -- 0,
				"0110001" when "00010", -- 1 ,
				"0110010" when "00011", -- 2
				"0110011" when "00100", -- 3
				"0110100" when "00101", -- 4
				"0110101" when "00110", -- 5
				"0110110" when "00111", -- 6
				"0110111" when "01000", -- 7
				"0111000" when "01001", -- 8
				"0111001" when "01010", -- 9
				"1000000" when "01011", -- A
				"1100010" when "01100", -- b
				"1000011" when "01101", -- C
				"1100100" when "01110", -- d
				"1000101" when "01111", -- E
				"1000110" when "10000", -- F
				"1001000" when "10001", -- H
				"1001001" when "10010", -- I
				"1001010" when "10011", -- J
				"1001100" when "10100", -- L
				"1010000" when "10101", -- P
				"1010101" when "10110", -- U
				"1111111" when others;


	gen: for i in 0 to 6 generate
		ssd_out(6-i) <= temp1(6-i);
	end generate;
				
	serial_out <= temp1;
	
end architecture;