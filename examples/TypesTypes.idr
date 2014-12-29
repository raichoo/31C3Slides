module TypesTypes

data List' : Type -> Type where
  Nil  : List' a
  (::) : a -> List' a -> List' a

example : List' Nat
example = 1 :: 2 :: 3 :: 4 :: Nil

example' : List' Nat
example' = [1, 2, 3, 4]
