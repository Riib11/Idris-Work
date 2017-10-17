module Logic

%access public export
%default total

-- basic types

-- ||| Unit Type - has one term, itself
syntax "†" = ()
-- ||| Empty Type - has no terms
syntax "ƒ" = Void

-- logic structures

data Or a b = Oil a | Oir b
data And a b = Ai a b
data Iff a b = Iffi (a -> b) (b -> a)

-- base theorems

||| And commutes
com_and : And a b -> And b a
com_and (Ai x y) = Ai y x
||| Or commutes
com_or : Or a b -> Or b a
com_or xoy = case xoy of
    Left x => ?pf1
    Right y => ?pf2

||| Extract And's left
ex_andl : And a b -> a
ex_andl (Ai x y) = x
||| Extract And's right
ex_andr : And a b -> b
ex_andr (Ai x y) = y

dist_and_or : And a (Or b c) -> Or (And a b) (And a c)
dist_and_or (Ai x yoz) = case yoz of
    Oil y => Oil (Ai x y)
    Oir z => Oir (Ai x z)

dist_or_and : Or a (And b c) -> And (Or a b) (Or a c)
dist_or_and xoyz = case xoyz of
    Oil x => Ai (Oil x) (Oil x)
    Oir yz => Ai (Oir $ ex_andl yz) (Oir $ ex_andr yz)

||| Extract Iff's left
ex_iffl : Iff a b -> (a -> b)
ex_iffl (Iffi l r) = l
||| Extract Iff's right
ex_iffr : Iff a b -> (b -> a)
ex_iffr (Iffi l r) = r

||| Construct NAnd from Not on And's left
con_nandl : Not a -> Not (And a b)
con_nandl nx = (\xy => nx $ ex_andl xy)
||| Construct NAnd from Not on And's right
con_nandr : Not b -> Not (And a b)
con_nandr ny = (\xy => ny $ ex_andr xy)

||| Apply Not on Or's Left
ap_norl : Not a -> Or a b -> b
ap_norl nx xoy = case xoy of
    Oil x => ?pf
    Oir y => y

test : Or a b -> Or a b
test xoy = case xoy of
    Oil x => Oil x
    Oir y => Oir y


-- ap_norl nx xoy = case xoy of
--     Oil x => ?pfl x -- can't happen since have nx
--     Oir y => (\y' => )

-- ||| Apply Not in an And's left
-- ap_nandl : Not a -> And a b -> Not b
-- ap_nandl nx ay = (\y => co_nandr)

-- ||| Apply Not in an And's right
-- dnand_r : Not b -> And a b -> Not a
-- dnand_r nb (Ai a b) = ?pf2

{-

||| Apply Not with Implication's forward
animpl_f : Nt a -> Impl a b -> Nt b
animpl_f (Ni a) (Impli (a -> b)) = Ni b

||| Apply Not Implication's backward
animpl_b : Nt b -> Impl a b -> Nt a
animpl_b (Ni b) (Impli (a -> b)) = Ni a

-}