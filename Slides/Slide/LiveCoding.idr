module Slides.Slide.LiveCoding

import PresentationKit.Slide
import PresentationKit.HTML

liveCodingSlide : Slide
liveCodingSlide =
  mkSlide "liveCodingSlide" [
    h1 ["Live Coding"] <# "title"
  ]
