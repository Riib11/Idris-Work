module Matrix

import Vector

%access public export

------------------------------------------------------------

||| Matrix - rows . columns
Matrix : Nat -> Nat -> Type -> Type
Matrix n m a = Vector n (Vector m a)

implementation (Show a) => (Matrix n m a) where
    show [] = "[]"
    show rs = map (show) rs

mId1 : Matrix 1 1 Int
mId1 = [[1]]

mId2 : Matrix 2 2 Int
mId2 = [[1,0],[0,1]]

-- (*) : Matrix n m -> Matrix m o -> Matrix n o
-- (*) (c::cs)