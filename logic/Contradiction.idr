-- examples of proof by contradiction

-- (useful) replace : (x = y) -> P x -> P y

||| Zero has no precessor
disjoint : (n : Nat) -> Z = S n -> Void
{-
    p is a proof that Z = S n
    disjointTy is a predicate that takes (S n) to Void
    
    so then, applying disjoinTy to p will yield Void, since
        will match with (S k)

    () is the result of (S k), so () will be turned into Void
        through the replacement
-}
disjoint n p = replace {P = disjointTy} p ()
  where
    disjointTy : Nat -> Type
    disjointTy Z = ()
    disjointTy (S k) = Void

contra : a -> (a -> Void) -> Void
contra x nx = nx x
-- could just say (nx x) instead of using this function