module Main

data Parity : Nat -> Type where
    Even : {n:Nat} -> Parity (n+n)
    Odd  : {n:Nat} -> Parity (S (n+n))

-- parity of a natural number
helpEven : (j:Nat) -> Parity (S j + S j) -> Parity (S $ S $ j+j)
helpEven j p = rewrite plusSuccRightSucc j j in p

helpOdd : (j:Nat) -> Parity (S $ S $ j + S j) -> Parity (S $ S $ S $ j+j)
helpOdd j p = rewrite plusSuccRightSucc j j in p

parity : (n:Nat) -> Parity n
parity Z         = Even {n=Z} -- base case Z   = 0
parity (S Z)     = Odd {n=Z}  -- base case S Z = 1
parity (S (S k)) with (parity k)
    parity (S $ S $     j+j) | Even = helpEven j (Even {n = S j})
    parity (S $ S $ S $ j+j) | Odd  = helpOdd  j (Odd  {n = S j})

{-

The rewrite ... in syntax allows you to change the
required type of an expression by rewriting it according
to an equality proof. Here, we have used plusSuccRightSucc,
which has the following type:

    plusSuccRightSucc : (left : Nat) -> (right : Nat) -> S (left + right) = left + S right

-}