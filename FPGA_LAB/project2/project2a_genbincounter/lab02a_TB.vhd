library IEEE;
use IEEE.std_logic_1164.all;

entity lab02a_TB is
end lab02a_TB;

architecture arch of lab02a_TB is
	component lab02a
		port(
			clk:  in  std_logic;
			bits: out std_logic_vector(23 downto 0)
		);
	end component;
	signal clk:  std_logic:='0';
	signal bits: std_logic_vector(23 downto 0);
begin

	test: lab02a port map(clk=>clk,bits=>bits);

	process
	begin
		clk<='0';
		wait for 40 ns;
		clk<='1';
		wait for 40 ns;
	end process;
end arch;
