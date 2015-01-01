module Slides.Slide.AboutIdris

import PresentationKit.Slide
import Slides.Common

aboutIdrisSlide : Slide
aboutIdrisSlide =
  mkTitleCenterSlide "aboutIdrisSlide" (div ["About ", idris]) $
    [ ul [ "Developed by Edwin Brady and various contributors"
         , "Currently intended as a research tool"
         , "Dependently Typed"
         , "Pure functional programming language"
         , "Syntax is close to Haskell"
         , "Focus on general purpose programming"
         , "Totality Checking"
         , "Interactive Proving with Tactics (similar to Coq)"
         ]
    ]
