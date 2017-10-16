-- set default totality:
-- %default total

{-

anything that is not default must be flagged
or will case compiler errors

-}

-- partially defined
empty1 : Void
empty1 = hd [] where -- hd not defined for []
    hd : List a -> a
    hd (x::xs) = x

-- nonterminating
partial
empty2 : Void
empty2 = empty2 -- infinite loop

-- flag a terminating recursion
total
total1 : Nat -> Int
total1 Z = 0
total1 (S k) = 1 + (total1 k)

-- flag a partial function
partial
partial1 : Nat -> Int
partial1 (S k) = 2 + (partial1 k)