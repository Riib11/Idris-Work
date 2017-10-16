{-
Equality is built in as:

data (=) : a -> b -> Type
    Refl : x = x

-}

-- for example:
fiveIsFive : 5 = 5
fiveIsFive = Refl

{-

empty tree:
    There is no need to worry too much about how this function works.
    But essentially, it applies the library function replace,
    which uses an equality proof to transform a predicate.
    Here we use it to transform a value of a type which can exist,
    the empty tuple, to a value of a type which can’t,
    by using a proof of something which can’t exist.

    just to note, void : Void -> a,
    which is for helping with proofs by contradiction

-}
-- proof that Z is never equal to its successor
disjoint : (n:Nat) -> Z = S n -> Void
disjoint n p = replace {P=disjointTy} p ()
    where
        disjointTy : Nat -> Type
        disjointTy Z = ()
        disjointTy (S k) = Void


{- simple theorems: -}

-- proof that plus reduces
plusReduces : (n:Nat) -> plus Z n = n
plusReduces n = Refl

-- cong states that equality respects function application:
-- cong : {f : t -> u} -> a = b -> f a = f b

plusReducesZ : (n:Nat) -> n = plus n Z
plusReducesZ Z = Refl
plusReducesZ (S k) = cong $ plusReducesZ k

plusReducesS : (n:Nat) -> (m:Nat) -> S (plus n m) = plus n (S m)
plusReducesS Z m = Refl
plusReducesS (S k) m = cong $ (plusReducesS k m)