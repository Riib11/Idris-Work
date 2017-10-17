import Logic2

{-

Problem 2:

(A \/ B) /\ C
----------------------
(A /\ C) \/ (B /\ C)

-}

problem2 : ((a # b) & c) -> ((a & c) # (b & c))
problem2 (xoy & z) = case xoy of
    Left x => Left (x & z)
    Right y => Right (y & z)

{-

Problem 3:

¬(A ↔ B)
-----------
¬(B ↔ A)

-}

problem3 : (¬((a -> b) & (b -> a))) -> (¬((b -> a) & (a -> b)))
problem3 = ?pf