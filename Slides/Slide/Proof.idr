module Slides.Slide.Proof

import PresentationKit.Slide
import PresentationKit.Providers

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Proof.html"

slideId : String
slideId = "proofSlide"

public
proofSlide : Slide
proofSlide =
  mkTitleCenterSlide slideId "Proof" $
    [preEscapedToNode code]
