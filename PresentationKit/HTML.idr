module PresentationKit.HTML

%access public
%default total

infixl 7 <!
infixl 7 <#
infixl 7 <.
infixl 7 <..

Id : Type
Id = Maybe String

Attribute : Type
Attribute = (String, Maybe String)

Class : Type
Class = List String

data HTML = TextNode String
          | Tag String Id Class (List Attribute) (List HTML)
          | Raw String

escape : String -> String
escape txt = concatMap helper (unpack txt)
  where
    helper : Char -> String
    helper '<'  = "&lt;"
    helper '>'  = "&gt;"
    helper '&'  = "&amp;"
    helper '"'  = "&qout;"
    helper '\'' = "&apos;"
    helper c    = pack $ with List [c]

partial
renderText : HTML -> String
renderText (TextNode txt)     = escape txt
renderText (Raw raw)          = raw
renderText (Tag t i cs as ns) = tag (escape t) ns
  where
    attrs : List Attribute -> String
    attrs []                   = ""
    attrs ((a, Nothing) :: as) = " " ++ a ++ attrs as
    attrs ((a, Just v) :: as)  = " " ++ a ++ "=\"" ++ v ++ "\"" ++ attrs as

    classes : List String -> String
    classes [] = ""
    classes cs =
      " class=\"" ++ pack (intercalate [' '] (map unpack cs)) ++ "\""

    id : Id -> String
    id Nothing  = ""
    id (Just i) = " id=\"" ++ escape i ++ "\""

    partial
    tag : String -> List HTML -> String
    tag t ns = "<" ++ t ++ id i ++ classes cs ++ attrs as ++ ">"
            ++ concatMap renderText ns
            ++ "</" ++ t ++ ">"

head : List HTML -> HTML
head = Tag "head" Nothing [] []

title : String -> HTML
title t = Tag "title" Nothing [] [] [TextNode t]

div : List HTML -> HTML
div = Tag "div" Nothing [] []

section : List HTML -> HTML
section = Tag "section" Nothing [] []

span : String -> HTML
span t = Tag "span" Nothing [] [] [TextNode t]

h1 : List HTML -> HTML
h1 = Tag "h1" Nothing [] []

h2 : List HTML -> HTML
h2 = Tag "h2" Nothing [] []

p : List HTML -> HTML
p = Tag "p" Nothing [] []

img : String -> HTML
img src = Tag "img" Nothing [] [("src", Just src)] []

preEscapedToNode : String -> HTML
preEscapedToNode = Raw

private
li : HTML -> HTML
li n = Tag "li" Nothing [] [] [n]

private
mkList : String -> List HTML -> HTML
mkList tag = Tag tag Nothing [] [] . map li

ul : List HTML -> HTML
ul = mkList "ul"

ol : List HTML -> HTML
ol = mkList "ol"

text : String -> HTML
text = TextNode

implicit
stringToNode : String -> HTML
stringToNode = TextNode

addClass : HTML -> String -> HTML
addClass (Tag t i cs as ns) c =
  Tag t i (nub $ (escape c) :: cs) as ns
addClass node               _ = node

addClasses : HTML -> List String -> HTML
addClasses (Tag t i cs as ns) cs' =
  Tag t i (nub $ (map escape cs') ++ cs) as ns
addClasses node               _   = node

ident : HTML -> String -> HTML
ident (Tag t _ cs as ns) i = Tag t (Just (escape i)) cs as ns
ident node               _ = node

src : String -> Attribute
src s = ("src", Just s)

alt : String -> Attribute
alt a = ("alt", Just a)

data Role : Type where
  Main    : Role
  Heading : Role

instance Show Role where
  show Main    = "main"
  show Heading = "heading"

role : Role -> Attribute
role r = ("role", Just $ show r)

addAttr : HTML -> Attribute -> HTML
addAttr (Tag t i cs as ns) (a, v) =
  Tag t i cs ((escape a, map escape v) :: as) ns
addAttr node               _      = node

(<!) : HTML -> Attribute -> HTML
n <! a = addAttr n a

(<#) : HTML -> String -> HTML
n <# i = ident n i

(<.) : HTML -> String -> HTML
n <. c = addClass n c

(<..) : HTML -> List String -> HTML
n <.. cs = addClasses n cs
