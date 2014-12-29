module PresentationKit.Providers

import Providers

fromFile : String -> IO (Provider String)
fromFile file = return . Provide $ !(readFile file)
