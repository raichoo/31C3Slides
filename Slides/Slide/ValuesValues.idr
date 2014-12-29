module Slides.Slide.ValuesValues

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/ValuesValues.html"

slideId : String
slideId = "valuesValuesSlide"

prefixId : String -> String
prefixId = mkPrefix slideId

public
valuesValuesSlide : Slide
valuesValuesSlide =
  mkTitleCenterSlide slideId "Value → Value" $
    [div [preEscapedToNode code]]
