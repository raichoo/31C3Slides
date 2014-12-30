module PresentationKit.Presentation

import PresentationKit.Slide
import PresentationKit.JQuery
import PresentationKit.HTML

%access private

abstract
data Presentation : Nat -> Nat -> Nat -> Type where
  MkPresentation : (prev : Vect n Slide)
                -> (next : Vect m Slide)
                -> Presentation n m (n + m)

public
initPresentation : Vect (S n) Slide -> Presentation 0 (S n) (S n)
initPresentation slides = MkPresentation [] slides

nextSlide : Presentation n (S m) l -> Presentation (S n) m l
nextSlide {n} {m} (MkPresentation prev (slide :: next)) =
  rewrite sym (plusSuccRightSucc n m) in
          MkPresentation (slide :: prev) next

previousSlide : Presentation (S n) m l -> Presentation n (S m) l
previousSlide {n} {m} (MkPresentation (slide :: prev) next) =
  rewrite plusSuccRightSucc n m in
          MkPresentation prev (slide :: next)

getKey : Ptr -> IO Int
getKey p =
  mkForeign (FFun "%0.which" [FPtr] FInt) p

bindKeys : IO () -> IO () -> IO ()
bindKeys left right = do
  onKeydown (\event => do case !(getKey event) of
                                37 => left
                                39 => right
                                _  => return ())

slideWrapper : String -> List HTML -> HTML
slideWrapper id nodes =
  div [section nodes <. "slide" <# id] <. "slideWrap" <! role Main

renderSlide : Slide -> Lazy (IO ()) -> Lazy (IO ()) -> IO ()
renderSlide slide left right = do
  elm  <- renderElement (
      renderText $ slideWrapper (name slide) (nodes slide)
    )
  main <- getElementForId "main"
  clearElement main
  elm `appendTo` main
  bindKeys left right

public
render : Presentation n (S m) l -> IO ()
render p with (p)
  | MkPresentation (_ :: _) (slide :: _ :: _) =
      renderSlide slide (render $ previousSlide p) (render $ nextSlide p)
  | MkPresentation (_ :: _) (slide :: []) =
      renderSlide slide (render $ previousSlide p) (return ())
  | MkPresentation [] (slide :: _ :: _) =
      renderSlide slide (return ()) (render $ nextSlide p)
  | MkPresentation [] (slide :: []) =
      renderSlide slide (return ()) (return ())
