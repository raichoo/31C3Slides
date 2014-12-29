module Slides.Common

import PresentationKit.HTML
import PresentationKit.Slide

idris : HTML
idris = span "Idris" <. "idris"

mkPrefix : String -> String -> String
mkPrefix pre id = pre ++ "-" ++ id
