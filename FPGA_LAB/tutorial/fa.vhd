library IEEE;
use IEEE.std_logic_1164.all;

entity fa is
    port(
        x: in std_logic;
        y: in std_logic;
        z: in std_logic;
        c: out std_logic;
        s: out std_logic
    );
end fa;

architecture arch of fa is
begin
    c<=(x and y) or (x and z) or (y and z);
    s<=x xor y xor z;
end arch;
