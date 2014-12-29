module Disjunction

data Either' : Type -> Type -> Type where
  Left'  : a -> Either' a b
  Right' : b -> Either' a b

example : Either' (23 = 23) (23 = 42)
example = Left' Refl
