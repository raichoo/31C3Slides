module Slides.Slide.LEM

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/LEM.html"

slideId : String
slideId = "lemSlide"

public
lemSlide : Slide
lemSlide =
  mkTitleCenterSlide slideId "Law of the Excluded Middle" $
    [preEscapedToNode code]
