-- Physically Unclonable Function (PUF) bit

-- VHDL for a PUF bit, for use with Xilinx Virtex-5
-- See: "A PUF Design for Secure FPGA-Based Embedded Systems", published in ASP-DAC 2010
-- Originally compiled with version 10.1 of the Xilinx tools

-- Author: Jason Anderson, University of Toronto, 2010


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.vcomponents.all;

entity puf is
    Port ( 	clk : in  STD_LOGIC;
			out1 : out  STD_LOGIC;
			shift_in : in STD_LOGIC);
end puf;

architecture Behavioral of puf is

component CARRY4_mock is
	port(
		d : in std_logic_vector(3 downto 0);
		s : in std_logic_vector(3 downto 0);
		CYINIT : in std_logic;
		CI : in std_logic;
		CO : out std_logic_vector(3 downto 0)
	);
end component;

    signal OUT_INT : STD_LOGIC;
	signal CARRY_OUT : STD_LOGIC_VECTOR(2 downto 0);
	signal CARRY_OUT2 : STD_LOGIC_VECTOR(2 downto 0);
	signal dummy2 : STD_LOGIC_VECTOR(3 downto 0);
	signal dummy3 : STD_LOGIC_VECTOR(3 downto 0);
	signal OUT_INT2 : STD_LOGIC;
	signal O1, O2 : STD_LOGIC;
	signal CARRY_BW : STD_LOGIC; -- the carry signal between 2 4-bit carry chains
	 
	signal shift_in_not : STD_LOGIC := '0';
	
	attribute rloc: string;
	attribute rloc_range : string;
	-- These constraints ensure that the shift registers and carry chains
	-- are located in the correct positions.  (See ASP-DAC paper).
	-- rloc: relative location constraints
	-- Note that these constrain the sub-elements WITHIN a PUF bit.
	-- The PUF bit itself is relocatable anywhere on the device.
	
--RLOC6 -mostly 1s
	attribute rloc of FDCPE_inst: label is "X2Y1";
	attribute rloc of MUXCY_T: label is "X0Y1";
   attribute rloc of SRL16E_inst: label is "X1Y1";
	attribute rloc of MUXCY_B: label is "X0Y0";
	attribute rloc of SRL16E_inst2: label is "X1Y0";
	
--RLOC5  -- mostly 1s
--	attribute rloc of FDCPE_inst: label is "X1Y2";
--	attribute rloc of MUXCY_T: label is "X0Y1";
--   attribute rloc of SRL16E_inst: label is "X1Y1";
--	attribute rloc of MUXCY_B: label is "X0Y0";
--	attribute rloc of SRL16E_inst2: label is "X1Y0";
	
--RLOC4 --does not compile.
--	attribute rloc of FDCPE_inst: label is "X0Y2";
--	attribute rloc of MUXCY_T: label is "X0Y0";
 --  attribute rloc of SRL16E_inst: label is "X0Y1";
--	attribute rloc of MUXCY_B: label is "X1Y0";
--	attribute rloc of SRL16E_inst2: label is "X1Y1";

--RLOC3  -- mostly 1s
--	attribute rloc of FDCPE_inst: label is "X2Y0";
--	attribute rloc of MUXCY_T: label is "X0Y1";
--   attribute rloc of SRL16E_inst: label is "X1Y1";
--	attribute rloc of MUXCY_B: label is "X0Y0";
--	attribute rloc of SRL16E_inst2: label is "X1Y0";
	
--RLOC2 --mostly 1s
--	attribute rloc of FDCPE_inst: label is "X2Y0";
--	attribute rloc of MUXCY_T: label is "X1Y1";
--   attribute rloc of SRL16E_inst: label is "X0Y1";
--	attribute rloc of MUXCY_B: label is "X1Y0";
--	attribute rloc of SRL16E_inst2: label is "X0Y0";

