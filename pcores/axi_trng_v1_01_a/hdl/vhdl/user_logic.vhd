------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          user_logic.vhd
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Sun Nov 23 23:46:21 2014 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;

-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_SLV_AWIDTH                 -- Slave interface address bus width
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--   C_NUM_MEM                    -- Number of memory spaces
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Resetn                -- Bus to IP reset
--   Bus2IP_Addr                  -- Bus to IP address bus
--   Bus2IP_CS                    -- Bus to IP chip select for user logic memory selection
--   Bus2IP_RNW                   -- Bus to IP read/not write
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   Bus2IP_Burst                 -- Bus to IP burst-mode qualifier
--   Bus2IP_BurstLength           -- Bus to IP burst length
--   Bus2IP_RdReq                 -- Bus to IP read request
--   Bus2IP_WrReq                 -- Bus to IP write request
--   Type_of_xfer                 -- Transfer Type
--   IP2Bus_AddrAck               -- IP to Bus address acknowledgement
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
    -- ADD USER GENERICS ABOVE THIS LINE ---------------
	 DATA_WIDTH: integer := 512;
    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_SLV_AWIDTH                   : integer              := 32;
    C_SLV_DWIDTH                   : integer              := 32;
    C_NUM_MEM                      : integer              := 1
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    --USER ports added here
    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Resetn                  : in  std_logic;
    Bus2IP_Addr                    : in  std_logic_vector(C_SLV_AWIDTH-1 downto 0);
    Bus2IP_CS                      : in  std_logic_vector(C_NUM_MEM-1 downto 0);
    Bus2IP_RNW                     : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    Bus2IP_BE                      : in  std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
    Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
    Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
    Bus2IP_Burst                   : in  std_logic;
    Bus2IP_BurstLength             : in  std_logic_vector(7 downto 0);
    Bus2IP_RdReq                   : in  std_logic;
    Bus2IP_WrReq                   : in  std_logic;
    Type_of_xfer                   : in  std_logic;
    IP2Bus_AddrAck                 : out std_logic;
    IP2Bus_Data                    : out std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    IP2Bus_RdAck                   : out std_logic;
    IP2Bus_WrAck                   : out std_logic;
    IP2Bus_Error                   : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Resetn : signal is "RST";

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic

  ------------------------------------------
  -- Signals for user logic memory space example
  ------------------------------------------
--  type BYTE_RAM_TYPE is array (0 to 255) of std_logic_vector(7 downto 0);
  type BYTE_RAM_TYPE is array (0 to 1) of std_logic_vector(7 downto 0);
  type DO_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal mem_data_out                   : DO_TYPE;
  signal mem_address                    : std_logic_vector(7 downto 0);
  signal mem_select                     : std_logic_vector(0 to 0);
  signal mem_read_enable                : std_logic;
  signal mem_ip2bus_data                : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal mem_read_ack_dly1              : std_logic;
  signal mem_read_ack_dly2              : std_logic;
  signal mem_read_ack                   : std_logic;
  signal mem_write_ack                  : std_logic;


type statetype is (init,done,wait_for_hash, read_out_hash, loadhash, hash_complete);
	signal state: statetype := init;

	signal i_rst: std_logic;
	signal puf_rst: std_logic;
	signal s_index : integer :=0;
	signal s_rdy: std_logic;
	signal s_hash_out_l: std_logic_vector(31 downto 0);
	signal s_hash_out_h: std_logic_vector(31 downto 0);
	signal s_dummy1: std_logic_vector(31 downto 0);
	signal s_dummy2: std_logic_vector(31 downto 0);

	signal s_puf_data: std_logic_vector(DATA_WIDTH-1 downto 0);	
	signal s_puf_data1: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal s_puf_data2: std_logic_vector(DATA_WIDTH-1 downto 0);

   signal s_puf_ctl                : std_logic_vector(C_SLV_DWIDTH-1 downto 0);


     signal read_address  : std_logic_vector(7 downto 0);

	component puf_128 
		Generic ( PUF_SIZE : integer := 128 );
		Port ( 	
			i_rst  : in  STD_LOGIC;
			i_clk  : in  STD_LOGIC;
			o_out1 : out  STD_LOGIC_VECTOR(PUF_SIZE - 1 downto 0);
			o_out2 : out  STD_LOGIC_VECTOR(PUF_SIZE - 1 downto 0)

		);
	end component;

