library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is 
Port(
	clk : in std_logic;
	rgb : out std_logic_vector(2 downto 0);
	h_sync,v_sync : out std_logic
	);
end top;

architecture Behavioral of top is

signal c0 : std_logic;
signal c1 : std_logic;
signal instruction : std_logic_vector(60 downto 0);
signal instruction_signal : std_Logic;
signal ready : std_logic;
signal out_a : std_logic_vector(0 downto 0);
signal in_b : std_logic_vector(0 downto 0);
signal address_a : integer;
signal we_a : std_logic;
signal in_a : std_logic_vector(0 downto 0);
signal address_b : integer;
signal we_b : std_Logic:='0';
signal out_b : std_Logic_vector(0 downto 0);



begin

pll_inst : entity work.pll PORT MAP (
		inclk0	 => clk,
		c0	 => c0,
		c1	 => c1
	);
controller_map : entity work.controller port map(
	instruction_signal => instruction_signal,
	instruction => instruction
	);
graphics_map : entity work.graphics port map(
	instruction_signal => instruction_signal,
	stored_data => out_a,
	instruction => instruction,
	address => address_a,
	data => in_a,
	we => we_a,
	ready => ready,
	clk => c0
	);
ram_map : entity work.RAM port map(
	clk_a => c0,
	we_a => we_a,
	in_a => in_a,
	address_a => address_a,
	out_a => out_a,
	clk_b => c0,
	we_b => we_b,
	in_b => in_b,
	address_b => address_b,
	out_b => out_b
	);
module_map : entity work.module port map(
	clk => c0,
	h_sync => h_sync,
	v_sync => v_sync,
	rgb => rgb,
	color => out_b,
	address => address_b
	);
	

end Behavioral;

