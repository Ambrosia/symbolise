module Translator (..) where


import Translator.Types exposing (..)
import Dict
import String

import Translator.Fraktur
import Translator.Script


charSets : List CharSet
charSets =
  [ Translator.Fraktur.charSet
  , Translator.Script.charSet
  ]


translate : CharSetId -> String -> String
translate charSetId text =
  let
    charSet = findCharSet charSetId
  in
    String.map (translateChar charSet) text


translateChar : CharSet -> Char -> Char
translateChar charSet char =
  case Dict.get char charSet.dict of
    Just char' ->
      char'

    Nothing ->
      char


findCharSet : CharSetId -> CharSet
findCharSet charSetId =
  case charSetId of
    Fraktur ->
      Translator.Fraktur.charSet

    Script ->
      Translator.Script.charSet
