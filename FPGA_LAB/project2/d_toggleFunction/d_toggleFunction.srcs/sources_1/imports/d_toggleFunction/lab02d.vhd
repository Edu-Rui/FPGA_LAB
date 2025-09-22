library IEEE;
use IEEE.std_logic_1164.all;

entity lab02d is
	port(
		clk: in  std_logic;
		btn: in  std_logic_vector(1 downto 0);
		led: out std_logic_vector(1 downto 0)
	);
end lab02d;

architecture arch of lab02d is
	component bcounter
		generic(
			NBITS: natural
		);
		port(
			clk:  in  std_logic; -- Clock input
			rst:  in  std_logic; -- Asynchronouse reset
			cin:  in  std_logic; -- Carry-in and run control
			cout: out std_logic; -- Carry-out for cascading
			bits: out std_logic_vector(NBITS-1 downto 0)
		);
	end component;
	signal bits: std_logic_vector(23 downto 0);
	signal btn0_sync1  : std_logic := '0';
    signal btn0_sync2  : std_logic := '0';
    signal btn0_prev   : std_logic := '0';
    signal run_en      : std_logic := '0';
begin
	counter: bcounter generic map(NBITS=>bits'high-bits'low+1)
		port map(clk=>clk,rst=>btn(1),cin=>run_en,cout=>open,bits=>bits);

	led<=bits(bits'high downto bits'high-1);
	
	  process (clk)
  begin
    if rising_edge(clk) then
      -- 2-FF synchronizer for metastability mitigation on btn(0)
      btn0_sync1 <= btn(0);
      btn0_sync2 <= btn0_sync1;

      if btn(1) = '1' then
        -- While reset held: clear run_en and clear edge history
        run_en    <= '0';
        btn0_prev <= '0';
      else
        -- Rising edge detect on synchronized button
        if (btn0_sync2 = '1' and btn0_prev = '0') then
          run_en <= not run_en;  -- toggle start/stop on press
        end if;
        btn0_prev <= btn0_sync2;
      end if;
    end if;
  end process;
end arch;
