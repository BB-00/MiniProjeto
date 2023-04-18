library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD.all; 
 
entity Bin2BCD is     
	port (bin : in  std_logic_vector(12 downto 0);          
		  dez_seg : out std_logic_vector(3 downto 0);          
		  uni_seg : out std_logic_vector(3 downto 0);
		  dez_cent : out std_logic_vector(3 downto 0);          
		  uni_cent : out std_logic_vector(3 downto 0)); 
end Bin2BCD;

architecture Behavioral of Bin2BCD is
	signal s_bin, s_dez_seg, s_uni_seg, s_dez_cent, s_uni_cent : unsigned(12 downto 0);

begin
	s_bin <= unsigned(bin);
	s_dez_seg <= s_bin/1000;
	s_uni_seg <= (s_bin/100) rem 10;
	
	
	s_dez_cent<= (s_bin/10) rem 10 ;
	s_uni_cent <= S_bin rem 10;
	
	dez_seg <= std_logic_vector(s_dez_seg)(3 downto 0);
	uni_seg <= std_logic_vector(s_uni_seg)(3 downto 0);
	dez_cent <= std_logic_vector(s_dez_cent)(3 downto 0);
	uni_cent <= std_logic_vector(s_uni_cent)(3 downto 0);
	
end Behavioral;