module Slides.Slide.Implication

import PresentationKit.Slide
import PresentationKit.Providers

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Negation.html"

slideId : String
slideId = "negationSlide"

public
negationSlide : Slide
negationSlide =
  mkTitleCenterSlide slideId "Negation" $
    [preEscapedToNode code]
