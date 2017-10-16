module Vector

data Vector : Nat -> Type -> Type where
    Nil : Vector Z a
    (::) : a -> Vector k a -> Vector (S k) a

v_one : Vector 1 Int
v_one = 1::Nil

v_two : Vector 2 Int
v_two = 1::2::Nil

module Matrix

data Matrix : Nat -> (v:Vector n a) -> Type where
    Nil : Matrix Z v

-- record Matrix where
--     constructor Mat
--         n, m : Nat
--         entries : Vect n (Vect m Double)