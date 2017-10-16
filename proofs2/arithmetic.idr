fiveIsFive : 5 = 5
fiveIsFive = Refl

onePlusOneIsTwo : 1 + 1 = 2
onePlusOneIsTwo = Refl

-- twoPlusTwoIsFive : 2 + 2 = 5
-- twoPlusTwoIsFive = ?proofTwoPlusTwoIsFive

{-
    ``replace : (x = y) -> P x -> P y ``
    uses an equality proof to transform a predicate

    in this case, the predicate is: ``Z = S n``
    the subject, x, is: ``n``
    and the equality proof is: ``n = disjoinTy n``

    so this turns ``Z = S n`` into ``() = Void`` (for any n)

-}

zerosSucc : Z = S n

disjointTy : Nat -> Type
disjointTy Z = ()
disjointTy (S k) = Void

disjoint : (n:Nat) -> Z = S n -> Void
disjoint n p = replace {P=disjointTy} p ()