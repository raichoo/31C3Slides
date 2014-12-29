module PresentationKit.Slide

import public PresentationKit.HTML

record Slide : Type where
  mkSlide : (name  : String)
         -> (nodes : List HTML)
         -> Slide

mkTitleCenterSlide : String -> HTML -> List HTML -> Slide
mkTitleCenterSlide name title nodes =
  mkSlide name [ div [ div [h2 [title]] <. "slideTitle" <! role Heading
                     , div nodes
                     ] <. "slideInnerWrap"
               ]
