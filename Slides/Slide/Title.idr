module Slides.Slide.Title

import PresentationKit.Slide
import PresentationKit.HTML

import Slides.Common

titleSlide : Slide
titleSlide =
  mkSlide "titleSlide" [
    h1 ["Programming with dependent types in ", idris] <# "title"
  ]
