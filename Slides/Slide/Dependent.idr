module Slides.Slide.Dependent

import PresentationKit.Slide
import PresentationKit.HTML

dependentSlide : Slide
dependentSlide =
  mkSlide "dependentSlide" [
    h1 ["Dependent types"] <# "title"
  ]
