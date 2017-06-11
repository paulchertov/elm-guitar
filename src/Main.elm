import Html exposing (beginnerProgram, text)

import Update.Msg exposing (Msg)
import Model.Model exposing (Model, newModel)

import Tests.ModelBar exposing (barTest)
update msg model =
  model

view model =
  barTest

main =
  beginnerProgram { model = newModel, view = view, update = update }
