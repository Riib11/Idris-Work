module Main

-- n-dimensional vector
data Vect : Nat -> Type -> Type where
    Nil : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

-- vector concat
(++) : Vect n a -> Vect m a -> Vect (n + m) a
(++) Nil ys = ys
(++) (x::xs) ys = x :: xs ++ ys

-- finite set
data Fin : Nat -> Type where
    -- finite set with S k elements (two constructors)
    FZ : Fin (S k)
    FS : Fin k -> Fin (S k)

-- example: the set Z mod 5
zmod5 : Fin 5
-- HOLE

-- index a vect
index : Fin n -> Vect n a -> a
{- 
    could write explicitly as:
        index : {a:Type} -> {n:Nat} -> Fin n -> Vect n a -> a
            or
        index : (i:Fin n) -> (xs:Vect n a) -> a
    since a,n are inferred
-}
index  FZ    (x::xs) = x
index (FS k) (x::xs) = index k xs

-- example usage:
one : Int
one = index {a=Int} {n=3} FZ [1,2,3]

isEmpty : Vect n a -> Bool
isEmpty {n = Z} _ = True -- length Z
isEmpty {n = S k} _ = False -- length is not Z

-- application of 'using'

{- verions without 'using' -}
-- data IsElem : a -> Vect n a -> Type where
--     Here  : {x:a}   -> {xs:Vect n a} -> IsElem x (x::xs)
--     There : {x,y:a} -> {xs:Vect n a} -> IsElem x xs -> IsElem x (y::xs)

{- this contains a lot of implicit variables, so instead can do: -}

-- gives type and ordering of all implicit arguments
using (x:a, y:a, xs:Vect n a)
    data IsElem : a -> Vect n a -> Type where
        Here  : IsElem x (x::xs)
        There : IsElem x xs -> IsElem x (y::xs)

{- test it out -}
testVec : Vect 4 Int
testVec = [3,4,5,6]

inVect : IsElem 5 Main.testVec
inVect = There (There Here)