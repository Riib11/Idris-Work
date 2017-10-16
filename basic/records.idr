record Person where
    constructor MkPerson
    firstName, middleName, lastName : String
    age : Int

fred : Person
fred = MkPerson "Fred" "Joe" "Bloggs" 30

record Vector where
    constructor Vec
    x, y, z : Double

vec : Vec
vec = Vec 1.0 2.0 3.0