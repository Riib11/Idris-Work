data Vect : Nat -> Type -> Type where
    Nil : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

record Matrix where
    constructor Mat
        n, m : Nat
        entries : Vect n (Vect m Double)