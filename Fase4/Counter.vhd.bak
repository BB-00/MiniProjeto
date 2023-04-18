library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter is
	port(clk : in std_logic;
		reset : in std_logic;
		start : in std_logic;
		count : out std_logic_vector(12 downto 0);
		ledOut : out std_logic);
end Counter;

architecture Behavioral of Counter is
	signal s_count : unsigned(12 downto 0) := "1011101101111"; --5999
	signal s_led : std_logic := '0';
	signal s_start : std_logic := '0';
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			s_start <= start;
			if(reset = '1' and s_start = '0')then
				s_count <= "1011101101111";--5999
				s_led <= '0';                                     
				s_start <= '0';
			elsif (s_start ='1') then
				if(s_count = "0000000000000") then
					s_start <= '0';
					s_led <= '1';
				elsif(start = '1') then
					s_start <= '0';
				else
					s_start <= '1';
					s_led <= '0';
					s_count <= s_count - 1;
				end if;
			end if;
		end if;
	end process;
	
	count <= std_logic_vector(s_count);
	ledOut <= std_logic(s_led);

end Behavioral;