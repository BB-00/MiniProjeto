library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_Freeze is
	port(dataIn   : in std_logic_vector(12 downto 0);
			clk      : in std_logic;
			enable   : in std_logic;
			dataOut : out std_logic_vector(12 downto 0));
end Register_Freeze;

architecture Behavioral of Register_Freeze is
	signal S_data : std_logic_vector(12 downto 0);
	signal s_enable : std_logic := '1';
begin
	process(clk, enable, s_enable)
	begin
		if(rising_edge(clk)) then
			if(enable = '1' and s_enable  = '0') then
				s_enable <= '1';
			elsif(enable = '1' and s_enable = '1') then
				s_enable <= '0';
			--if(enable = '1') then
				--s_enable <= not s_enable;
			end if;
			if(s_enable = '1') then
				s_data <= dataIn;
			else
				s_data <= s_data;
			end if;
		end if;
	end process;
	
	dataOut <= s_data;
	
end Behavioral;