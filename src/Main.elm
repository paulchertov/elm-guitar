import Html exposing (beginnerProgram, text)

import Array

import Model.Model exposing (Model)
import Model.Pitch exposing (getExistingTuning)
import Model.Bar exposing (newBar)

import Update.Msg exposing (Msg)
import Update.Update exposing (update)

import View.View exposing (view)

newModel =
    { bars = Array.fromList [newBar]
    , tuning = getExistingTuning "EBGDAE"
    , error = ""
    , playing = False
    , selection = Model.Model.NothingSelected
    }

main =
  beginnerProgram { model = newModel, view = view, update = update }
