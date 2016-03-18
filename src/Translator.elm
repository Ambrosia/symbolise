module Translator (..) where

import Translator.Types exposing (..)
import Dict
import String
import Maybe exposing (withDefault)
import Translator.Fraktur
import Translator.Script
import Translator.DoubleWidth


charSets : List CharSet
charSets =
  [ Translator.Fraktur.charSet
  , Translator.Script.charSet
  , Translator.DoubleWidth.charSet
  ]


translate : CharSetId -> String -> String
translate charSetId text =
  let
    charSet =
      findCharSet charSetId
  in
    String.map (translateChar charSet) text


translateChar : CharSet -> Char -> Char
translateChar charSet char =
  let
    charSet' =
      withDefault charSet (charSetForChar charSet char)
  in
    withDefault char (Dict.get char charSet'.dict)



{-
`char` renamed to `character` in the following function because of a bug in
compilation. It produced "Uncaught ReferenceError: char is not defined".
I should report this some time!
-}


charSetForChar : CharSet -> Char -> Maybe CharSet
charSetForChar charSet character =
  case Dict.get character charSet.dict of
    Just _ ->
      Just charSet

    Nothing ->
      case charSet.fallback of
        Just fallbackCharSetId ->
          charSetForChar (findCharSet fallbackCharSetId) character

        Nothing ->
          Nothing


findCharSet : CharSetId -> CharSet
findCharSet charSetId =
  case charSetId of
    Fraktur ->
      Translator.Fraktur.charSet

    Script ->
      Translator.Script.charSet

    DoubleWidth ->
      Translator.DoubleWidth.charSet
