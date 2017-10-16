data MyNat = MZ | MS MyNat

instance ShowMy Nat where
    show MZ = "Z"
    show (MS k) = "s" ++ show k