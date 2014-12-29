module TypesValues

id' : (a : Type) -> a -> a
id' t x = x

exampleNat : Nat
exampleNat = id' Nat 1

exampleString : String
exampleString = id' String "Hello, 31c3!"
