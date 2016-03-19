module Translator.Circled (..) where

import Translator.Types exposing (..)
import Dict


charSet : CharSet
charSet =
  { id = Circled
  , name = "Circled"
  , fallback = Nothing
  , dict = dict
  }


dict : CharDict
dict =
  Dict.fromList
    [ ( 'a', 'ⓐ' )
    , ( 'b', 'ⓑ' )
    , ( 'c', 'ⓒ' )
    , ( 'd', 'ⓓ' )
    , ( 'e', 'ⓔ' )
    , ( 'f', 'ⓕ' )
    , ( 'g', 'ⓖ' )
    , ( 'h', 'ⓗ' )
    , ( 'i', 'ⓘ' )
    , ( 'j', 'ⓙ' )
    , ( 'k', 'ⓚ' )
    , ( 'l', 'ⓛ' )
    , ( 'm', 'ⓜ' )
    , ( 'n', 'ⓝ' )
    , ( 'o', 'ⓞ' )
    , ( 'p', 'ⓟ' )
    , ( 'q', 'ⓠ' )
    , ( 'r', 'ⓡ' )
    , ( 's', 'ⓢ' )
    , ( 't', 'ⓣ' )
    , ( 'u', 'ⓤ' )
    , ( 'v', 'ⓥ' )
    , ( 'w', 'ⓦ' )
    , ( 'x', 'ⓧ' )
    , ( 'y', 'ⓨ' )
    , ( 'z', 'ⓩ' )
    , ( 'A', 'Ⓐ' )
    , ( 'B', 'Ⓑ' )
    , ( 'C', 'Ⓒ' )
    , ( 'D', 'Ⓓ' )
    , ( 'E', 'Ⓔ' )
    , ( 'F', 'Ⓕ' )
    , ( 'G', 'Ⓖ' )
    , ( 'H', 'Ⓗ' )
    , ( 'I', 'Ⓘ' )
    , ( 'J', 'Ⓙ' )
    , ( 'K', 'Ⓚ' )
    , ( 'L', 'Ⓛ' )
    , ( 'M', 'Ⓜ' )
    , ( 'N', 'Ⓝ' )
    , ( 'O', 'Ⓞ' )
    , ( 'P', 'Ⓟ' )
    , ( 'Q', 'Ⓠ' )
    , ( 'R', 'Ⓡ' )
    , ( 'S', 'Ⓢ' )
    , ( 'T', 'Ⓣ' )
    , ( 'U', 'Ⓤ' )
    , ( 'V', 'Ⓥ' )
    , ( 'W', 'Ⓦ' )
    , ( 'X', 'Ⓧ' )
    , ( 'Y', 'Ⓨ' )
    , ( 'Z', 'Ⓩ' )
    ]