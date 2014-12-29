module Slides.Slide.Universal

import PresentationKit.Slide
import PresentationKit.Providers
import PresentationKit.HTML

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Universal.html"

slideId : String
slideId = "universalSlide"

public
universalSlide : Slide
universalSlide =
  mkTitleCenterSlide slideId "Universal Quantification" $
    [preEscapedToNode code]
