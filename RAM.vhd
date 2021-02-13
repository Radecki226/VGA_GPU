----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:39 08/14/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--Porty A i B
entity RAM is
Port(
	-----PORTA
	clk_a : in std_logic;
	we_a : in std_logic;
	in_a : in std_logic_vector(0 downto 0);
	address_a : in integer range 0 to 524287;
	out_a : out std_logic_vector(0 downto 0);
	-----PORTB
	clk_b : in std_logic;
	we_b : in std_logic;
	in_b : in std_logic_vector(0 downto 0);
	address_b : in integer range 0 to 524287;
	out_b : out std_logic_vector(0 downto 0));
end RAM;

architecture Behavioral of RAM is

  type ram_type is array (307199 downto 0) of std_logic_vector(0 downto 0);
  shared variable ram: ram_type;

begin

	a : process(clk_a)
	begin
		if rising_edge(clk_a) then
			if we_a = '1' then
				ram(address_a) := in_a;
			end if;
			out_a <= ram(address_a);
		end if;
	end process;
	
	b : process(clk_b)
	begin
		if rising_edge(clk_b) then
			if we_b = '1' then
				ram(address_b) := in_b;
			end if;
			out_b <= ram(address_b);
		end if;
	end process;
	


end Behavioral;

