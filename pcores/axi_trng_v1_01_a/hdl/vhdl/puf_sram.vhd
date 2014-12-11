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
  attribute route: string;
attribute bel: string;

 attribute lock_pins: string;
 attribute lock_pins of lut_inst1 : label is "all";
 attribute lock_pins of lut_inst2 : label is "all";
 
attribute route of rstin: signal is "{3;1;7z020clg484;2527b9e5!-1;161004;230552;S!0;-683;-80!1;-1837;2253!2;1837;1211!2;1433;1947!3;683;-320;L!4;404;-592!6;683;-272;L!}";
attribute route of i2 : signal is "{3;1;7z020clg484;ec9081bc!-1;161004;233664;S!0;-683;64!1;0;376!2;683;-304;L!}";
attribute route of i1: signal is "{3;1;7z020clg484;1812ef66!-1;161004;233872;S!0;-683;-128!1;7139;1647!2;-3905;-2091!3;-3234;564!4;683;-264;L!}";

attribute rloc of RST_DFF : label is "X0Y0";
attribute bel of RST_DFF: label is "BFF";
attribute rloc of lut_inst1 : label is "X0Y0";
attribute bel of lut_inst1 : label is "A6LUT";
attribute rloc of lut_inst2: label is "X0Y0";
attribute bel of lut_inst2 : label is "C6LUT";
attribute rloc of Q2_DFF : label is "X0Y0";
attribute bel of  Q2_DFF: label is "AFF";
attribute rloc of Q1_DFF : label is "X0Y0";
attribute bel of Q1_DFF: label is "CFF";

  
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
