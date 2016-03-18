module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Effects exposing (Effects, Never)
import Task
import StartApp
import Translator exposing (..)
import Translator.Types exposing (CharSet, stringToCharSetId)


-- Actions


type Action
  = NoOp
  | ChangeCharSet (Maybe Translator.Types.CharSetId)
  | ChangeText String



-- Model


type alias Model =
  { currentCharSetId : Translator.Types.CharSetId
  , text : String
  }


initialModel : Model
initialModel =
  { currentCharSetId = Translator.Types.Fraktur
  , text = ""
  }



-- Update


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model, Effects.none )

    ChangeCharSet (Just charSetId) ->
      ( { model | currentCharSetId = charSetId }, Effects.none )

    ChangeCharSet Nothing ->
      ( model, Effects.none )

    ChangeText text' ->
      ( { model | text = text' }, Effects.none )



-- View


view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ input
        [ type' "text"
        , placeholder "Type something here"
        , onTextInput address
        , value model.text
        ]
        []
    , select
        [ onCharSetChange address ]
        (List.map charSetOption Translator.charSets)
    , p [] [ text (Translator.translate model.currentCharSetId model.text) ]
    ]


charSetOption : CharSet -> Html
charSetOption charSet =
  let
    charSetName =
      Translator.translate charSet.id charSet.name
  in
    option [ value (toString charSet.id) ] [ text charSetName ]


onChange : (String -> Signal.Message) -> Attribute
onChange =
  on "change" targetValue


onCharSetChange : Signal.Address Action -> Attribute
onCharSetChange address =
  onChange (\string -> Signal.message address (ChangeCharSet (stringToCharSetId string)))


onTextInput : Signal.Address Action -> Attribute
onTextInput address =
  on "input" targetValue (\string -> Signal.message address (ChangeText string))



-- StartApp


init : ( Model, Effects Action )
init =
  ( initialModel, Effects.none )


app : StartApp.App Model
app =
  StartApp.start
    { init = init
    , inputs = []
    , update = update
    , view = view
    }


main : Signal.Signal Html
main =
  app.html


port runner : Signal (Task.Task Never ())
port runner =
  app.tasks
