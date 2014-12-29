module Conjunction

-- data (,) : Type -> Type -> Type where
--   (,) : a -> b -> (a, b)

example : (23 = 23, 42 = 42)
example = (Refl, Refl)
