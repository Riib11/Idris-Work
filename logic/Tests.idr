-- data example,
-- with implicit paramaters
data Vect : {a:Type} -> Nat -> a -> Type where
    Nil : {a:Type} -> Vect Z a
    (::) : {a:Type} -> a -> Vect n a -> Vect (S n) a

-- accepting a predicate
apply : {a,b:Type} -> (a -> b) -> a -> b
apply fn x = fn x
-- appluing a predicate
doubleapply : (a -> (a -> b)) -> a -> b
doubleapply fn x = fn x x

-- example of contstructing a predicate
identity : {a:Type} -> (a -> a)
identity = \x => x