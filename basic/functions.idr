add : Nat -> Nat -> Nat
add Z y     = y
add (S k) y = S (add k y)

mul : Nat -> Nat -> Nat
mul Z y     = 0
mul (S k) y = add y (mul k y)

rev : List a -> List a
rev xs = revAcc [] xs where
    revAcc : List a -> List a -> List a
    revAcc acc []       = acc
    revAcc acc (x::xs)  = revAcc (x::acc) xs