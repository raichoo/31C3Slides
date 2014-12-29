module Slides.Slide.Disjunction

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Disjunction.html"

slideId : String
slideId = "disjunctionSlide"

public
disjunctionSlide : Slide
disjunctionSlide =
  mkTitleCenterSlide slideId "Disjunction" $
    [preEscapedToNode code]
