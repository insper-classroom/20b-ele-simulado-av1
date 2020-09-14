------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 1
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q2 is
  port (
	X,Y,Z : in  STD_LOGIC;
	A : out STD_LOGIC	);
end entity;

architecture  rtl OF q2 IS

begin

  A <= (not ((x and y) or y)) or (not (z and x and y));

end architecture;
