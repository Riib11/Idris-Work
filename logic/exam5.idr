import Logic

{-

Problem 2:

    (A \/ B) /\ C
----------------------
 (A /\ C) \/ (B /\ C)

-}

problem2 : And (Or a b) c -> Or (And a c) (And b c)
problem2 (Ai x c) = case x of
    Oil l => Oil (Ai l c)
    Oir r => Oir (Ai r c)

{-



-}