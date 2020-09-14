library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_q1 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_q1 is

component q1 is  port (
  X,Y,Z : in  STD_LOGIC;
	    A : out STD_LOGIC);
end component;

signal X,Y,Z,A : std_logic;

begin

  u1 : q1 port map(X,Y,Z,A);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    X<= '0'; Y<= '0'; Z <='0';
    wait for 200 ps;
    assert(A = '1')  report "Falha em teste: 1" severity error;

    X<= '1'; Y<= '0'; Z<='0';
    wait for 200 ps;
    assert(A = '1')  report "Falha em teste: 1" severity error;

    X<= '1'; Y<= '1'; Z<='1';
    wait for 200 ps;
    assert(A = '0')  report "Falha em teste: 1" severity error;

    X<= '0'; Y<= '1'; Z<='1';
    wait for 200 ps;
    assert(A = '1')  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
