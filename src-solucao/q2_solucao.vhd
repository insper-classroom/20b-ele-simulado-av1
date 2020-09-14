library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q2 is
  port (
    x    : in  STD_LOGIC_VECTOR(1 downto 0);
    y    : in  STD_LOGIC_VECTOR(1 downto 0);
    xeqy : out STD_LOGIC;
    xlty : out STD_LOGIC);
end entity;

architecture  rtl OF q2 IS

begin

  -- nota: lembrar que X e Y complemento
  --        de dois!
  --
  --  X   Y  | xeqy xlty
  -----------|-----------
  -- 00  00  |  1   0   : x=  0, y=  0
  -- 00  01  |  0   1   : x=  0, y=  1
  -- 00  10  |  0   0   : x=  0, y= -2
  -- 00  11  |  0   0   : x=  0, y= -1
  -- 01  00  |  0   0   : x=  1, y=  0
  -- 01  01  |  1   0   : x=  1, y=  1
  -- 01  10  |  0   0   : x=  1, y= -2
  -- 01  11  |  0   0   : x=  1, y= -1
  -- 10  00  |  0   1   : x= -2, y=  0
  -- 10  01  |  0   1   : x= -2, y=  1
  -- 10  10  |  1   0   : x= -2, y= -2
  -- 10  11  |  0   1   : x= -2, y= -1
  -- 11  00  |  0   1   : x= -1, y=  0
  -- 11  01  |  0   1   : x= -1, y=  1
  -- 11  10  |  0   0   : x= -1, y= -2
  -- 11  11  |  1   0   : X= -1, Y= -1

  xeqy <= (not(x(1)) and not(x(0)) and (not(y(1))) and (not(y(0))) ) or
          (not(x(1)) and     x(0)  and (not(y(1))) and      y(0)   ) or
          (    x(1)  and not(x(0)) and      y(1)   and (not(y(0))) ) or
          (    x(1)  and     x(0)  and      y(1)  and       y(0)   );

  -- simplifiquei via M.k
  xlty <= (x(1) and x(0) and (not(y(1))) ) or
          (x(1) and not(x(0)) and (not(y(1))) ) or
          (x(1) and not(x(0)) and y(1) and y(0) ) or
          (not(x(1)) and not(x(0)) and (not(y(1))) and y(0) );


end architecture;
