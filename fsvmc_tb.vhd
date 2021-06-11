library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsvmc_tb is
end fsvmc_tb;

architecture sim of fsvmc_tb is

    constant clockfz : integer := 1;
    constant clockperiod : time := 1000 ms/clockfz;
    
    signal clk            :  std_logic := '0';
    signal reset          :  std_logic := '0';
    signal ItemNumber     :  integer := 0;
    signal carttotal      :  integer := 0;
    signal moneyin        :  integer := 0;
    signal moneyout       :  integer := 0;
    signal deliveryStatus :  std_logic;

begin

    -- device under test (DUT)
    i_FSMVendingMachine : entity work.finitestate_vendingmachine(rtl)
    port map(
            clk            => clk,
            reset          => reset,
            ItemNumber     => ItemNumber,
            carttotal      => carttotal,
            moneyin        => moneyin,
            moneyout       => moneyout,
            deliveryStatus => deliveryStatus);
            
    -- generating clock
    clk <= not clk after clockperiod/2;


    -- testbench sequence
    process is 
    begin
     
        -- taking DUT out of reset
        reset <= '0';
        
        wait on ItemNumber, reset, moneyin, deliveryStatus;
        
    end process;
end sim;