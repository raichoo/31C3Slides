module ValuesTypes

data StringVect : Nat -> Type where
  Nil  : StringVect 0
  (::) : String -> StringVect n -> StringVect (1 + n)

example : StringVect 4
example = ["I", "have", "4", "elements"]
