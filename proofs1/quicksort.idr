{- 

idris mistakes the below implementation as partial:

    qsort : Ord a => List a -> List a
    qsort [] = []
qsort (x::xs) = qsort (filter (< x) xs) ++ (x :: qsort (filter (>= x) xs))


however, it is indeed total. idris just needs a hint:

    assert_smaller : a -> b -> b
    assert_smaller x y = y

this just evaluates the second argument, but asserts to the totality checker
that y is structurally smaller than x. so you can write qsort this way:

-}

total
qsort : Ord a => List a -> List a
qsort [] = []
qsort (x::xs)
    = qsort ( assert_smaller (x::xs) (filter (<  x) xs) ) ++ 
        (x :: qsort ( assert_smaller (x::xs) (filter (>= x) xs) ))