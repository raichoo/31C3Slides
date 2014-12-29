module ValuesTypes

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/ValuesTypes.html"

slideId : String
slideId = "valuesTypesSlide"

prefixId : String -> String
prefixId = mkPrefix slideId

public
valuesTypesSlide : Slide
valuesTypesSlide =
  mkTitleCenterSlide slideId "Value → Type" $
    [div [preEscapedToNode code]]
