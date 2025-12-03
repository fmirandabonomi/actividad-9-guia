library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_cpu is
    port (
        clk        : in  std_logic;
        nreset     : in  std_logic;
        z          : in  std_logic;
        op         : in  std_logic_vector (6 downto 0);
        jump       : out std_logic;
        s1pc       : out std_logic;
        wpc        : out std_logic;
        wmem       : out std_logic;
        wreg       : out std_logic;
        sel_imm    : out std_logic;
        data_addr  : out std_logic;
        mem_source : out std_logic;
        winst      : out std_logic;
        alu_mode   : out std_logic_vector (1 downto 0);
        imm_mode   : out std_logic_vector (2 downto 0)
    );
end control_cpu;

architecture arch of control_cpu is

begin

end arch ; -- arch