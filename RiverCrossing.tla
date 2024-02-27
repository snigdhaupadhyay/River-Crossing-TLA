---- MODULE RiverCrossing ----

VARIABLES 
  farmer,
  cabbage,
  goat,
  wolf

vars == { farmer, cabbage, goat, wolf }

RiverthisSide == FALSE

RiverCrossSide == TRUE

TypeOK == \A a \in vars : a \in { RiverthisSide, RiverCrossSide }

Final == \A a \in vars : a = RiverCrossSide

Init ==
        /\ farmer = RiverthisSide
        /\ cabbage = RiverthisSide
        /\ goat = RiverthisSide
        /\ wolf = RiverthisSide

MoveAlone==
    /\ farmer' = ~farmer
    /\ UNCHANGED << cabbage, goat,wolf >>

MoveGoat==
    /\ farmer = goat
    /\ farmer' = ~farmer
    /\ goat' = ~goat
    /\ UNCHANGED << cabbage,wolf >>

MoveCabbage==
     /\ farmer = cabbage
    /\ farmer' = ~farmer
    /\ cabbage' = ~cabbage
    /\ UNCHANGED << goat,wolf >>

MoveWolf==
     /\ farmer = wolf
    /\ farmer' = ~farmer
    /\  wolf'= ~wolf
    /\ UNCHANGED << goat,cabbage >>
SafetyCondition ==
        \/ goat = farmer
        \/ goat # wolf /\ goat # cabbage

Next ==
     /\ \/ MoveAlone
        \/ MoveGoat
        \/ MoveCabbage
        \/ MoveWolf
    /\ SafetyCondition'

        

\* Invariant
Unsolved == ~ Final
=============================================================================

