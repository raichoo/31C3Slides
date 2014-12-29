module Vector

import PresentationKit.Slide
import PresentationKit.HTML
import PresentationKit.Providers

import Slides.Common

%language TypeProviders
%access private

%provide (code : String) with fromFile "partials/Vector.html"

slideId : String
slideId = "vectorSlide"

prefixId : String -> String
prefixId = mkPrefix slideId

public
vectorSlide : Slide
vectorSlide =
 mkTitleCenterSlide slideId "Vector" $
    [div [preEscapedToNode code]]
