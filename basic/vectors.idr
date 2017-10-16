data Vec : Nat -> Type -> Type where
    -- implementing functions
    Nil : Vec Z a
    -- make 1 longer
    (::) : a -> Vec k a -> Vec (S k) a

(++) : Vec n a -> Vec m a -> Vec (n + m) a
(++) Nil ys = ys
(++) (x::xs) ys = x :: xs ++ ys