import Html exposing (beginnerProgram, text)

import Array

import Update.Msg exposing (Msg)
import Model.Model exposing (Model)
import Model.Pitch exposing (getExistingTuning)
import Model.Bar exposing (newBar)

import View.View exposing (view)

newModel =
    { bars = Array.fromList [newBar]
    , tuning = getExistingTuning "EBGDAE"
    , error = ""
    , playing = False
    , selection = Model.Model.NothingSelected
    }
{-view model =
  eventTest model
-}
update msg model =
  model
main =
  beginnerProgram { model = newModel, view = view, update = update }
