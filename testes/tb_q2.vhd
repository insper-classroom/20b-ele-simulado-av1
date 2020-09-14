library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_q2 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_q2 is

  component q2 is port (
    x    : in  STD_LOGIC_VECTOR(1 downto 0);
    y    : in  STD_LOGIC_VECTOR(1 downto 0);
    xeqy : out STD_LOGIC;
    xlty : out STD_LOGIC);
  end component;

signal X,Y : std_logic_vector(1 downto 0);
signal xeqy,xlty : std_logic;

begin

  u1 : q2 port map(x,y,xeqy,xlty);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    X<= "00"; Y<= "00";
    wait for 200 ps;
    assert(xeqy='1' and xlty = '0')  report "Falha em teste: XeqY" severity error;
    X<= "10"; Y<= "10";
    wait for 200 ps;
    assert(xeqy='1' and xlty = '0')  report "Falha em teste: XeqY" severity error;
    X<= "01"; Y<= "01";
    wait for 200 ps;
    assert(xeqy='1' and xlty = '0')  report "Falha em teste: XeqY" severity error;
    X<= "11"; Y<= "11";
    wait for 200 ps;
    assert(xeqy='1' and xlty = '0')  report "Falha em teste: XeqY" severity error;

    X<= "11"; Y<= "00";
    wait for 200 ps;
    assert(xeqy='0' and xlty = '1')  report "Falha em teste: XltY" severity error;
    X<= "01"; Y<= "00";
    wait for 200 ps;
    assert(xeqy='0' and xlty = '0')  report "Falha em teste: XltY" severity error;
    X<= "00"; Y<= "01";
    wait for 200 ps;
    assert(xeqy='0' and xlty = '1')  report "Falha em teste: XltY" severity error;
    X<= "10"; Y<= "01";
    wait for 200 ps;
    assert(xeqy='0' and xlty = '1')  report "Falha em teste: XltY" severity error;
    X<= "10"; Y<= "00";
    wait for 200 ps;
    assert(xeqy='0' and xlty = '1')  report "Falha em teste: XltY" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
