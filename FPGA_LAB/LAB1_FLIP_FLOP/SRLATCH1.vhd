library IEEE;
use IEEE.std_logic_1164.all;

entity SRLATCH1 is
	port(
		nS: in  std_logic;
		nR: in  std_logic;
		Q:  out std_logic
	);
end SRLATCH1;

architecture arch of SRLATCH1 is
	signal nq_i: std_logic;
begin
	-- Q<=q_i;

	Q <=(not nq_i) or (not nS);
	nq_i<=(not Q) or (not nR);
end arch;
