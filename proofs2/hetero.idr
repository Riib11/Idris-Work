module Hetero

data Vect : Nat -> a -> Type where
    Nil : Vect Z a
    (::) : a -> Vect n a -> Vect (S n) a

implementation (Eq a) => Eq (Vect n a) where
  (==) []      []      = True
  (==) (x::xs) (y::ys) = x == y && xs == ys

-- equal vectors must have equal length
vect_eq_length : (v:Vect n a) -> (u:Vect m a) -> (v_eq_u:v=u) -> n=m
-- only where Refl can be used will this type check,
-- so can use the underscore
vect_eq_length v _ Refl = Refl

a : Nat
a = 1
b : Nat
b = 1

v1 : Vect Hetero.a Int
v1 = [0]
v2 : Vect Hetero.b Int
v2 = [0]

-- prove that v1 = v2
v1_eq_v2 : Hetero.v1=Hetero.v2
v1_eq_v2 = Refl

-- finally, can prove that a=b!
a_eq_b : Hetero.a=Hetero.b;
a_eq_b = vect_eq_length Hetero.v1 Hetero.v2 v1_eq_v2