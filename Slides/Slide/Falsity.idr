module Slides.Slide.Falsity

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Falsity.html"

slideId : String
slideId = "falsity-slide"

public
falsitySlide : Slide
falsitySlide =
  mkTitleCenterSlide slideId "Falsity" $
    [preEscapedToNode code]
