module Main

import Effects
import Effect.StdIO

hello : { [STDIO] } Eff ()
hello = do
  putStr "Enter your name> "
  name <- [| trim getStr |]
  putStrLn $ "Hello, " ++ name ++ "!"

main : IO ()
main = run hello
