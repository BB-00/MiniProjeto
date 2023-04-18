library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity Bin7SegDecoder is
     port(enable  : in std_logic;
			 binInput : in  std_logic_vector(3 downto 0);
			 decOut_n : out std_logic_vector(6 downto 0));
end Bin7SegDecoder; 
 
architecture Behavioral of Bin7SegDecoder is
begin
        decOut_n <= (others => '1') when enable = '0' else
						  "1111001" when (binInput = "0001") else
						  "0100100" when (binINput = "0010") else
		              "0110000" when (binInput = "0011") else
						  "0011001" when (binInput = "0100") else
						  "0010010" when (binInput = "0101") else 
						  "0000010" when (binInput = "0110") else  
						  "1111000" when (binInput = "0111") else  
						  "0000000" when (binInput = "1000") else 
						  "0010000" when (binInput = "1001") else
						  "1000000" when (binInput = "0000");                              
end Behavioral;