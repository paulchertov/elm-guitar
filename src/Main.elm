import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelPick exposing (fromStringTest)
update msg model =
  model

view model =
  fromStringTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
