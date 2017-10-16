module Logic

%access public export

-- basic types

||| Has a proof
T : Type
T = ()
||| Doesn't have a proof
F : Type
F = Void

-- logic structures

data Or a b = Oil a | Oir a
data And a b = Ai a b

-- basic theorems

dist_and_or : And a (Or b c) -> Or (And a b) (And a c)
dist_and_or (Ai a x) = case x of
    Oil l => Oil (Ai a l)
    Oir r => Oir (Ai a r)

dist_or_and : Or a (And b c) -> And (Or a b) (Or a c)
dist_or_and x = case x of
    Oil l => Ai (Oil l) (Oir l)
    Oir r => Ai (Oir r) (Oir r)

dandl : And a b -> a
dandl (Ai a b) = a
dandr : And a b -> b
dandr (Ai a b) = b