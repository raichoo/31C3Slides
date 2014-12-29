module Slides.Slide.Thanks

import PresentationKit.Slide
import PresentationKit.HTML

import Slides.Common

thanksSlide : Slide
thanksSlide =
  mkSlide "thanksSlide" [
    h1 ["cabal install idris"] <# "title"
  ]
