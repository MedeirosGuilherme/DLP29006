library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity bin_to_ssd is
--generic (N: natural := 4; MAX: natural := 16);


port (count_in : in std_logic_vector(6 downto 0);
ssd_out: out std_logic_vector(0 to 6));


end entity;

architecture ifsc of bin_to_ssd is
begin

process(count_in) is
		variable ssd_t: std_logic_vector(0 to 6);
		begin
			case count_in is
			when "0110000" => ssd_t := "1111110"; --0
			when "0110001" => ssd_t := "0110000"; --1
			when "0110010" => ssd_t := "1101101"; --2
			when "0110011" => ssd_t := "1111001"; --3
			when "0110100" => ssd_t := "0110011"; --4
			when "0110101" => ssd_t := "1011011"; --5
			when "0110110" => ssd_t := "1011111"; --6
			when "0110111" => ssd_t := "1110000"; --7
			when "0111000" => ssd_t := "1111111"; --8
			when "0111001" => ssd_t := "1111011"; --9
			when "1000000" => ssd_t := "1110111"; -- A
			when "1100010" => ssd_t := "0011111"; -- b
			when "1000011" => ssd_t := "1001110"; -- C
			when "1100100" => ssd_t := "0111101"; -- d
			when "1000101" => ssd_t := "1001111"; -- E
			when "1000110" => ssd_t := "1000111"; -- F
			when "1001000" => ssd_t := "0110111"; -- H
			when "1001001" => ssd_t := "0000110"; -- I
			when "1001010" => ssd_t := "0111000"; -- J
			when "1001100" => ssd_t := "0001110"; -- L
			when "1010000" => ssd_t := "1100111"; -- P
			when "1010101" => ssd_t := "0111110";-- U
			when others => ssd_t := "1111111";
			end case;		 
			
			ssd_out <= ssd_t;
			
end process;

end architecture;