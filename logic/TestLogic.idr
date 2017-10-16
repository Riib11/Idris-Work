infixr 10 /\
data And : a -> b -> Type where
    (/\) : a -> b -> And a b

-- infixr 10 /-

-- (/\) : a -> b -> And a b
-- a /\ b = Ai a b

-- data Or 