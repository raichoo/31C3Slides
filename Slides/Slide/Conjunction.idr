module Slides.Slide.Conjunction

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Conjunction.html"

slideId : String
slideId = "conjunctionSlide"

public
conjunctionSlide : Slide
conjunctionSlide =
  mkTitleCenterSlide slideId "Conjunction" $
    [preEscapedToNode code]
