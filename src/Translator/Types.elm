module Translator.Types (..) where

import Dict


type alias CharSet =
  { id : CharSetId
  , name : String
  , fallback : Maybe CharSetId
  , dict : CharDict
  }


type CharSetId
  = Fraktur
  | Script
  | DoubleWidth
  | DoubleStruck


type alias CharDict =
  Dict.Dict Char Char


stringToCharSetId : String -> Maybe CharSetId
stringToCharSetId string =
  case string of
    "Fraktur" ->
      Just Fraktur

    "Script" ->
      Just Script

    "DoubleWidth" ->
      Just DoubleWidth

    "DoubleStruck" ->
      Just DoubleStruck

    _ ->
      Nothing
