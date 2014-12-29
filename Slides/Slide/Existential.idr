module Slides.Slide.Existential

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Existential.html"

slideId : String
slideId = "existentialSlide"

public
existentialSlide : Slide
existentialSlide =
  mkTitleCenterSlide slideId "Existential Quantification" $
    [preEscapedToNode code]
