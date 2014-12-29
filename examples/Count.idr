module Main

import Effects
import Effect.State
import Effect.StdIO

accEff : Num n
      => n
      -> ({ [e] } Eff n)
      -> { [e, STATE n] } Eff n
accEff Z     _   = get
accEff (S n) act = do
  num <- act
  update (+num)
  accEff n act

hello : { [STDIO] } Eff Nat
hello = do
  putStr "Enter your name> "
  name <- [| trim getStr |]
  putStrLn $ "Hello, " ++ name ++ "!"
  pure $ length name

main : IO ()
main = do
  res <- run (accEff 3 hello)
  putStrLn $ "Counted " ++ show res ++ " characters."
