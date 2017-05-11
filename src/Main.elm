import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelPitch exposing (frequencyTest)
update msg model =
  model

view model =
  frequencyTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
