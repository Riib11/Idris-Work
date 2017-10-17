module BoolLogic

%access public export
%default total

-- basic types

||| True
T : Bool
T = True
||| False
F : Bool
F = False

-- logic structures

data And : Bool -> Bool -> Type where Ai : (a,b:Bool) -> And a b
data Or Bool Bool = Oil Bool | Oir Bool
data Not Bool = Ni Bool

-- base theorems

-- dist_and_or : And a (Or b c) -> Or (And a b) (And a c)
-- dist_and_or (Ai a x) = case x of
--     Oil l => Oil (Ai a l)
--     Oir r => Oir (Ai a r)

-- dist_or_and : Or a (And b c) -> And (Or a b) (Or a c)
-- dist_or_and x = case x of
--     Oil l => Ai (Oil l) (Oir l)
--     Oir r => Ai (Oir r) (Oir r)

||| Destruct And's left
dand_l : And a b -> a
dand_l (Ai a b) = a
||| Destruct And's right
dand_r : And a b -> b
dand_r (Ai a b) = b

-- ||| Apply Implication
-- aimpl : (a -> b) -> a -> b
-- aimpl a_then_b a = b

{-

||| Apply Iff's forward
aiff_f : Iff a b -> a -> b
aiff_f (Iffi fr bk) a = dimpl fr a

||| Apply Iff' backward
aiff_b : Iff a b -> b -> a
aiff_b (Iffi fr bk) b = dimpl bk a

-}

{-

||| Destruct Not in an And's left
dnand_l : Not a -> And a b -> Not b
dnand_l na (Ai a b) = ?pf1

||| Destruct Not in an And's right
dnand_r : Not b -> And a b -> Not a
dnand_r nb (Ai a b) = ?pf2

-}