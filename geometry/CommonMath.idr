module CommonMath

-- all is public
%access export
public export

epsilon : Double
epsilon = 1.0e-8

infixr 10 ~=
(~=) : Double -> Double -> Bool
a ~= b = abs(a-b) < epsilon

sqr : Double -> Double
sqr x = x * x