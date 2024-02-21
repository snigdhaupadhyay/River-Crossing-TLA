---- MODULE RiverCrossing ----

VARIABLES 
  farmer,
  cabbage,
  goat,
  wolf

vars == { farmer, cabbage, goat, wolf }

RiverthisSide == FALSE

RiverCrossSide == TRUE

Init ==
        /\ farmer = RiverthisSide
        /\ cabbage = RiverthisSide
        /\ goat = RiverthisSide
        /\ wolf = RiverthisSide

SafetyCondition ==
        \/ goat = farmer
        \/ goat # wolf /\ goat # cabbage

\* Invariant
Unsolved == ~ Final
