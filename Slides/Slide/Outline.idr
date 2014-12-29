module Slides.Slide.Outline

import PresentationKit.Slide

outlineSlide : Slide
outlineSlide =
  mkTitleCenterSlide "outlineSlide" (div ["Outline"]) $
    [ ul [ "Dependent Types"
         , "Curry Howard Correspondence and Constructive Logic"
         , "Live Coding"
         , "Effects"
         , "Type Providers"
         ]
    ]