--RLOC1 --mostly 1s
--	attribute rloc of FDCPE_inst: label is "X0Y2";
--	attribute rloc of MUXCY_T: label is "X0Y1";
--   attribute rloc of SRL16E_inst: label is "X1Y1";
--	attribute rloc of MUXCY_B: label is "X0Y0";
--	attribute rloc of SRL16E_inst2: label is "X1Y0";
	 
	--   You can uncomment the lines below to constraint the PUF bit to a particular region on the Virtex-5 110 device	 
	--	 attribute rloc_range of SRL16E_inst: label is "X56Y0:X104Y53"; -- region 4
	--  attribute rloc_range of SRL16E_inst: label is "X56Y54:X104Y106"; -- region 5
	--  attribute rloc_range of SRL16E_inst: label is "X56Y107:X104Y159"; -- region 6
	--  attribute rloc_range of SRL16E_inst: label is "X0Y0:X52Y53"; -- region 1
	--  attribute rloc_range of SRL16E_inst: label is "X0Y54:X52Y106"; -- region 2
	--  attribute rloc_range of SRL16E_inst: label is "X0Y107:X52Y159"; -- region 3

begin
 
		shift_in_not <= not shift_in;
	
		SRL16E_inst : SRL16E -- the "top" shift register instance
		generic map (
		INIT => X"5555")
		port map (
			Q => O1, -- SRL data output
			A0 => '1', -- Select[0] input
			A1 => '1', -- Select[1] input
			A2 => '1', -- Select[2] input
			A3 => '1', -- Select[3] input
			CE => '1', -- Clock enable input
			CLK => CLK, -- Clock input
			D => shift_in -- SRL data input
		);

		SRL16E_inst2 : SRL16E -- the "bottom" shift register instance
		generic map (
		INIT => X"AAAA")
		port map (
			Q => O2, -- SRL data output
			A0 => '1', -- Select[0] input
			A1 => '1', -- Select[1] input
			A2 => '1', -- Select[2] input
			A3 => '1', -- Select[3] input
			CE => '1', -- Clock enable input
			CLK => CLK, -- Clock input
			D => shift_in_not -- SRL data input
		);

      --CARRY4_mock_upper : CARRY4_mock -- the "top" carry chain
		--port map (
		--	CO(3) => OUT_INT,
		--	CO(2 downto 0) => CARRY_OUT, -- 4-bit carry out
		--	CI => CARRY_BW, -- 1-bit carry cascade input
		--	CYINIT => '0', -- 1-bit carry initialization
		--	D => "0000", -- 4-bit carry-MUX data in
		--	S(3) => O1,
		--	S(2) => '1',
		--	S(1) => '1',
		--	S(0) => '1'
		--);
		
      MUXCY_T : MUXCY -- the "top" carry chain
		port map (
			O => OUT_INT,
			CI => CARRY_BW,
			DI => '0',
			S => O1
		);

      --CARRY4_mock_lower : CARRY4_mock -- the "bottom" carry chain
		--port map (
			--CO(3) => CARRY_BW,
			--CO(2 downto 0) => CARRY_OUT2, -- 4-bit carry out
			--CI => '1', -- 1-bit carry cascade input
			--CYINIT => '1', -- 1-bit carry initialization
			--D => "0000", -- 4-bit carry-MUX data in
			--S(3) => '1',
			--S(2) => '1',
			--S(1) => O2,
			--S(0) => '1'
		--);
		
      MUXCY_B : MUXCY -- the "top" carry chain
		port map (
			O => CARRY_BW,
			CI => '1',
			DI => '0',
			S => O2
		);


      -- This FF detects the PULSE on the OUT_INT signal
		FDCPE_inst : FDCPE
		generic map (
			INIT => '0') -- Initial value of register (?0? or ?1?)
		port map (
			Q => OUT_INT2, -- Data output
			C => CLK, -- Clock input
			CE => '0', -- Clock enable input
			CLR => '0', -- Asynchronous clear input
			D => OUT_INT2, -- Data input
			PRE => OUT_INT -- Asynchronous set input
		);

		FDCPE_inst2 : FDCPE
		generic map (
			INIT => '0') -- Initial value of register (?0? or ?1?)
		port map (
			Q => OUT1, -- Data output
			C => clk, -- Clock input
			CE => '1', -- Clock enable input
			CLR => '0', -- Asynchronous clear input
			D => OUT_INT2, -- Data input
			PRE => '0' -- Asynchronous set input
		);

end Behavioral;
