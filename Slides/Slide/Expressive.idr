module Slides.Slide.Expressive

import PresentationKit.Slide
import PresentationKit.Providers

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/TypeConditional.html"

slideId : String
slideId = "expressiveSlide"

public
expressiveSlide : Slide
expressiveSlide =
  mkTitleCenterSlide slideId "Expressivity" $
    [ ul [ "Types keep our runtime behaviour in check"
         , "More expressive type systems allow us to encode more invariants"
         , "Type-level language is a language of its own"
         ]
    , preEscapedToNode code
    ]
