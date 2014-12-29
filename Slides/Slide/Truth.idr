module Slides.Slide.Thruth

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Truth.html"

slideId : String
slideId = "truth-slide"

public
truthSlide : Slide
truthSlide =
  mkTitleCenterSlide slideId "Truth" $
    [preEscapedToNode code]
