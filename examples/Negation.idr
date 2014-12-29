module Negation

nonsense : (2 = 3) -> Void
nonsense Refl impossible

Not' : Type -> Type
Not' a = a -> Void
