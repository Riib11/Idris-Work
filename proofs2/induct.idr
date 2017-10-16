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
nat_ind : (P:Nat -> Type) ->              -- the predicate,
          P Z ->                          -- the base case: 0,
          ((k:Nat) -> P k -> P $ S k) ->  -- induction step: predicate of k -> predicate of k+1,
          (n:Nat) ->                      -- and a (n:Nat),
          P n                             -- then the predicate hold for n

-- base case proof is provided
nat_ind P P_Z P_S Z = P_Z
-- check each successor case
nat_ind P P_Z P_S (S n) = P_S n (nat_ind P P_Z P_S n)


{-

implementing induction with plus (inducting on n):
    this is a proof that the sum of two Nat's is a Nat

-}
plus_ind : Nat -> Nat -> Nat
plus_ind n m = nat_ind (\x => Nat)              -- the predicate
                       m                        -- base case: plus_ind Z m
                       (\k, k_rec => S k_rec)   -- induction step: k + m -> (S k) + m
                       n                        -- the given n


{-

proof that n + m = m + n
(plus is commutative)

-}

total
plus_comm : (n,m:Nat) -> n + m = m + n
-- base base
plus_comm Z m = plus_comm_Z m where
    plus_comm_Z : (m:Nat) -> m = plus m Z
    plus_comm_Z Z = Refl
    plus_comm_Z (S k) = rewrite plus_comm_Z k in Refl
-- induction
plus_comm (S k) m = rewrite plus_comm k m in plus_comm_S k m where
    plus_comm_S : (k,m:Nat) -> S (m + k) = m + (S k)
    plus_comm_S m Z = Refl
    plus_comm_S m (S j) = rewrite plus_comm_S m j in Refl

{-

proof that a = b -> a + c = b + c
(plus is transitive)

-}

total
plus_trans : (a,b,c:Nat) -> (a = b) -> (a + c = b + c)
plus_trans a b c a_eq_b = rewrite a_eq_b in Refl