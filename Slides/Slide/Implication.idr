module Slides.Slide.Implication

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Implication.html"

slideId : String
slideId = "implicationSlide"

public
implicationSlide : Slide
implicationSlide =
  mkTitleCenterSlide slideId "Implication" $
    [preEscapedToNode code]
