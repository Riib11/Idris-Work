record Fraction where
    constructor Frac
    n : Double
    d : Double

eval : Fraction -> Double
eval (Frac n d) = n / d

-- Simplibility : Fraction -> Type where
--     Simplible  : {f:Fraction} -> Simplibility f
--     Unsimplible : {f:Fraction} -> Simplibility f

-- simplibility : (f:Fraction) -> Simplibility