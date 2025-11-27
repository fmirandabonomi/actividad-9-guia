library ieee;
use ieee.std_logic_1164.all;

entity crossbar is 
    generic (
        type dsm_t
    );
    port (
        bus_maddr : std_logic_vector(31 downto 0);
        bus_mdms : std_logic_vector (31 downto 0);
        bus_mtwidth : std_logic_vector (2 downto 0);
        bus_mtms : std_logic;
        bus_mdsm : std_logic_vector (31 downto 0);
        bus_saddr : std_logic_vector (31 downto 0);
        bus_sdms : std_logic_vector (31 downto 0);
        bus_stwidth : std_logic_vector (2 downto 0);
        bus_stms : std_logic;
        bus_sdsm : dsm_t;
        bus_sact : std_logic_vector (dsm_t'range);
    );
end entity;

architecture arch of crossbar is
begin
    -- Señales controladas por el maestro
    bus_saddr <= bus_maddr;
    bus_sdms  <= bus_mdms;
    bus_stwidth <= bus_mtwidth;
    bus_stms <= bus_mtms;

    -- Mux
    dsm_mux : process (all)
        variable mux_out : std_logic_vector(31 downto 0);
    begin
        mux_out := 32x"0";
        for i in dsm_t'range loop
            if bus_sact(i) then
                mux_out := mux_out or bus_sdsm(i);
            end if;
        end loop;
        bus_mdsm <= mux_out;
    end process;

end arch ; -- arch