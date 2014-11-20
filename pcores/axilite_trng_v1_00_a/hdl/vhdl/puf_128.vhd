library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity puf_128 is
	Generic ( PUF_SIZE : integer := 128 );
   Port ( 	
		i_clk  : in  STD_LOGIC;
		o_out : out  STD_LOGIC_VECTOR(PUF_SIZE - 1 downto 0)
	);
end puf_128;

architecture Behavioral of puf_128 is
	component puf
		Port(
			clk : in  STD_LOGIC;
			out1 : out  STD_LOGIC;
			shift_in : in STD_LOGIC
		);
	end component;
	
	signal puf_output : std_logic_vector(PUF_SIZE  - 1 - 64 -8 downto 0);
	signal puf_shift_in : std_logic_vector(PUF_SIZE - 1 - 64 -8 downto 0);

begin

   --o_out(PUF_SIZE - 1 downto 0) <= puf_output(PUF_SIZE - 1 downto 0);
	
	-- Zeros for now, we may need to reconfigure this
	puf_shift_in(PUF_SIZE - 1 - 64 -8 downto 0) <= (others => '0');

	GEN_PUF: for i in 0 to PUF_SIZE - 1 - 64 -8  generate
	begin
			PUF_BIT_x : component puf 
			port map (
				clk => i_clk,
				out1 => puf_output(i),
				shift_in => puf_shift_in(0)
			);
	end generate GEN_PUF;

	o_out(PUF_SIZE - 1 downto 0) <= X"00000000000001B8"&X"80"&puf_output(PUF_SIZE  - 1 - 64 -8 downto 0);

	--test vector which is just 0x20 (space)
	--o_out <= "00000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000100000";
end Behavioral;
