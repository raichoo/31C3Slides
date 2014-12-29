module TypesTypes

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/TypesTypes.html"

slideId : String
slideId = "typesTypesSlide"

prefixId : String -> String
prefixId = mkPrefix slideId

public
typesTypesSlide : Slide
typesTypesSlide =
  mkTitleCenterSlide slideId "Type → Type" $
    [div [preEscapedToNode code]]
