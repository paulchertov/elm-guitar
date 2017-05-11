import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelPitch exposing (stringTest)
update msg model =
  model

view model =
  stringTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
