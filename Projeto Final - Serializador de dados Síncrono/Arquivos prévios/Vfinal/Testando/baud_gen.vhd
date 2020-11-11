library ieee;
use ieee.std_logic_1164.all;

entity baud_gen is

	port
	(
		-- Input ports
		sel_baud	: in std_logic_vector(1 downto 0);
		rst, clk_in : std_logic;

		-- Output ports
		baud_out	: out std_logic;
		baud_led	: out std_logic_vector(3 downto 0) 
	);
end baud_gen;

architecture ifsc of baud_gen is 
signal clk_t : std_logic := '0';
constant B1 : natural :=1604;
constant B2  : natural :=1302;
constant B3  : natural :=651;
constant B4  : natural :=25000000;
signal MAX : natural;
begin

	teste: MAX <= B1
	when sel_baud = "00" else
	B2 when sel_baud = "01" else 
	B3 when sel_baud = "10" else
	B4;

--
--	teste: MAX <= 6
--	when sel_baud = "00" else
--	2 when sel_baud = "01" else 
--	3 when sel_baud = "10" else
--	4;


	teste2: baud_led <= "0001" when sel_baud = "00" else
	"0010" when sel_baud = "01" else
	"0100" when sel_baud = "10" else
	"1000";
		
	process(clk_in, rst, clk_t) is
	variable cnt: integer range 0 to B4;
	
	begin
		if(rst = '1') then
			cnt := 0;
			clk_t <= '1';
		elsif (rising_edge(clk_in)) then
		if (cnt = MAX-1) then
				cnt :=0;
				clk_t <= not clk_t;
			else 
			cnt := cnt + 1;
			end if;
			
		end if;
		baud_out <= clk_t;
	end process;
	
end architecture;

