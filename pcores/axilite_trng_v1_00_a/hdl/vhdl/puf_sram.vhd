--source code automatically generated.
--Aaron Mills
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
entity puf_sram is
	port(
 rst: in std_logic;
 clk: in std_logic;
 en: in std_logic;
 Q1: out std_logic;
 Q2: out std_logic
 
		);
end puf_sram;

architecture Behavioral of puf_sram is
 signal i1: std_logic;
 signal i2: std_logic;
 signal t1: std_logic;
 signal t2: std_logic;
 signal rstin: std_logic;
 attribute keep: string;
-- attribute keep of i1: signal is "TRUE";
-- attribute keep of i2: signal is "TRUE";
 attribute rloc: string;
 attribute lock_pins: string;
 attribute lock_pins of lut_inst1 : label is "all";
 attribute lock_pins of lut_inst2 : label is "all";
 
begin

--begin dynamically generated portion
--variant 1-1-1-3-0-1
lut_inst1 : LUT6
generic map(
INIT => X"ff33ff33ff33ff33")
port map (
O => i2,
	I0 => '0',
	I1 => i1,
	I2 => '0',
	I3 => rstin,
	I4 => '0',
	I5 => '0'
);

lut_inst2 : LUT6
generic map(
INIT => X"dddddddddddddddd")
port map (
O => i1,
	I0 => i2,
	I1 => rstin,
	I2 => '0',
	I3 => '0',
	I4 => '0',
	I5 => '0'
);

--end dynamically generated portion
RST_DFF : FDCE
generic map (
INIT => '0') -- Initial value of register (must be '0' for Spartan6)
port map (
Q => rstin, -- Data output
C => clk, -- Clock input
CE => en, -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => rst -- Data input
);
--Q1<=i1;
--Q2<=i2;

Q1_DFF : FDCE
generic map (
INIT => '0') -- Initial value of register (must be '0' for Spartan6)
port map (
Q => Q1, -- Data output
C => clk, -- Clock input
CE => en, -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => i1 -- Data input
);


Q2_DFF : FDCE
generic map (
INIT => '0') -- Initial value of register (must be '0' for Spartan6)
port map (
Q => Q2, -- Data output
C => clk, -- Clock input
CE => en, -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => i2 -- Data input
);


end Behavioral;
