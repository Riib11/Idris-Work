module Geometry3

import CommonMath

{--------------------------
    vector
--------------------------}

||| vector
record Vector where
    constructor Vec
    x, y, z : Double

||| vector equality
implementation Eq Vector where
    (Vec x1 y1 z1) == (Vec x2 y2 z2) = (x1~=x2) && (y1~=y2) && (z1~=z2)


{- vector constants -}

||| zero vector
zero : Vector; zero = Vec 0.0 0.0 0.0
||| e1 vector
e1 : Vector; e1 = Vec 1.0 0.0 0.0
||| e2 vector
e2 : Vector; e2 = Vec 0.0 1.0 0.0
||| e3 vector
e3 : Vector; e3 = Vec 0.0 0.0 1.0

{--------------------------
    point
--------------------------}

||| point
record Point where
    constructor Pnt
    x, y, z : Double

implementation Eq Point where
    (Pnt x1 y1 z1) == (Pnt x2 y2 z2) = (x1==x2) && (y1==y2) && (z1==z2)

{- point constants -}

||| origin
origin : Point; origin = Pnt 0.0 0.0 0.0
||| point (1,0,0)
u1 : Point; u1 = Pnt 1.0 0.0 0.0
||| point (0,1,0)
u2 : Point; u2 = Pnt 0.0 1.0 0.0
||| point (0,0,1)
u3 : Point; u3 = Pnt 0.0 0.0 1.0

{--------------------------
    vector functions
--------------------------}

||| get first entry
xc : Vector -> Double; xc (Vec x y z) = x
||| get second entry
yc : Vector -> Double; yc (Vec x y z) = y
||| get third entry
zc : Vector -> Double; zc (Vec x y z) = z

||| compose vectors
(+) : Vector -> Vector -> Vector
(+) (Vec x1 y1 z1) (Vec x2 y2 z2) = Vec (x1+x2) (y1+y2) (z1+z2)

||| dot product vectors
(.) : Vector -> Vector -> Double
(.) (Vec x1 y1 z1) (Vec x2 y2 z2) = x1*x2 + y1*y2 + z1*z2

||| cross product vectors
cross : Vector -> Vector -> Vector
cross (Vec x1 y1 z1) (Vec x2 y2 z2) = Vec (y1*z2-z1*y2) (z1*x2-x1*z2) (x1*y2 - y1*x2)

||| scalar multiplication
scale : Double -> Vector -> Vector
scale a (Vec x y z) = Vec (a*x) (a*y) (a*z)

{--------------------------
    point functions
--------------------------}

||| translate point
trans : Point -> Vector -> Point
trans (Pnt x y z) (Vec a b c) = Pnt (x+a) (y+b) (z+c)

||| arrow from point to point
arrow : Point -> Point -> Vector
arrow (Pnt x1 y1 z1) (Pnt x2 y2 z2) = Vec (x2-x1) (y2-y1) (z2-z1)

{--------------------------
    lines and planes
--------------------------}

record Line where
    constructor Lin
    p : Point
    n : Vector

record Plane where
    constructor Pln
    p : Point
    n : Vector

{- plane constants -}

||| x-y plane
xyplane : Plane; xyplane = Pln origin e3
||| x-z plane
xzplane : Plane; xzplane = Pln origin e2
||| y-z plane
yzplane : Plane; yzplane = Pln origin e1

{-------------------------------
    line and plane functions
-------------------------------}

-- ||| try to intersect line with a plane
-- intersect : Line -> Plane -> Maybe Point
-- intersect (Lin q v) (Pln o n) = if 