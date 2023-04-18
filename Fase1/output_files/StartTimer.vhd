library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity StartTimer is 
	port(dataIn  : in  std_logic;
		  dataOut : out std_logic);
end StartTimer;

architecture Behavioral of StartTimer is 
	signal s_dataOut : std_logic;
begin
	process(dataIn)
	begin 
		if (rising_edge(dataIn)) then
			if (s_dataOut = '0') then
				s_dataOut <= '1';
			else
				s_dataOut <= '0';
			end if;
		end if;
	end process;
	dataOut <= s_dataOut;
end Behavioral;