component Md5Core
	Port(
		clk : in STD_LOGIC; 
		rst : in STD_LOGIC; 
		wb : in STD_LOGIC_VECTOR(511 downto 0); 		
		a64 : out STD_LOGIC_VECTOR(31 downto 0);
		b64 : out STD_LOGIC_VECTOR(31 downto 0);
		c64 : out STD_LOGIC_VECTOR(31 downto 0); 
		d64 : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;



begin

  --USER logic implementation added here

  ------------------------------------------
  -- Example code to access user logic memory region
  -- 
  -- Note:
  -- The example code presented here is to show you one way of using
  -- the user logic memory space features. The Bus2IP_Addr, Bus2IP_CS,
  -- and Bus2IP_RNW IPIC signals are dedicated to these user logic
  -- memory spaces. Each user logic memory space has its own address
  -- range and is allocated one bit on the Bus2IP_CS signal to indicated
  -- selection of that memory space. Typically these user logic memory
  -- spaces are used to implement memory controller type cores, but it
  -- can also be used in cores that need to access additional address space
  -- (non C_BASEADDR based), s.t. bridges. This code snippet infers
  -- 1 256x64-bit (byte accessible) single-port Block RAM by XST.
  ------------------------------------------
  mem_select      <= Bus2IP_CS;
  mem_read_enable <= ( Bus2IP_RdCE(0) );
  mem_read_ack    <= mem_read_ack_dly1 and (not mem_read_ack_dly2);
  
  puf_rst <= mem_read_ack;
  
  mem_write_ack   <= ( Bus2IP_WrCE(0) );
  --mem_address     <= Bus2IP_Addr(9 downto 2);
  mem_address     <= Bus2IP_Addr(10 downto 3);
  
  i_rst <= not Bus2IP_Resetn;


  -- this process generates the read acknowledge 1 clock after read enable
  -- is presented to the BRAM block. The BRAM block has a 1 clock delay
  -- from read enable to data out.
  BRAM_RD_ACK_PROC : process( Bus2IP_Clk ) is
  begin

    if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
      if ( Bus2IP_Resetn = '0' ) then
        mem_read_ack_dly1 <= '0';
        mem_read_ack_dly2 <= '0';
      else
        mem_read_ack_dly1 <= mem_read_enable;
        mem_read_ack_dly2 <= mem_read_ack_dly1;
      end if;
    end if;

  end process BRAM_RD_ACK_PROC;

  -- implement Block RAM(s)
--  BRAM_GEN : for i in 0 to C_NUM_MEM-1 generate
--    constant NUM_BYTE_LANES : integer := (C_SLV_DWIDTH+7)/8;
--  begin
--
--    BYTE_BRAM_GEN : for byte_index in 0 to NUM_BYTE_LANES-1 generate
--      signal ram           : BYTE_RAM_TYPE;
--      signal write_enable  : std_logic;
--      signal data_in       : std_logic_vector(7 downto 0);
--      signal data_out      : std_logic_vector(7 downto 0);
--      signal read_address  : std_logic_vector(7 downto 0);
--    begin
--
--      write_enable <= Bus2IP_WrCE(i) and Bus2IP_BE(byte_index);
--
--      data_in <= Bus2IP_Data(byte_index*8+7 downto byte_index*8);
--      BYTE_RAM_PROC : process( Bus2IP_Clk ) is
--      begin
--
--        if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
--          if ( write_enable = '1' ) then
--            ram(CONV_INTEGER(mem_address)) <= data_in;
--          end if;
--          read_address <= mem_address;
--        end if;
--
--      end process BYTE_RAM_PROC;
--
--      data_out <= ram(CONV_INTEGER(read_address));
--      mem_data_out(i)(byte_index*8+7 downto byte_index*8) <= data_out;
--
--    end generate BYTE_BRAM_GEN;
--
--  end generate BRAM_GEN;

--start
      BYTE_RAM_PROC : process( Bus2IP_Clk,s_puf_data,s_puf_ctl,s_hash_out_h,s_hash_out_l ) is
      begin

        if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
        --  if ( write_enable = '1' ) then
        --    ram(CONV_INTEGER(mem_address)) <= data_in;
		  
				case mem_address is
				 when x"08" =>
						for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
						  if (Bus2IP_WrCE(0)='1' and Bus2IP_BE(byte_index) = '1' ) then
							 s_puf_ctl(byte_index*8+7 downto byte_index*8) <= Bus2IP_Data(byte_index*8+7 downto byte_index*8);
						  end if;
						end loop;
				when others => null;
				end case;
		  
		  
          --end if;
			 
          read_address <= mem_address;

			end if;

          case read_address is
					when x"00" => mem_data_out(0) <= s_puf_data(63 downto 0);
					when x"01" => mem_data_out(0) <= s_puf_data(127 downto 64);
					when x"02" => mem_data_out(0) <= s_puf_data(191 downto 128);
					when x"03" => mem_data_out(0) <= s_puf_data(255 downto 192);
					when x"04" => mem_data_out(0) <= s_puf_data(319 downto 256);
					when x"05" => mem_data_out(0) <= s_puf_data(383 downto 320);
					when x"06" => mem_data_out(0) <= s_puf_data(447 downto 384);
					when x"07" => mem_data_out(0) <= s_puf_data(511 downto 448);
					when x"08" => mem_data_out(0) <= s_puf_ctl;
					when x"09" => mem_data_out(0) <= s_hash_out_h & s_hash_out_l;
					when others =>  mem_data_out(0) <= (others => '0');
			end case;


      end process BYTE_RAM_PROC;
--end

  -- implement Block RAM read mux
  MEM_IP2BUS_DATA_PROC : process( mem_data_out, mem_select ) is
  begin

    case mem_select is
      when "1" => mem_ip2bus_data <= mem_data_out(0);
      when others => mem_ip2bus_data <= (others => '0');
    end case;

  end process MEM_IP2BUS_DATA_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data  <= mem_ip2bus_data when mem_read_ack = '1' else
                  (others => '0');

  IP2Bus_AddrAck <= mem_write_ack or (mem_read_enable and mem_read_ack);
  IP2Bus_WrAck <= mem_write_ack;
  IP2Bus_RdAck <= mem_read_ack;
  IP2Bus_Error <= '0';



process(s_puf_ctl,s_puf_data1,s_puf_data2)
begin
	if s_puf_ctl(0) ='1' then
		s_puf_data<=s_puf_data2;
	else
		s_puf_data<=s_puf_data1;
	end if;
end process;

  --internal syncronous logic
  process(i_rst, Bus2IP_Clk)
	begin
		if i_rst = '1' then
			state <= init;
			s_rdy <='0';
			--puf_rst <= '1';
		elsif Bus2IP_Clk = '1' and Bus2IP_Clk'event then
		
			case state is
				when init =>
					s_index <= 0;
					state<=loadhash;				
											
				when loadhash =>
				 	s_index <= s_index+1;
			
					if (s_index >= 65) then
							state <= done;
							s_rdy <= '1';
					end if;					
				when done => --nothing
			--		puf_rst<='0';
				when others=>
					state <= done; --error?
			end case;
		end if;
	end process;



	PUF_ARRAY: puf_128
		generic map( PUF_SIZE => DATA_WIDTH )
		port map(
			i_rst => puf_rst,
			i_clk => Bus2IP_Clk,
			o_out1 => s_puf_data1,
			o_out2 => s_puf_data2
		);



MD5_HASH: Md5Core
	port map(
		clk => Bus2IP_Clk, 
		rst => i_rst,
		wb => s_puf_data,
		a64=> s_hash_out_h,
   	b64=> s_hash_out_l, 
		c64=> s_dummy1, 
		d64=> s_dummy2
	);

end IMP;
