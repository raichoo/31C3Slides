module Existential

-- data (**) : (a : Type) -> (P : a -> Type) -> Type where
--   (**) : {P : a -> Type} -> (x : a) -> P x -> (a ** P)

filter' : (a -> Bool) -> Vect n a -> (m ** Vect m a)
filter' p [] = (0 ** Nil)
filter' p (x :: xs) with (filter' p xs)
  | (l ** xs') =
    if p x
       then (1 + l ** x :: xs')
       else (l ** xs')
