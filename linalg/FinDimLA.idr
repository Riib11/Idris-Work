module VectorSpace

data Vect : Nat -> Type -> Type where
    Nil : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

data Fin : Nat -> Type where
    FZ : Fin (S k)
    FS : (k:Nat) -> Fin (S k)

v3 : Vect 3 Int
v3 = [1,2,3]

fone : Fin 1; fone = FZ
ftwo : Fin 2; ftwo = FS 1
ftre : Fin 3; ftre = FS 2

-- infixr 10 #
-- (#) : Vect n a -> Fin n -> a
-- (x::xs)#Fin_Z = x
-- (x::xs)#(Fin_S k) = xs#k