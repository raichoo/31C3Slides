module PresentationKit.JQuery

import PresentationKit.HTML
import PresentationKit.Slide

%access public

getElementForId : String -> IO Ptr
getElementForId i =
  mkForeign (FFun "$(%0)" [FString] FPtr) (strCons '#' i)

renderElement : String -> IO Ptr
renderElement elm =
  mkForeign (FFun "$(%0)" [FString] FPtr) elm

clearElement : Ptr -> IO ()
clearElement elm =
  mkForeign (FFun "%0.empty()" [FPtr] FUnit) elm

appendTo : Ptr -> Ptr -> IO ()
appendTo elm to =
  mkForeign (FFun "%0.append(%1)" [FPtr, FPtr] FUnit) to elm

private
unbindKeypress : IO Ptr
unbindKeypress =
  mkForeign (FFun "$(document).unbind('keypress')" [] FPtr)

onKeypress : (Ptr -> IO ()) -> IO ()
onKeypress f = do
  unbindKeypress
  mkForeign (FFun "$(document).keypress(%0)" [
      FFunction FPtr (FAny (IO ()))
    ] FUnit) f
