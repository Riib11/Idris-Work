module Induction

{-

-- the following are defined in prelude,
    but are good examples:

data Nat : Type where
    Z : Nat
    S : Nat -> Nat

plus : Nat -> Nat -> Nat
plus  Z    n = n
plus (S k) n = S (plus k n)

-}

-- induction outline
                                                -- given
nat_induction : (P:Nat -> Type) ->              -- the predicate,
                 P Z ->                         -- the base case: 0,
                ((k:Nat) -> P k -> P $ S k) ->  -- induction step: predicate of k -> predicate of k+1,
                (n:Nat) ->                      -- and a (n:Nat),
                 P n                            -- then the predicate hold for n

-- implementing on plus
