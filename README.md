# FSM_VendingMachine

This is a finite state machine based Vending Machine simulator
It is on VHDL language.
 
Procedure :- 
  Download both the files with .vhd extension, use any vhdl simulator for running the simulation (in my case i used xilinx vivado)
  After running the simulation, force the clock accordingly(period = 2000ns, duty = 50%, run time = 1us)
  IMPORTANT : Once you reset the machine, remember to remove all the force constant from forced signals (In my case i forced two signals ItemNumber and moneyin) by simply clicking   stop force so that machine can be fully reset.
  
For the project demo video you can check this linkedin post
Project Demo Link :- https://www.linkedin.com/posts/lokiinderr_hi-connections-this-is-a-finite-state-machine-activity-6809187492022030336-qF5w
  
---------------------------------------------------------------------------------------------------------------------
Tough to analyise the if else condition and many problems got solved just by putting one condition that if variable in greater than 0.
Used inout instead of only in or out because the signals were initialised or given some values at some places in code and we can't do this without inout.
