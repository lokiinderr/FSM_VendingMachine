library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity finitestate_vendingmachine is
    port(
        clk            : in std_logic;
        reset          : in std_logic;
        ItemNumber     : inout integer;
        moneyin        : inout integer;
        carttotal      : inout integer; 
        moneyout       : inout integer;
        deliveryStatus : out std_logic);
end finitestate_vendingmachine;

architecture rtl of finitestate_vendingmachine is

    --STATE DECLARATION
    type Stages is (ItemSelect, CartValue, MoneyInput, FinalStatus);

    signal nextState : Stages;

begin
    
    process(clk, reset, carttotal, moneyout, ItemNumber, moneyin) is
    
    --signal temp : std_logic;
    
    begin
        --if rising_edge(clk) then
            if (reset = '1') then
                nextState <= ItemSelect;
                carttotal <= 0;
                moneyout <= 0;
                deliveryStatus <= 'U';
                moneyin <= 0;
                ItemNumber <= 0;
            
                
            else
                --nextState <= ItemSelect;
                
                case nextState is
                    
                    -- HERE USER PROVIDE INPUT FOR THE ITEM TO BE SELECTED
                    when ItemSelect =>
                        if (ItemNumber = 1) then
                            nextState <= CartValue;
                        elsif (ItemNumber = 2) then
                            nextState <= CartValue;
                        elsif (ItemNumber = 3) then
                            nextState <= CartValue;
                        else 
                            nextState <= ItemSelect;
                        end if;
                        
                    when CartValue =>
                        if (ItemNumber = 1) then
                            carttotal <= 10;
                            nextState <= MoneyInput;
                        elsif (ItemNumber = 2) then
                            carttotal <= 20;
                            nextState <= MoneyInput;
                        elsif (ItemNumber = 3) then
                            carttotal <= 30;
                            nextState <= MoneyInput;
                        else 
                            nextState <= ItemSelect;
                        end if; 
                        

                    when MoneyInput =>
                        -- if money input is valid
                        if (moneyin - carttotal > 0 and moneyin > 0) then
                            moneyout <= moneyin - carttotal;
                            nextState <= FinalStatus;
                        elsif (moneyin - carttotal = 0 and moneyin > 0) then
                            moneyout <= 0;
                            nextState <= FinalStatus;
                        elsif (moneyin < carttotal and moneyin > 0) then
                            moneyout <= moneyin;
                            deliveryStatus <= '0';
                            nextState <= MoneyInput;
                        end if;
                    
--                    when MoneyOutput =>
--                        if (moneyin - carttotal > 0) then
--                            moneyout <= moneyin - carttotal;
--                            nextState <= FinalStatus;
--                        elsif (moneyin - carttotal = 0) then
--                            moneyout <= 0;
--                            nextState <= FinalStatus;
--                        else
--                            moneyout <= moneyin;
--                            nextState <= FinalStatus;
--                        end if;
                       
                       

                    when FinalStatus =>

                        if (moneyout = moneyin and moneyout > 0) then
                            deliveryStatus <= '0';
                           
                        elsif (moneyout < 0) then
                            deliveryStatus <= '0';
                            
                        else 
                            deliveryStatus <= '1';
                            
                        end if;
                        
                end case;
            end if;
        --end if;
    end process;
end rtl;