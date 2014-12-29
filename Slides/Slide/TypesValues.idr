module TypesValues

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/TypesValues.html"

slideId : String
slideId = "typesValuesSlide"

prefixId : String -> String
prefixId = mkPrefix slideId

public
typesValuesSlide : Slide
typesValuesSlide =
  mkTitleCenterSlide slideId "Type → Value" $
    [div [preEscapedToNode code]]
