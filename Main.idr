module Main

import PresentationKit.Slide
import PresentationKit.Presentation

import Slides.Slide.Title
import Slides.Slide.Outline
import Slides.Slide.AboutIdris
import Slides.Slide.Motivation
import Slides.Slide.Expressive

import Slides.Slide.Dependent
import Slides.Slide.ValuesValues
import Slides.Slide.TypesValues
import Slides.Slide.TypesTypes
import Slides.Slide.ValuesTypes
import Slides.Slide.Vector

import Slides.Slide.CurryHoward
import Slides.Slide.Proof
import Slides.Slide.Truth
import Slides.Slide.Falsity
import Slides.Slide.Conjunction
import Slides.Slide.Disjunction
import Slides.Slide.Implication
import Slides.Slide.Universal
import Slides.Slide.Existential
import Slides.Slide.Negation
import Slides.Slide.LEM

import Slides.Slide.LiveCoding

import Slides.Slide.Effects

import Slides.Slide.Questions
import Slides.Slide.Thanks



intro : Vect 5 Slide
intro = [ titleSlide
        , outlineSlide
        , aboutIdrisSlide
        , motivationSlide
        , expressiveSlide
        ]

dependentTypes : Vect 6 Slide
dependentTypes = [ dependentSlide
                 , valuesValuesSlide
                 , typesValuesSlide
                 , typesTypesSlide
                 , valuesTypesSlide
                 , vectorSlide
                 ]

curryHorward : Vect 11 Slide
curryHorward = [ curryHowardSlide
               , proofSlide
               , truthSlide
               , falsitySlide
               , conjunctionSlide
               , disjunctionSlide
               , implicationSlide
               , universalSlide
               , existentialSlide
               , negationSlide
               , lemSlide
               ]

liveCoding : Vect 1 Slide
liveCoding = [liveCodingSlide]

effects : Vect 1 Slide
effects = [effectsSlide]

outro : Vect 2 Slide
outro = [ questionsSlide
        , thanksSlide
        ]

numSlides : Nat
numSlides = with Vect sum [ length intro
                          , length dependentTypes
                          , length curryHorward
                          , length liveCoding
                          , length effects
                          , length outro
                          ]

slides : Vect numSlides Slide
slides = intro
      ++ dependentTypes
      ++ curryHorward
      ++ liveCoding
      ++ effects
      ++ outro

main : IO ()
main = do
  let presentation = initPresentation slides
  render presentation
