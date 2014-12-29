module Implication

id' : a -> a
id' = \x => x

example : Nat
example = id' 123
