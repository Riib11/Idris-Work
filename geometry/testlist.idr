data Pair : (a:Type) -> (P:a->Type) -> Type where
    MkPair : {P:a->Type} -> (x:a) -> P x -> Pair a P