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
unbindKeydown : IO Ptr
unbindKeydown =
  mkForeign (FFun "$(document).unbind('keydown')" [] FPtr)

onKeydown : (Ptr -> IO ()) -> IO ()
onKeydown f = do
  unbindKeydown
  mkForeign (FFun "$(document).keydown(%0)" [
      FFunction FPtr (FAny (IO ()))
    ] FUnit) f
