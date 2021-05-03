library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fir_filter_tb is
end entity fir_filter_tb;


architecture test of fir_filter_tb is

  component fir_filter is
	port(clock:	in std_logic;
	     valid:	in std_logic;
	     data :	in std_logic_vector(7 downto 0);
	     data_valid:	out std_logic;
	     data_out:	out std_logic_vector(7 downto 0));

  end component fir_filter;
  
  -- component ports
  signal clock		: std_logic :='0';
  signal valid		: std_logic :='0';
  signal data		: std_logic_vector(7 downto 0);
  signal data_valid	: std_logic;
  signal data_out	: std_logic_vector(7 downto 0);

begin  -- architecture test
  -- component instantiation
  DUT: fir_filter
    port map (
      clock	=> clock,
      valid	=> valid,
      data	=> data,
      data_valid	=> data_valid,
      data_out	=> data_out);

  clock <= not clock after 5 ns;

  main: process  is
  begin  -- process main

    wait for 1 us;
    wait until rising_edge(clock);
    valid <='1';
    data <= "00110111";
    wait until rising_edge(clock);
    valid <= '0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "01111111";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "11111110";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "11110010";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "01011100";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "00000000";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait until rising_edge(clock);
    valid <='1';
    data <= "10100100";
    wait until rising_edge(clock);
    valid <='0';
    wait for 1 us;

    wait;
  end process main;

end architecture test;





