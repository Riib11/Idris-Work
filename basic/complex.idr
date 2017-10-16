infixr 6 :::
data Complex = (:::) Double Double

re : Complex -> Double
re (r:::i) = r

im : Complex -> Double
im (r:::i) = i

implementation Show Complex where
    show (0.0:::i) = show i ++ " i"
    show (r:::0.0) = show r
    show (r:::i) = show r ++ " + " ++ show i ++ " i"

(+) : Complex -> Complex -> Complex
(+) (a:::b) (c:::d) = (a+c):::(b+d)

(*) : Double -> Complex -> Complex
(*) a (r:::i) = (a*r):::(a*i)

r1 : Complex; r1 = 1.0:::0.0
i1 : Complex; i1 = 0.0:::1.0