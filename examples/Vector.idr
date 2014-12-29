module Vector

data Vect' : Nat -> Type -> Type where
  Nil  : Vect' 0 a
  (::) : a -> Vect' n a -> Vect' (1 + n) a

infixr 7 ++
(++) : Vect' n a -> Vect' m a -> Vect' (n + m) a
[]        ++ ys = ys
(x :: xs) ++ ys = x :: (xs ++ ys)

vec1 : Vect' 4 Nat
vec1 = [1, 2, 3, 4]

vec2 : Vect' 4 Nat
vec2 = [4, 5, 6, 7]

vec3 : Vect' 8 Nat
vec3 = vec1 ++ vec2
