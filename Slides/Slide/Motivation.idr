module Motivation

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

slideId : String
slideId = "motivationSlide"

public
motivationSlide : Slide
motivationSlide =
  mkSlide slideId $
    [h1 ["Motivation"] <# "title"]
