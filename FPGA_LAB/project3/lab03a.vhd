library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab03a is
	port(
		clk: in  std_logic;
		rx:  in  std_logic;
		tx:  out std_logic;
		btn: in  std_logic_vector(1 downto 0)
	);
end lab03a;

architecture arch of lab03a is
	component lab03_gui
		port(
			clk_i:  in  std_logic;
			rx_i:   in  std_logic;
			tx_o:   out std_logic;
			data_o: out std_logic_vector(27 downto 0);
			data_i: in  std_logic_vector(27 downto 0)
		);
	end component;
	component counter
		generic(
			NBITS: natural;-- Counter size
			INITC: natural -- Power-on reset
		);
		port(
			clock_i: in  std_logic; -- Input clock
			reset_i: in  std_logic; -- Asynchronous reset
			load_i:  in  std_logic; -- Synchronous load
			beg_i:   in  std_logic_vector(NBITS-1 downto 0); -- Start count
			inc_i:   in  std_logic_vector(NBITS-1 downto 0); -- Increment
			end_i:   in  std_logic_vector(NBITS-1 downto 0); -- End count
			count_i: in  std_logic_vector(NBITS-1 downto 0); -- Count in
			carry_i: in  std_logic; -- Carry-in for cascading
			count_o: out std_logic_vector(NBITS-1 downto 0); -- Count out
			carry_o: out std_logic  -- Carry-out for cascading
		);
	end component;
begin
	gui: lab03_gui port map(clk_i=>clk,rx_i=>rx,tx_o=>tx,
		data_o=>data_o,data_i=>data_i);
end arch;
