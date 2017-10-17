module Logic2

%access public export
%default total

-- syntax

syntax "†" = ()
syntax "ƒ" = Void

syntax [a] "#" [b] = Either a b
syntax [a] "&" [b] = (a,b)
syntax [a] "<->" [b] = ((a -> b) & (b -> a))
syntax "¬" [a] = a -> ƒ

-- structure

||| Destruct And's left
de_andl : (a & b) -> a
de_andl (x&y) = x
||| Destruct And's right
de_andr : (a & b) -> b
de_andr (x&y) = y

||| And is reflexive
rf_and : (a & b) -> (b & a)
rf_and xy = (de_andr xy) & (de_andl xy)

||| Or is reflexive
rf_or : (a # b) -> (b # a)
rf_or xoy = case xoy of
    Left x => Right x
    Right y => Left y

||| Destruct and in Implication
de_andimp : ((a & b) -> c) -> ((a -> c) # (b -> c))
de_andimp ((x,y)->z) = 

||| Destruct Negated And (DeMorgan's Law)
de_nand : (¬(a & b)) -> ((¬a) # (¬b))
de_nand n_xy = ?pf1

||| Destruct Negated Or (DeMorgan's Law)
de_nor : ¬(a # b) -> (¬a & ¬b)
de_nor n_xoy = ?pf2

||| Destruct with Negation on And's Left
de_nandl : (a & b) -> ¬a -> ¬b
de_nandl xy nx = nx (de_andl xy) (de_andr xy)

||| Destruct with Negation on And's Right
de_nandr : (a & b) -> ¬b -> ¬a
de_nandr xy ny = ny (de_andr xy) (de_andl xy)

||| Destruct double Negation
de_nn : (¬(¬a)) -> a
de_nn nna = ?pf3

||| And distributes over Or
co_andor : (a & (b # c)) -> ((a & b) # (a & c))
co_andor (x,yoz) = case yoz of
    Left y => Left (x&y)
    Right z => Right (x&z)

||| Or distributes over And
dist_orand : (a#(b&c)) -> ((a#b)&(a#c))
dist_orand xoyz = case xoyz of
    Left x => ?dist_orand_l
    Right yz => ?dist_orand_r